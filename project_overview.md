---
name: Equinox/Eclipsed Overview
description: What the project is, tech stack, and how to run it
type: project
---

**Eclipsed** — a 3D open-world action RPG / living sim browser game prototype.

- Single-file prototype: `prototype/index.html` (~9200 lines)
- Pure vanilla JS + Three.js (v0.163.0), no build step
- Procedural audio via Web Audio API (no audio files)
- Run by opening `prototype/index.html` in a browser
- Design doc: `GDD_Eclipsed.md`

**Core concept:** Player is split by a solar eclipse into two beings — day form (sword combat) and night form (ghost). Two kingdoms, contamination/cleanse mechanic, NPC settlement simulation.

**Why:** Pre-0 prototype, rapid iteration in a single file is intentional.
**How to apply:** Don't suggest splitting into modules unless asked. All changes go in `prototype/index.html`.
