# ECLIPSED
## Game Design Document — v0.6
*Confidential / Working Draft*

---

## Table of Contents
1. Vision Statement
2. The Story
3. Core Concept
4. Characters
5. World & Setting
6. The Kingdom Simulation
7. Combat
8. Open World
9. The Influence System
10. The Micro-Generative Layer
11. Art Direction
12. Technical Architecture
13. Scope & Milestones
14. Open Questions

---

## 1. Vision Statement

**ECLIPSED** is an open-world action RPG and living simulation about a self in conflict with itself. A person, fractured by a total solar eclipse, operates as two separate beings — one by day, one by night — across a world of two kingdoms simply trying to live. The day self builds, connects, protects. The night self consumes, dismantles, moves through the world like smoke. Neither remembers the other. The world remembers both.

The game's central revelation is not a plot twist. It is a moment of recognition — the feeling of looking in the mirror after a bad night and understanding, without comfort, that both versions of you are you.

At the end, the world keeps going. The player decides what it means.

**Core philosophy:**
- The world is not waiting for the player. It has its own momentum.
- The game never judges. It only remembers.
- Costs reveal themselves through absence, never through warning.
- Neither kingdom is good or evil. The player's framing creates that illusion.
- There is no fixed outcome. The player decides what the ending means.
- The self is given, not chosen. The character is randomly generated.

**Genre:** Open World Action RPG / Living World Simulation
**Engine:** Bevy (Rust), WASM + native Linux / Mac / Windows
**Runtime:** 2–3 hours per playthrough
**World:** Fully randomized each run — terrain, kingdoms, relations, character appearance
**Replayability:** High — randomized world each run; post-reveal knowledge transforms second playthrough

---

## 2. The Story

This is not really a fantasy story. The fantasy is the metaphor.

It is a story about the part of you that burns bright at night and the part of you that has to live with the consequences in the morning. The hangover. The sent message you regret. The money spent. The bridge burned. Waking up and inheriting the decisions of the version of yourself that existed eight hours ago.

The eclipse doesn't create two people. It makes the split visible — and consequential in the world in a way that it normally only is internally.

The two kingdoms are not cosmically opposed. They are two communities this fractured person moves through. The day community — people who depend on the responsible version. The night community — people shaped by the other version, who benefit from it or are consumed by it. Neither is innocent. Neither is evil. They are just people trying to live.

The tone is not solemn mythology. It has moments of dark comedy — the Dawnkeeper arriving somewhere, finding it in a state they don't understand, piecing together what happened the way you piece together a night you don't remember from the evidence left behind. Empty granaries. A stranger's campfire, still warm. Someone who won't look you in the eye.

The reveal lands not like a surprise but like recognition. The player understood before the game confirmed it. The world already told them.

At convergence, the Eclipsed One reforms. The camera pulls back. Both kingdoms are visible — settlements lit or dark, evidence of everything spread across the landscape. No music sting. No text. The world at dusk, continuing. The player sees what they made. They decide what it means.

**The question the game asks:** What if the side you were on was just the side you woke up on?

**The question the game leaves unanswered:** What do you do with that?

---

## 3. Core Concept

### Structure

- **Act One:** The Eclipsed One — randomly generated, whole — moves through a world already in motion. Two kingdoms are building and expanding. The player is a powerful outside force, not central to either kingdom's story. They explore, fight, build an outpost at the world's center. Soft narrative gates — danger scaling, simulation state — guide the player outward naturally.

- **The Eclipse:** End of Act One. The player stands at their outpost. Light fails. No cutscene. The character kneels. The player wakes somewhere else — inside one of the kingdoms, as someone who belongs.

- **Acts Two & Three:** Day and night alternate. The Dawnkeeper operates from Kingdom A, surrounded by its warmth. The Ashen drifts through Kingdom B as smoke. Both have full freedom — the open world always accessible, simulation always running. As the characters approach the center, worlds bleed into each other visually and mechanically.

- **The Convergence:** Both characters approach the outpost. Visual layers merge. The Eclipsed One reforms. Camera pulls back. The world continues.

### The Framing Is the Lie

Kingdom A and Kingdom B are procedurally generated to be morally equivalent — same drives, different aesthetics. The Dawnkeeper wakes in Kingdom A's warmth and reads Kingdom B as the threat. The Ashen wakes in Kingdom B's hunger and reads Kingdom A as the oppressor.

