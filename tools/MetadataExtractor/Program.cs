using System.Collections;
using System.Reflection;
using System.Resources;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using Mono.Cecil;
using Mono.Cecil.Cil;

if (args.Length != 2)
{
    Console.Error.WriteLine("Usage: MetadataExtractor <assembly.dll> <output-directory>");
    return 2;
}
var input = Path.GetFullPath(args[0]);
var output = Path.GetFullPath(args[1]);
Directory.CreateDirectory(output);
Directory.CreateDirectory(Path.Combine(output, "embedded_resources"));

static string SafeName(string name)
{
    var clean = Regex.Replace(name, @"[^a-zA-Z0-9._-]", "_").Trim('.', '_');
    if (clean.Length > 170) clean = clean[..170];
    return string.IsNullOrEmpty(clean) ? "unnamed" : clean;
}
static object? ArgValue(CustomAttributeArgument a)
{
    if (a.Value is CustomAttributeArgument[] arr)
        return arr.Select(ArgValue).ToArray();
    if (a.Value is TypeReference tr)
        return tr.FullName;
    return a.Value?.ToString();
}
static object AttributeInfo(CustomAttribute a)
{
    // Cecil sometimes needs unavailable BepInEx/Valheim dependencies to deserialize
    // enum-valued attribute arguments. Never discard the rest of an assembly for this.
    try
    {
        return new
        {
            name = a.AttributeType.FullName,
            arguments = a.ConstructorArguments.Select(ArgValue).ToArray(),
            properties = a.Properties.Select(p => new { name = p.Name, value = ArgValue(p.Argument) }).ToArray(),
            fields = a.Fields.Select(f => new { name = f.Name, value = ArgValue(f.Argument) }).ToArray()
        };
    }
    catch (Exception e)
    {
        return new { name = a.AttributeType.FullName,
                     unresolvedArguments = true, reason = e.Message };
    }
}
static string Hash(byte[] b) => Convert.ToHexString(SHA256.HashData(b)).ToLowerInvariant();

