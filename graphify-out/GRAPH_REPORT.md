# Graph Report - .  (2026-05-03)

## Corpus Check
- Corpus is ~12,051 words - fits in a single context window. You may not need a graph.

## Summary
- 96 nodes · 54 edges · 6 communities detected
- Extraction: 22% EXTRACTED · 78% INFERRED · 0% AMBIGUOUS · INFERRED: 42 edges (avg confidence: 0.7)
- Token cost: 3,000 input · 1,500 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 7|Community 7]]

## God Nodes (most connected - your core abstractions)
1. `remove_map_func()` - 2 edges
2. `M.map()` - 2 edges
3. `README` - 2 edges
4. `LICENSE` - 2 edges
5. `AGENTS` - 2 edges
6. `markdown` - 2 edges
7. `telekasten` - 2 edges
8. `buffer_find` - 2 edges
9. `buffer_hooks` - 2 edges
10. `keymaps` - 2 edges

## Surprising Connections (you probably didn't know these)
- `init` --conceptually_related_to--> `README`  [INFERRED]
  /home/miasmaofplasma/.config/nvim/init.lua → /home/miasmaofplasma/.config/nvim/README.md
- `AGENTS` --conceptually_related_to--> `markdown`  [INFERRED]
  /home/miasmaofplasma/.config/nvim/AGENTS.md → /home/miasmaofplasma/.config/nvim/lua/custom/snippets/markdown.lua
- `lint` --conceptually_related_to--> `kickstart`  [INFERRED]
  /home/miasmaofplasma/.config/nvim/lua/kickstart/plugins/lint.lua → /home/miasmaofplasma/.config/nvim/doc/kickstart.txt
- `telekasten` --conceptually_related_to--> `nvim-dap-ui`  [INFERRED]
  /home/miasmaofplasma/.config/nvim/lua/custom/plugins/telekasten.lua → /home/miasmaofplasma/.config/nvim/lua/custom/plugins/nvim-dap-ui.lua
- `diagflow` --conceptually_related_to--> `copilot`  [INFERRED]
  /home/miasmaofplasma/.config/nvim/lua/custom/plugins/diagflow.lua → /home/miasmaofplasma/.config/nvim/lua/custom/plugins/copilot.lua

## Communities (45 total, 1 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.2
Nodes (10): AGENTS, LICENSE, README, init, markdown, telekasten, buffer_find, buffer_hooks (+2 more)

### Community 1 - "Community 1"
Cohesion: 0.2
Nodes (10): crates, init, luasnip, neorg, nvim-cmp, nvim-window, persisted, telekasten (+2 more)

### Community 2 - "Community 2"
Cohesion: 0.2
Nodes (10): copilot-cmp, diagflow, flash, neotest, nvim-dap-ui, nvim-dap, render-markdown, rustacean (+2 more)

### Community 3 - "Community 3"
Cohesion: 0.25
Nodes (8): kickstart, nixd, autopairs, debug, gitsigns, indent_line, lint, neo-tree

### Community 4 - "Community 4"
Cohesion: 0.29
Nodes (7): rust, telekasten, codecompanion.disabled, copilot, opencode, wtf, health

## Knowledge Gaps
- **6 isolated node(s):** `init`, `prompts`, `init`, `rust`, `nixd` (+1 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Are the 2 inferred relationships involving `README` (e.g. with `init` and `LICENSE`) actually correct?**
  _`README` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `LICENSE` (e.g. with `README` and `AGENTS`) actually correct?**
  _`LICENSE` has 2 INFERRED edges - model-reasoned connections that need verification._
- **Are the 2 inferred relationships involving `AGENTS` (e.g. with `LICENSE` and `markdown`) actually correct?**
  _`AGENTS` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `init`, `prompts`, `init` to the rest of the system?**
  _6 weakly-connected nodes found - possible documentation gaps or missing edges._