Both framings are constructed by the environment. Both are partially true. Neither is the whole picture.

A player who destroys a Kingdom B settlement as the Dawnkeeper and a player who consumes a Kingdom A village as the Ashen have done the same thing to the same world. The game applies no different moral weight.

### Player Independence

The player is not the hero of this world. The kingdoms have ongoing processes whether or not the player engages. The world state at convergence reflects simulation activity and player intervention together — neither alone determines it.

---

## 4. Characters

### The Eclipsed One (Act One / Convergence)
Randomly generated — face, build, coloring. Not customizable. The character is given, not chosen. Whole in Act One, the fracture latent. At convergence they reform in the world they made.

### The Dawnkeeper (Day — Acts Two & Three)
The Eclipsed One in daylight. Same generated face, Kingdom A's warm colors. Combat pushes outward — knockback, area denial, arcing strikes, creating distance between harm and the world. Does not remember the night.

### The Ashen (Night — Acts Two & Three)
The Eclipsed One at night. The same generated face visible occasionally through smoke and phosphorescence — a flicker before it dissolves. Combat pulls inward — draws enemies close, chains through proximity, uses their momentum. Does not remember the day.

### NPCs
Individual, named, readable. Visible local goals. Not quest-givers. They just live — and react, locally, to what the player does near them. Kingdom A NPCs are individually legible; Kingdom B NPCs are the same simulation fidelity through a different visual lens. Neither less human. Neither less deserving.

### The Child
One per kingdom, or the same child — the game does not say. Reacts with something beyond local context. Looks where the player was a moment ago. The game never confirms what they know.

---

## 5. World & Setting

### Procedural Generation

Every run randomizes: terrain, Kingdom A and B positions and starting sizes, starting relation (NEUTRAL / TENSION / CONFLICT), resource distribution, eclipse point location within map center, Eclipsed One appearance, day/night cycle length.

Fixed across runs: eclipse at end of Act One, convergence at the Act One outpost, Dawnkeeper in Kingdom A, Ashen in Kingdom B, no fixed ending imposed.

Constraints ensure playability: eclipse point reachable within Act One, kingdoms don't overlap at start, minimum resources sustain both kingdoms, danger scaling makes center naturally inhospitable early.

### No Map

Navigation through landmarks, terrain memory, settlement clusters, influence direction. No minimap. No fast travel. The player builds a mental model across the whole playthrough. The convergence is the moment that model completes.

### Soft Narrative Gates

Always technically open. Gates are simulation-based: the center is the most dangerous terrain early, certain simulation states must exist before story moments trigger. The world nudges without forcing.

### Atmosphere

**Kingdom A:** Amber light, long directional shadows, productive ambient sound. NPCs named and individually readable.

**Kingdom B:** Cool blue-grey phosphorescence, localized light, atmospheric fog. Quieter, more textural. NPCs same simulation fidelity, subtly less individually legible — a different lens, not lesser people.

Neither kingdom is coded as evil. Both beautiful in their own register.

---

## 6. The Kingdom Simulation

### Philosophy

Simple reactive simulation. Visible ongoing processes, player-triggered reactions, no independent advancement when player is absent. The world looks like it has been running. It doesn't need to actually run continuously.

### Resource Chains

Food flows visibly between nodes — farm, granary, market — via NPC carriers on visible paths. The player can interrupt at any point. A carrier killed means the delivery doesn't happen. A farm destroyed means the chain has no source. The settlement degrades accordingly. Underneath: scheduled state transfers with visible actors. The player never needs to know the difference.

### NPC Goal Legibility

Every NPC has a visible local goal readable without dialogue. NPCs moving timber toward a wall → building. NPC watching the treeline → guarding. NPC moving between buildings with containers → transporting. Intention is readable from behavior.

### Settlement States (No UI)

Five states, communicated entirely through art:

1. **Thriving** — Heavy crops, sealed granary, multiple chimneys smoking, NPCs purposeful and upright.
2. **Stable** — Mid-height crops, normal pace, projects ongoing but unhurried.
3. **Stalled** — Incomplete structure darkening with exposure, fewer active NPCs, granary partially open.
4. **Damaged** — Sparse crops, slow hesitant NPCs, granary open and dim, weeds at margins.
5. **Empty** — Structures intact. No smoke. No movement. No sound. Crops rotting. Light falling on nothing living. A held breath.

