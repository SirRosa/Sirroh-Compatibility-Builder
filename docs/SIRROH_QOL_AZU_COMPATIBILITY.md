# Compatibility assessment: Sirroh QOL Addon × AzuAutoStore × Recycle_N_Reclaim

## Input provenance (verified 2026-10-23)

- AzuAutoStore 3.1.7: uploaded `AzuAutoStore.dll`, 570,880 bytes, SHA-256 `a609e7209832fb96af11fe3a0f6c499d4ed54f599289d23df0826a51bde640ee`. The official Hexium 3.1.7 package was checked against this digest before publishing reconstructed C# and IL to `Extracted/QOL/To Adapt/AzuAutoStore__a609e72098/`.
- Recycle_N_Reclaim 1.4.5: uploaded DLL, 674,816 bytes, SHA-256 `362e0a417c28cf4ac1afe6db8a6fe35ea8daf7ff6dc5b71690b06b177c9d21fc`. Identical to the already extracted `Extracted/QOL/To Recreate/Recycle_N_Reclaim__362e0a417c/`.
- The reverse-engineered C# is a reconstruction; verify exact signatures in IL/runtime before shipping a Harmony bridge.
- This is a **static** compatibility review, not a measured gameplay performance benchmark.

## What each implementation actually does

### Sirroh QOL Addon (source `SirRosa/Sirroh-QOL-Addon`)

