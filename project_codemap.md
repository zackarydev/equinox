---
name: Code Map
description: Where to find major systems by line number in prototype/index.html
type: reference
---

All code is in `prototype/index.html`. Key locations:

## Math / Noise / Terrain
- `mulberry32` (seeded RNG): ~121
- `simplex2`, `fbm`, `ridgedNoise`: ~147-198
- `terrainHeight`: ~200
- `buildTerrain` (mesh gen + kingdom placement): ~592
- `getTerrainY` / `getSmoothTerrainY`: ~886

## World Generation
- `randomizeKingdoms`: ~279
- Constants (WORLD_SIZE, TERRAIN_SEG, etc.): ~270-550
- Tree creation (`createPineTree`, `createBroadleafTree`, `createOakTree`, etc.): ~899-1252
- `createRock`: ~1253
- `createBuilding`: ~1286
- `createSettlement`: ~1373
- `generateSettlements`: ~2190

## Rendering / Lighting
- Deferred lights (`deferredLightsClear/Push/Render`): ~459-548
- Moon phases & constants: ~550
- `applyLighting` (day/night cycle colors): ~3302
- `updateBuildingLights`: ~4793
- Moon HUD: ~3755

## Camera & Player
- `updateCamera`: ~2375
- `updatePlayer`: ~3626
- Player collision (`resolvePlayerTrunkCollisions`, `resolvePlayerBuildingCollisions`): ~3559-3625
- Player attack / sword cleanse: `updatePlayerAttack` ~8573
- Stone delivery: `updatePlayerStoneDelivery` ~8732

## Path / Trampling System
- `worldToCell`, `trampleAt`, `getPathSpeedAt`: ~1524-1560
- `rebuildPathWalls`: ~1709

## Wind & Smoke
- `getWind`: ~3826
- `updateWind`: ~4060
- `updateChimneySmoke`: ~4471
- `spawnSmoke`: ~4668
- `windForSmoke`: ~4703
- `updateSmoke` (main particle loop): ~4860

## NPCs
- `createNPCMesh`: ~5188
- `spawnNPC`: ~5229
- `findNearestTree/Rock`: ~5274-5305
- `pickFarmSite` / `pickBuildSite`: ~5447-5558
- `moveNPC`: ~5620
- `updateNPCs` (state machine — IDLE, CHOP, GATHER, BUILD, FARM, etc.): ~5701
- `updateNPCsHomes`: ~6655

## Squirrels (tree planting)
- `createSquirrelMesh`: ~6738
- `updateSquirrels`: ~6960

## Night / Combat
- `getEffectiveAshenPower` / `getGhostPower`: ~7377, ~7946
- `createWraithMesh` / `spawnWraith`: ~7384-7480
- `updateNightMobs`: ~7529
- Ghost cloud: `updateGhostCloud` ~7989

## Contamination
- `contaminateBuilding`: ~8390
- `decontaminateBuilding`: ~8475
- `updateContamination`: ~8503

## Turrets
- `createTurretMesh`: ~8825
- `placeTurretSite`: ~8897
- `fireZapBeam`: ~8966
- `updateTurrets`: ~9020

## Main Loop
- `animate`: ~9122

## Controls
- WASD = move, Mouse = look, LMB hold = attack
- F = place turret, T = pause time, M = cycle moon
- G = toggle smoke, V = wind debug, X = axis HUD, B = collision debug