### Kingdom Memory

Local and contextual — not global. Each settlement remembers what the player did there. No kingdom-wide reputation.

---

## 7. Combat

### Philosophy

Fast, fluid, real-time. The simulation keeps running during combat. Momentum is the resource. Combat is never required but is the fastest way to alter world state. Defeated NPCs do not respawn.

### Feel

Dodge, slash, chain combos, momentum-based. Reference: Hades (movement feel), Devil May Cry (chain expressiveness). The player is a destabilizing force — powerful relative to individual NPCs. Every hit lands with weight. Enemies react physically.

### Character Signatures

**Dawnkeeper:** Hits outward. Pushes enemies away, creates space, arcing strikes, knockback. Building radius with each chain.

**Ashen:** Hits inward. Pulls enemies close, chains through proximity, uses their momentum. Consuming the space around them.

Same fluidity. Opposite geometry. The difference tells the player what each character is without dialogue.

---

## 8. Open World

### Navigation

No map, no minimap, no fast travel. Kingdom A's amber warmth and Kingdom B's phosphorescence are visible from distance — the player orients by color temperature and landmark memory. The eclipse point is visible from far away as a geographic stillness — a natural clearing where simulation activity quiets. The player is drawn to look at it long before they can safely approach.

### Day/Night Cycle

Runs continuously. Day gives the Dawnkeeper; night gives the Ashen. Dusk and dawn are brief transition periods where visual layers show traces of each other. Cycle length is a generation parameter — varies between runs, fixed within a run.

### The Outpost

Built by the Eclipsed One at the world's center in Act One. Belongs to neither kingdom. Exists in both layers in Acts Two and Three. The Dawnkeeper finds it and doesn't know who built it. The Ashen finds it and doesn't know who built it. Both feel a pull toward it. At convergence, both arrive here. It is the only point in the world unchanged by either character or either kingdom.

---

## 9. The Influence System

The player emits a personal influence radius from their character and from structures they build, separate from kingdom settlement health.

**Dawnkeeper influence:** Warm amber-gold.
**Ashen influence:** Cool blue-grey phosphorescence.

Grows through building, upgrading, and NPC population near player structures.

### Hidden Costs

Some actions have costs not shown at the moment of choice. The Ashen's consumption shows immediate gain; the settlement's reduced growth ceiling is not shown. Building with found materials expands the structure; the source is empty on return. No feedback at the moment of cost — only discovery through return.

### At Convergence

In Act Three the two radii overlap — a contested interference zone, neither palette resolving. The distribution of influence at convergence shapes the final pullback shot. This is the ending. The player reads it themselves.

---

## 10. The Micro-Generative Layer

### What It Is

A context-aware placement director that runs once at world generation time, after the procedural generator has placed terrain and assets. Its job is not to generate the world. Its job is to make the world feel like no human arranged it.

It handles boundaries, transitions, and seams that mechanical placement always gets wrong. Given a description of the scene and a visual snapshot of it, it selects from a pre-built library of transition assets and specifies their placement parameters — producing a world that feels found rather than constructed. No runtime cost after generation.

### Architecture: Multimodal Director + Asset Library

The model is not a geometry generator. It is a **placement director**. It thinks like an environment artist: it looks at the scene, reads the context, and makes curatorial decisions about which transition pieces belong where.

**Input — two streams combined:**
1. **Structured scene data:** What asset was placed, its coordinates, ground type, kingdom, adjacent assets, available transition library.
2. **Visual snapshot:** A rendered image of the scene at those coordinates, showing the current hard seam between the new asset and the existing world.

The structured data tells the model facts. The visual snapshot tells it things facts can't: the lighting angle, how existing assets read together, color temperature, whether the scene is sparse or busy.

**Output — placement decisions (JSON):**
```json
{
  "reasoning": "Earth banks front face; rocks at corners; moss in sheltered spots",
  "placements": [
    { "asset": "earth_bank",    "params": { "x": 3.5, "y": 4.65, "width": 0.85, "height": 0.20, "side": "front" }},
    { "asset": "rock_cluster",  "params": { "x": 3.2, "y": 4.55, "scale": 0.17, "count": 2 }},
    { "asset": "moss_patch",    "params": { "x": 3.4, "y": 4.75, "radius": 0.28 }}
  ]
}
```