try
{
    using var asm = AssemblyDefinition.ReadAssembly(input, new ReaderParameters
    {
        ReadSymbols = false, InMemory = true, ReadingMode = ReadingMode.Immediate
    });
    var methods = new List<object>();
    var types = new List<object>();
    var allCalls = new HashSet<string>(StringComparer.Ordinal);
    var allStrings = new HashSet<string>(StringComparer.Ordinal);
    var il = new StringBuilder();
    foreach (var module in asm.Modules)
    foreach (var type in module.GetTypes())
    {
        types.Add(new
        {
            name = type.FullName,
            baseType = type.BaseType?.FullName,
            visibility = type.Attributes.ToString(),
            interfaces = type.Interfaces.Select(i => i.InterfaceType.FullName).ToArray(),
            attributes = type.CustomAttributes.Select(AttributeInfo).ToArray(),
            fields = type.Fields.Select(f => new
            {
                name = f.Name, type = f.FieldType.FullName, attributes = f.Attributes.ToString(),
                constant = f.HasConstant ? f.Constant?.ToString() : null,
                decorators = f.CustomAttributes.Select(AttributeInfo).ToArray()
            }).ToArray(),
            properties = type.Properties.Select(p => new
            {
                name = p.Name, type = p.PropertyType.FullName,
                attributes = p.CustomAttributes.Select(AttributeInfo).ToArray()
            }).ToArray(),
            events = type.Events.Select(e => new { name = e.Name, type = e.EventType.FullName }).ToArray()
        });
        foreach (var m in type.Methods)
        {
            methods.Add(new
            {
                signature = m.FullName,
                visibility = m.Attributes.ToString(),
                returnType = m.ReturnType.FullName,
                parameters = m.Parameters.Select(p => new { name = p.Name, type = p.ParameterType.FullName }).ToArray(),
                attributes = m.CustomAttributes.Select(AttributeInfo).ToArray(),
                isPInvoke = m.IsPInvokeImpl,
                pinvoke = m.IsPInvokeImpl ? m.PInvokeInfo?.EntryPoint : null,
                hasBody = m.HasBody,
                instructions = m.HasBody ? m.Body.Instructions.Count : 0
            });
            if (!m.HasBody) continue;
            il.AppendLine($"\n// {m.FullName}");
            il.AppendLine($".locals {string.Join(", ", m.Body.Variables.Select(v => v.VariableType.FullName))}");
            foreach (var ins in m.Body.Instructions)
            {
                il.AppendLine(ins.ToString());
                if (ins.OpCode.Code == Code.Ldstr && ins.Operand is string s)
                    allStrings.Add(s);
                if (ins.Operand is MethodReference call)
                    allCalls.Add(call.FullName);
            }
            foreach (var handler in m.Body.ExceptionHandlers)
                il.AppendLine($"// EH {handler.HandlerType}: {handler.TryStart?.Offset} - {handler.TryEnd?.Offset} => {handler.HandlerStart?.Offset} - {handler.HandlerEnd?.Offset}");
        }
    }
    File.WriteAllText(Path.Combine(output, "instructions.il"), il.ToString(), Encoding.UTF8);
    var resources = new List<object>();
    var resourceIdx = 0;
    foreach (var module in asm.Modules)
    foreach (var resource in module.Resources)
    {
        var item = new Dictionary<string, object?>
        {
            ["name"] = resource.Name, ["type"] = resource.ResourceType.ToString(),
            ["attributes"] = resource.Attributes.ToString()
        };
        if (resource is EmbeddedResource embedded)
        {
            var fileName = $"{resourceIdx++:D4}_{SafeName(resource.Name)}";
            var dest = Path.Combine(output, "embedded_resources", fileName);
            try
            {
                using (var stream = embedded.GetResourceStream())
                using (var target = File.Create(dest)) stream.CopyTo(target);
                var bytes = File.ReadAllBytes(dest);
                item["file"] = fileName;
                item["size"] = bytes.Length;
                item["sha256"] = Hash(bytes);
                if (Path.GetExtension(resource.Name).Equals(".resources", StringComparison.OrdinalIgnoreCase))
                {
                    try
                    {
                        using var reader = new ResourceReader(new MemoryStream(bytes, writable: false));
                        var keys = reader.GetEnumerator();
                        var nested = new List<object>();
                        var subdir = Path.Combine(output, "embedded_resources", fileName + "_entries");
                        Directory.CreateDirectory(subdir);
                        var n = 0;
                        while (keys.MoveNext())
                        {
                            var key = (string)keys.Key;
                            reader.GetResourceData(key, out var typeName, out byte[] data);
                            // .NET ByteArray/Stream resource values encode a 4-byte length prefix.
                            if ((typeName == "ResourceTypeCode.ByteArray" || typeName == "ResourceTypeCode.Stream") && data.Length >= 4)
                            {
                                var length = BitConverter.ToInt32(data, 0);
                                if (length == data.Length - 4)
                                    data = data[4..];
                            }
                            var nestedName = $"{n++:D4}_{SafeName(key)}";
                            File.WriteAllBytes(Path.Combine(subdir, nestedName), data);
                            nested.Add(new { name = key, type = typeName, file = nestedName, size = data.Length });
                        }
                        item["dotnetResourceEntries"] = nested;
                    }
                    catch (Exception e) { item["dotnetResourceError"] = e.Message; }
                }
            }
            catch (Exception e) { item["error"] = e.ToString(); }
        }
        resources.Add(item);
    }
    var metadata = new
    {
        input = Path.GetFileName(input),
        assembly = asm.Name.FullName,
        version = asm.Name.Version?.ToString(),
        modules = asm.Modules.Select(m => new { name = m.Name, mvid = m.Mvid }).ToArray(),
        references = asm.Modules.SelectMany(m => m.AssemblyReferences)
            .Select(r => r.FullName).Distinct().OrderBy(x => x).ToArray(),
        attributes = asm.CustomAttributes.Select(AttributeInfo).ToArray(),
        types, methods, resources,
        calledMethods = allCalls.OrderBy(x => x).ToArray(),
        stringLiterals = allStrings.OrderBy(x => x).ToArray(),
        totals = new { types = types.Count, methods = methods.Count, strings = allStrings.Count,
                       calledMethods = allCalls.Count, resources = resources.Count }
    };
    File.WriteAllText(Path.Combine(output, "metadata.json"),
        JsonSerializer.Serialize(metadata, new JsonSerializerOptions { WriteIndented = true }), Encoding.UTF8);
    Console.WriteLine(JsonSerializer.Serialize(metadata.totals));
    return 0;
}
catch (Exception ex)
{
    Console.Error.WriteLine(ex);
    return 1;
}