- `src/QolNearbyInventory.cs`: indexed `Dictionary<long,List<Container>> Cells`, 32-meter cells, 100-meter radius; 9 × 9 nearby-bucket lookup, no global scene iteration.
- `Execute(..., quick)`: uses a 2 ms cooperative budget, validates chest eligibility, looks for relevant items **before** requesting ownership, re-checks contents after ownership and saves only changed chests.
- One click/hotkey enters `StartArea(true)`. `StartArea(false)` is Restock (not provided by AzuAutoStore's `TryStore`).
- `src/QolFavorites.cs`: distinct favorites keyed by item shared name or a linear player slot index, stored in `SirrohQOLFavorites_<playerId>.txt`.
- `src/QolTrashReclaim.cs`: native Sirroh recycle logic with separate recipe/refund behavior.

### AzuAutoStore 3.1.7 (decompiled)

- `AzuAutoStore.Util/Functions.cs`: `Functions.TryStore()` performs manual player-inventory deposit into nearby containers. `TryStoreThisItem(ItemData,Inventory)` deposits a single item. Both pass through `StoreToContainer`. This is the appropriate candidate for an **optional** UI delegate, NOT `QuickStackPatch`.
- `AzuAutoStore.Util/Boxes.cs`: `Boxes.GetNearbyContainers<Player>` loops over **all tracked vanilla containers** and uses `Vector3.Distance` to select nearby ones, then creates/concatenates lists for modded drawers, backpacks/quivers. This is an O(number of tracked vanilla containers) selection, unlike Sirroh's local hash buckets. Do not assert it is faster.
- `AzuAutoStore.Interfaces/VanillaContainers.cs`: `TryStore`, `TryStoreThisItem` honor equipped items, configured hotbar/quick slots, and Azu's own favorites; item storage is integrated with its YAML permissions and other inventory implementations.
- `AzuAutoStore.Util/Functions.cs`: `StoreToContainer` handles in-use state, ownership path and optional MultiUserChest. The external native callback manages its own result text, ping and effects, so avoid duplicated Sirroh effects/messages.
- `AzuAutoStorePlugin.PlayerRange` defaults to **5 m**; `MustHaveExistingItemToPull` defaults **On**. Sirroh QOL quickstack currently uses **100 m**. Delegating without communicating this will silently change scope and possibly chest priority.
- `AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility/QuickStackPatch.cs` targets `QuickStack.QuickStackPlugin, QuickStack`; it is **Azu's compatibility patch for another QuickStack mod**, not the native deposit entrypoint.
- `AzuAutoStore.Patches.Favoriting/UserConfig.cs`: Azu favorites use `AzuAutoStore_player_<id>.dat`, with special support for Goldenrevolver and AzuEPI. Sirroh favorites are not automatically shared.

### Recycle_N_Reclaim 1.4.5 (already extracted)

- `Recycle_N_Reclaim.GamePatches.Recycling/Reclaimer.cs`: caches recipes; checks known recipes, stations, inventory capacity and enchanted/item-specific constraints; configurable yield; supports undo pathways through `RecycleUndoManager`.
- `Recycle_N_Reclaim.GamePatches.UI/InventoryGuiPatches.cs`: patches crafting panel UI and inventory updates; its own tabs can conflict visually with Sirroh's Recycle controls and craft interface.
- `Recycle_N_Reclaim.GamePatches.MarkAsTrash/InventoryGridButtonHandlingPatches.cs`: hooks inventory slot-click handling. Avoid competing click interception/overlay behavior.
- Sirroh's reclaim algorithm is **not semantically interchangeable** with Recycle_N_Reclaim defaults (refund rates, station checks, undo, enchantments).

## Recommended compatibility design

1. **Default**: keep Sirroh's own indexed, coroutine-backed QuickStack and Restock. Do not automatically replace them just because Azu is loaded.
2. Add a user-configurable `QuickStackBackend = Sirroh | AzuAutoStore` (default `Sirroh`). Show the selected backend and effective range in settings; when the plugin is absent, use Sirroh. Do not route Restock or Sort to Azu.
3. Soft-detect plugin GUID `Azumatt.AzuAutoStore` with BepInEx Chainloader; reflect/cache `AzuAutoStore.Util.Functions.TryStore()` **once** after discovery. If the method is missing/incompatible, report it and fall back without duplicating an in-flight operation. Never emulate the Period key.
4. Deduplicate input: in Azu mode, Sirroh Q button/click invokes the cached delegate exactly once, disables Sirroh's QuickStack coroutine and skips its own success/message/VFX. Azu's original shortcut remains independently configurable; warn if the user binds the same shortcut twice.
5. Favorites are a **blocking compatibility concern**, independently of backend selection: Azu's player storage could otherwise move items marked only in Sirroh's favorites. Integrate via a narrowly scoped Harmony predicate bridge (e.g. OR Sirroh favorite status into `UserConfig.IsItemNameOrSlotFavorited(ItemData)`) and test for all supported destination types; avoid rewriting either mod's binary favorites file. If a shared favorite check cannot be verified across drawers/backpacks, document and disable automatic bridge for those providers.
6. Respect server-side Azu configuration, player ownership, wards, MultiUserChest and permission checks; never bypass Azu's own internal transfer path.
7. For `Azumatt.Recycle_N_Reclaim`, prioritize hiding duplicate UI and suppressing conflicting interaction patches where safe. Keep separate backend semantics; only provide an optional `RecycleBackend` after a reliable single-item bridge (analysis + transaction + undo) is actually verified. Do not call Reclaimer methods without a correct analysis/context object.
8. Add feature-isolated compatibility classes so unloading/removing Azu or Reclaim never prevents Sirroh from loading. Resolve reflection metadata at init, not on each frame, and avoid hard assembly dependencies.

## Validation checklist (before enabling the delegate by default)

- Vanilla Sirroh only, Azu only, both loaded, with/without Recycle_N_Reclaim.
- Multiplayer two clients, dedicated server, busy containers, wards, MultiUserChest, shared-owner transfers.
- Favorite by item name and slot, hotbar, AzuEPI quickslots, backpacks, KG/Makail drawers.
- Verify no duplicate transfer, item loss, desync or stuck-open chest; ensure one action -> one result.
- Compare 10/100/1000 tracked containers and 5/100 m ranges using worst-frame time, GC allocations, ZDO/RPC traffic and items/sec. Measure both backends under equal conditions rather than presuming Azumatt is faster.
- Confirm no interference with RnR recycling tab, crafting-panel selection, drag-and-drop, recipes, item refunds and undo.

## Verdict

**Optional delegation makes sense for Azu's support of specialized inventory providers and its native network/concurrency rules, not as an unmeasured CPU optimization.** Sirroh's spatial index and 2 ms cooperative work budget make it preferable as the safe default for its 100 m quickstack. Azu's default 5 m and global tracked-container traversal are not equivalent.