### Transition Asset Library

Pre-built, art-directed assets the model selects from and parameterizes:

- **earth_bank** — wedge of soil banking up against a structure base
- **rock_cluster** — 1–4 low-poly rocks, corner-weighted
- **moss_patch** — irregular moss growth in sheltered spots
- **gravel_scatter** — loose stone at structure bases and path edges
- **worn_path** — faint track worn along frequently traversed routes
- **root_exposure** — tree roots surfacing near mature structures
- **grass_tuft** — sparse grass at wall bases and foundation gaps

Library expands as new asset types require integration. Adding a new asset type means adding transition assets for its seam types, not retraining the model.

### What It Does

**Asset-ground fusion:** Where a placed asset meets terrain — wall, building, rock — transition assets make the object feel like it has been in the world long enough for the world to grow around it. An older wall in a thriving settlement: deep soil banking, moss in sheltered corners. A newly built wall in a stalled settlement: raw earth, minimal growth. Age derived from simulation state — no new data required.

**Boundary blending:** Where biomes or influence zones meet, the model places transition geometry removing hard mechanical edges. The right scrub growth, ground color shift, rock scatter at margins.

**Organic insertion:** Details the simulation has no opinion about but the eye requires. A worn cart track between connected settlements. A stone cluster on a hillcrest. A fallen log near a riverbed. The world feels inhabited before the player sees an NPC.

**State blending:** When a settlement changes state, visual transitions distribute naturally across specific geometry rather than snapping between pre-built configurations.

### Implementation Strategy

**Phase 1 — API model at generation time (current target):**
At world generation, the system renders a snapshot of each placement site, sends it with structured context to a vision-language model (Claude), and receives placement decisions as JSON. The API is called once per world generation — never during gameplay. Output is baked into the world state. Latency acceptable at load time.

This validates whether multimodal context (visual + structured) produces meaningfully better integration than rules-based placement — before committing to training a local model.

**Phase 2 — Local small vision model (post-validation):**
Once the API approach confirms the concept, replace the API call with a local small vision model (2–5M parameters) trained on the API model's outputs. CNN encoder processes the visual snapshot into a feature vector; concatenated with structured scene data; small MLP head outputs asset selection and placement parameters. Runs offline, WASM-compatible, no API dependency in shipped game.

**Validation gate:** Does the API model produce placement decisions that read as environment artist judgments — not random, not mechanical? If yes, the local model has a clear training target.

### POC Status (March 2026)

Working Python prototype demonstrates the full pipeline:
- Renders naive scene (hard seam, no integration)
- Takes visual snapshot
- Sends snapshot + structured context to Claude vision API
- Parses placement decisions from JSON response
- Applies transition assets to scene
- Renders integrated result

Visual difference between naive and integrated is clear and immediate — the proof-of-concept argument for the system. Shading quality in the POC is limited by the software rasterizer; this is not a concern in Bevy with a real renderer.

---

## 11. Art Direction

### Visual Style

Low poly 3D. Fixed camera at approximately 65° top-down angle. 4-layer parallax. Lighting is the emotional narrator — geometry is simple, lighting does the work.

**Parallax layers:**
1. Foreground — character, immediate terrain, combat space
2. Midground — NPCs, settlement structures, resource chains
3. Background — treelines, distant hills, kingdom-scale structures
4. Sky/Atmosphere — dynamic; primary carrier of time-of-day, kingdom aesthetic, convergence bleed

### Lighting States

- **Act One:** Golden hour. Warm but fading. Something whole that won't last.
- **Dawnkeeper:** Morning to afternoon. Clean directional sun. Shadows legible and predictable.
- **Ashen:** Dusk to deep night. Localized sources. Phosphorescent glow as primary illumination.
- **Convergence:** Both schemes bleeding into each other. Neither resolves.

### NPC Animation

Two states driven by simulation health values:
- **Healthy:** Purposeful pace, upright posture, goal-directed.
- **Depleted:** Slower, heavier, hesitant. Hunger and damage in the body's movement. The player reads settlement health through NPC bodies.

### The Ashen

Smoke and phosphorescent drift with the Eclipsed One's generated face visible occasionally — a flicker through the dark, present then gone. Not horror. Like a person seen through frosted glass. The face appearing briefly is the game's most important planted clue.

