using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.RepresentationModel;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003Cdc7e3f41_002Dd757_002D408c_002D90ba_002Dac04281f8f60_003ELibYamlEventStream
{
	private readonly _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser;

	public _003Cdc7e3f41_002Dd757_002D408c_002D90ba_002Dac04281f8f60_003ELibYamlEventStream(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser iParser)
	{
		parser = iParser ?? throw new ArgumentNullException("iParser");
	}

	public void WriteTo(TextWriter textWriter)
	{
		while (parser.MoveNext())
		{
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent current = parser.Current;
			if (!(current is _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias obj))
			{
				if (!(current is _003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd obj2))
				{
					if (!(current is _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart obj3))
					{
						if (!(current is _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd))
						{
							if (!(current is _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart nodeEvent))
							{
								if (!(current is _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar obj4))
								{
									if (!(current is _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd))
									{
										if (!(current is _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart nodeEvent2))
										{
											if (!(current is _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd))
											{
												if (current is _003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart)
												{
													textWriter.Write("+STR");
												}
											}
											else
											{
												textWriter.Write("-STR");
											}
										}
										else
										{
											textWriter.Write("+SEQ");
											WriteAnchorAndTag(textWriter, nodeEvent2);
										}
									}
									else
									{
										textWriter.Write("-SEQ");
									}
								}
								else
								{
									textWriter.Write("=VAL");
									WriteAnchorAndTag(textWriter, obj4);
									switch (obj4.Style)
									{
									case _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted:
										textWriter.Write(" \"");
										break;
									case _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.SingleQuoted:
										textWriter.Write(" '");
										break;
									case _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Folded:
										textWriter.Write(" >");
										break;
									case _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Literal:
										textWriter.Write(" |");
										break;
									default:
										textWriter.Write(" :");
										break;
									}
									string value = obj4.Value;
									foreach (char c in value)
									{
										switch (c)
										{
										case '\b':
											textWriter.Write("\\b");
											break;
										case '\t':
											textWriter.Write("\\t");
											break;
										case '\n':
											textWriter.Write("\\n");
											break;
										case '\r':
											textWriter.Write("\\r");
											break;
										case '\\':
											textWriter.Write("\\\\");
											break;
										default:
											textWriter.Write(c);
											break;
										}
									}
								}
							}
							else
							{
								textWriter.Write("+MAP");
								WriteAnchorAndTag(textWriter, nodeEvent);
							}
						}
						else
						{
							textWriter.Write("-MAP");
						}
					}
					else
					{
						textWriter.Write("+DOC");
						if (!obj3.IsImplicit)
						{
							textWriter.Write(" ---");
						}
					}
				}
				else
				{
					textWriter.Write("-DOC");
					if (!obj2.IsImplicit)
					{
						textWriter.Write(" ...");
					}
				}
			}
			else
			{
				textWriter.Write("=ALI *");
				textWriter.Write(obj.Value);
			}
			textWriter.WriteLine();
		}
	}

	private static void WriteAnchorAndTag(TextWriter textWriter, _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent)
	{
		if (!nodeEvent.Anchor.IsEmpty)
		{
			textWriter.Write(" &");
			textWriter.Write(nodeEvent.Anchor);
		}
		if (!nodeEvent.Tag.IsEmpty)
		{
			textWriter.Write(" <");
			textWriter.Write(nodeEvent.Tag.Value);
			textWriter.Write(">");
		}
	}
}