### The Moon

The moon must be a cental art element, it dictates the strength of the characters. 

### Asset Fusion

Every placed asset has micro-generative seam geometry fusing it to terrain. No asset sits mechanically on flat ground. The degree of fusion reflects asset age derived from simulation state.

### UI

As close to zero as possible. No health bars, resource counters, quest markers, minimap, status icons, morality meter, or numerical display of any kind. The world communicates everything.

---

## 12. Technical Architecture

### Why Bevy

ECS is the natural architecture for this simulation. Every NPC is an entity. Every settlement property is a component. Systems run over matching entities. Compiles to WASM natively — same codebase ships to browser, Linux, Mac, Windows.

### Core ECS Components

```rust
// NPC
struct Hunger { level: f32, rate: f32 }
struct CurrentTask { task: Task }       // IDLE | CARRY | BUILD | GUARD | HARVEST
struct CarryingResource { resource: ResourceType, amount: u32 }
struct Destination { target: Vec2 }
struct SettlementMember { settlement: Entity }

// Settlement
struct Settlement {
    state: SettlementState,
    population: u32,
    kingdom: KingdomId,
    growth_ceiling: f32,
    age: f32,                           // Input to micro-generative layer
    depletion_flag: bool,
}
struct ResourceNode { resource: ResourceType, amount: u32, capacity: u32 }
struct LocalMemory { last_player_interaction: InteractionType }

// Player
struct PlayerCharacter { form: CharacterForm }  // ECLIPSED | DAWNKEEPER | ASHEN
struct InfluenceRadius { radius: f32, influence_type: InfluenceType }
struct CombatState { velocity: Vec2, chain_count: u32, momentum: f32 }
```

### Systems

```
Simulation (continuous tick):
  HungerSystem, TaskSystem, TransportSystem,
  DeliverySystem, SettlementStateSystem, DayCycleSystem

Reaction (on player action):
  CombatReactionSystem, BuildSystem,
  ConsumptionSystem, PlayerProximitySystem

Narrative (on condition):
  EclipseSystem, ConvergenceSystem, DeferredCostSystem

Micro-Generative (once at world generation):
  AssetFusionSystem, BoundaryBlendSystem,
  OrganicInsertionSystem, StateBlendSystem

Render (every frame):
  LightingSystem, AtmosphereSystem,
  NPCAnimationSystem, InfluenceVisualSystem
```

### World Seed

```rust
struct WorldSeed {
    terrain_seed: u64,
    kingdom_a_seed: u64,
    kingdom_b_seed: u64,
    relation_seed: u64,
    resource_seed: u64,
    character_seed: u64,
    cycle_length_seed: u64,
}
```

### Save System

Single slot. ECS world state serialized to disk / browser localStorage. Silently tracks world state history, influence distributions, settlement states at convergence, consumption vs. construction ratio. Feeds final pullback shot. Nothing displayed during run.

---

## 13. Scope & Milestones

### Phase Pre-0 — Three.js Visual Prototyping (2–3 sessions, in progress)
Browser-based prototyping in Three.js before committing to Bevy. Validates visual targets cheaply. Output is a visual brief, not shippable code.

- [ ] Procedural terrain generator — domain-warped FBM, ridged noise, exponential peak boost
- [ ] Two kingdom zones with distinct color palettes
- [ ] Pine and broadleaf tree placement via noise clustering
- [ ] Scattered rock geometry
- [ ] Settlement building clusters with perimeter wall fragments
- [ ] Day / dusk / night lighting presets
- [ ] Third-person camera, close-up view
- [ ] Settlement silhouette variety — distinct Kingdom A vs B read at distance
- [ ] River / water body cutting valleys
- [ ] One day/night atmospheric transition feeling correct
- [ ] Camera feel locked: the game's camera, not a preview camera

**Gate:** Can you hand this to an artist and say "this is the visual target"? If yes, move to Bevy.

### Phase 0 — Proof of Concept in Bevy (4–6 weeks)
- [ ] Bevy project with basic ECS
- [ ] Terrain generator ported from Three.js prototype
- [ ] One settlement across all five states, art-complete
- [ ] Three NPCs running TaskSystem and TransportSystem
- [ ] One resource chain (farm → carrier → market) functional
- [ ] Day/night lighting transition
- [ ] Camera at correct angle with 4-layer parallax
- [ ] **Micro-generative: asset library + API placement director**
  - [ ] Transition asset library built (earth_bank, rock_cluster, moss_patch, gravel_scatter, worn_path)
  - [ ] PlacementSite context struct defined
  - [ ] API call pipeline wired (render snapshot → Claude vision → parse JSON → apply assets)
  - [ ] Visual validation: does API placement read as environment artist judgment?
  - [ ] Gate for local model: is API output consistent enough to train on?

**Gate:** Does settlement state read without UI in under 15 seconds? Does the wall look like it belongs to the ground?

### Phase 1 — Vertical Slice (8–10 weeks)
- [ ] World generator with two kingdom starting positions
- [ ] Act One playable (~15 minutes)
- [ ] Fluid real-time combat — both characters feel distinct
- [ ] Eclipse transition
- [ ] One Dawnkeeper and one Ashen sequence in same zone
- [ ] One hidden cost demonstrated end-to-end
- [ ] Ashen smoke visual with face flicker
- [ ] Micro-generative: local vision model trained on Phase 0 API outputs, replacing API call

**Gate:** Does the same zone read as genuinely different between characters? Does the hidden cost land on return?

### Phase 2 — Alpha (12–14 weeks)
- [ ] Full Act Two content
- [ ] All five settlement states art-complete for both kingdoms
- [ ] Soft gates tuned
- [ ] Influence system complete
- [ ] Overlap System rough pass
- [ ] Convergence detection and pullback shot working
- [ ] Organic insertion active across full world

**Gate:** When do playtesters start to suspect? Target: late Act Two.

### Phase 3 — Beta (8–10 weeks)
- [ ] Act Three complete with convergence zone
- [ ] Final pullback shot reads without explanation
- [ ] Adaptive music (same melody, two arrangements, convergence bleed)
- [ ] 20+ seeds stress-tested
- [ ] 8–10 blind playtests

**Gate:** Does the reveal land as recognition? Does the pullback shot communicate without text?

### Phase 4 — Polish & Ship (4–6 weeks)
- [ ] Final balance pass
- [ ] Accessibility options (colorblind support, combat speed)
- [ ] WASM build optimized
- [ ] Steam page and trailer
- [ ] Press / influencer build

---

## 14. Open Questions

1. **Story document.** Narrative bible to be written separately — characters, world texture, the moments that matter, composer brief.

2. **Ashen consumption visual.** Fluid, brief, ambiguous enough that a first-time player isn't certain what they just did.

3. **The Child(ren).** One entity appearing impossibly in both kingdoms, or two visually similar children? The game should not answer. The art must decide how similar without explaining.

4. **Music identity.** Same underlying melody, two kingdom arrangements. Detectable in Act Two by an attentive ear. Undeniable at convergence. Brief should come from the story document, not the GDD.

5. **Cycle length range.** Too short feels fragmented; too long loses Act Two momentum. Calibrate through playtesting.

6. **What the Ashen builds.** Phosphorescent, consumption-based. Beautiful in its own register. The game does not editorialize about which kind of growth is correct.

7. **Rust learning curve.** Budget 4–6 weeks of Bevy/Rust orientation. Consider prototyping the simulation in TypeScript first — ECS concepts transfer directly, and validating simulation design before porting reduces risk.

8. **Micro-generative local model.** Architecture validated via API prototype (Claude vision + asset library). Training data source = API model outputs. Local model target: CNN encoder + structured data + MLP placement head, ~2–5M parameters, WASM-compatible via `tract`.

9. **Replay variety.** Starting kingdom relation (neutral / tension / conflict) is the highest-value generation variable after terrain. Different relations change what the player walks into entirely.

10. **Three.js → Bevy terrain port.** Domain-warped FBM + ridged noise terrain generation is validated in Three.js. Port is straightforward — same algorithm, Rust implementation. The Three.js prototype is the visual specification, not the architecture.

---

*Document maintained by: [Your Name]*
*Last updated: March 2026 — v0.6*
*Changes from v0.5: Section 10 micro-generative architecture revised (multimodal director + asset library, API-first strategy). Section 13 milestones revised (Three.js prototyping phase added, Phase 0 micro-generative tasks updated). Open questions 8–10 updated.*
*Next review: After Three.js visual prototype gates (settlement silhouette, river, camera feel)*
