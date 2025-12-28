# blackroad-os-master 🧠🛣️

> **Master Orchestrator** – High-level coordination layer and "control book" for the entire BlackRoad OS constellation.

---

## 🎯 Mission

- Act as the **meta-brain** that knows about *all* BlackRoad OS repos, services, packs, and agents
- Define orchestration plans, registries, and cross-repo automation patterns
- Give humans + agents a single place to understand + drive the whole OS at the "big picture" level

---

## 📁 Repository Structure

```
blackroad-os-master/
├── registries/          🧭 System maps & registries
│   ├── repos.json           Master registry of repos → services → domains → envs
│   └── ownership.json       Mapping of teams/agents → ownership areas
├── playbooks/           📓 Orchestration playbooks
│   ├── new-pack.md          Spin up a new pack
│   ├── new-environment.md   Launch a new environment
│   └── release-train.md     Full OS release train
├── config/              🧬 Config + spec for automation
│   ├── automation.json      High-level configs for automation/agents
│   └── agent-lanes.json     Lanes + guardrails for agent fleets
├── status/              📊 Meta-status views
│   └── summary.json         Summary status of major subsystems
├── templates/           📋 Reusable templates & knowledge base
│   ├── status-lights/       🚦 GreenLight, YellowLight, RedLight templates
│   └── codex/               📚 BlackRoad Codex (ADRs, patterns, practices, glossary)
├── schemas/             🧬 JSON schemas for validation
│   ├── repos.schema.json
│   ├── ownership.schema.json
│   └── automation.schema.json
└── README.md            📋 This file
```

---

## 🏗️ What We Own ✅

### 🧭 System Maps & Registries
- Master registry of repos → services → domains → envs ☁️
- Mapping of teams/agents → ownership areas (core, web, api, infra, packs, etc.) 🧑‍💻🤖
- "Source of truth" list for core components 📋

### 📓 Orchestration Playbooks
- Cross-repo workflows (e.g., "spin up a new pack," "launch a new environment," "full OS release train") 🚂
- Checklists and step sequences that span multiple repos 💫
- Links/hooks for operator jobs & Prism dashboards to implement these flows ⚙️🕹️

### 🧬 Config + Spec for Automation
- High-level configs that automation/agents read (e.g., which repos are "core", which packs are "live", which envs are allowed) 🧬
- Lanes + guardrails for agent fleets (what categories of changes they can do and where) 🤖
- Definitions of labels/fields/statuses used in org-wide GitHub Projects or Agent Hub 🏷️

### 📊 Meta-Status Views (Lightweight)
- Summary status: which major subsystems are "ready", "in progress", "experimental" 🟢🟡🟠
- Links to deeper status in `prism-console`, `archive`, `infra`, `operator` 📡

### 🚦 Status Light Templates
- **GreenLight** (🟢) - Production-ready, stable, fully operational
- **YellowLight** (🟡) - In-progress, under development, needs attention
- **RedLight** (🔴) - Blocked, critical issues, immediate action needed
- Standardized criteria and checklists for status assessment

### 📚 BlackRoad Codex
- **Decisions** - Architecture Decision Records (ADRs) documenting key choices
- **Patterns** - Reusable solutions to common problems across the constellation
- **Practices** - Team conventions and best practices for consistency
- **Glossary** - Definitions of terms, acronyms, and concepts used ecosystem-wide

---

## 🚫 What We Do NOT Own

| Area | Owned By | Emoji |
|------|----------|-------|
| App logic | `blackroad-os-core`, `-web`, `-api`, packs | 💻 |
| Edge gateway behavior | `blackroad-os-api-gateway` | 🌉 |
| Infra-as-code | `blackroad-os-infra` | ☁️ |
| Job implementation | `blackroad-os-operator` | ⚙️ |
| Runtime dashboards | `blackroad-os-prism-console` | 🕹️ |
| Docs / brand / home / research content | Those repos directly | 📚🎨🏠🧪 |

---

## 📋 Core Components Registry

The following are the **source of truth** core components of BlackRoad OS:

| Component | Repository | Domain |
|-----------|------------|--------|
| Core | `blackroad-os-core` | Core business logic |
| Web | `blackroad-os-web` | Frontend web application |
| API | `blackroad-os-api` | Backend API services |
| API Gateway | `blackroad-os-api-gateway` | Edge gateway & routing |
| Operator | `blackroad-os-operator` | Job orchestration & automation |
| Infra | `blackroad-os-infra` | Infrastructure as code |
| Prism Console | `blackroad-os-prism-console` | Runtime dashboards |
| Archive | `blackroad-os-archive` | Historical data & backups |
| Packs | `blackroad-os-pack-*` | Domain-specific functionality |
| Brand | `blackroad-os-brand` | Brand assets & guidelines |
| Docs | `blackroad-os-docs` | Documentation |
| Home | `blackroad-os-home` | Landing page & marketing |
| Research | `blackroad-os-research` | R&D and experimentation |

---

## 🧪 Testing / Validation

### For Structured Config/Registries:
- ✅ Schema validation or type-checks 🧬
- ✅ Tests to ensure all referenced repos/services actually exist 🧪
- ✅ Sanity checks (no duplicate IDs, no invalid env names, etc.) 🚫

### For Orchestration Playbooks:
- 🧪 At least one "dry run" or simulation path documented
- 🧪 Clear preconditions and postconditions for each playbook step ✅

---

## 🔐 Security / Compliance

This repo holds **meta-knowledge**, not secrets:
- 🚫 No tokens, passwords, or private keys
- 🚫 No sensitive customer/account IDs

For any playbooks that touch compliance-sensitive systems:
- 💰 Finance
- 🪪 Identity
- ⚖️ Compliance-sensitive systems

These are labeled clearly with: `// COMPLIANCE-SENSITIVE ORCHESTRATION`

---

## 📏 Design Principles

`blackroad-os-master` = **"how the whole constellation fits + moves"**, not another app:

- 🧭 It explains the grid: repos, envs, packs, agents, flows
- 🧩 It defines reusable patterns for automation, not one-off hacks

Every registry/plan here should answer:
1. 1️⃣ Which systems/parts are involved?
2. 2️⃣ Who/what owns each part? (team/agent)
3. 3️⃣ How do we safely move this from "idea → dev → stage → prod → archived"?

---

## 🧬 Emoji Legend

| Emoji | Meaning |
|-------|---------|
| 🧠 | Master/meta brain |
| 🧭 | Maps / registries |
| 📓 | Playbooks / orchestration plans |
| 🧩 | Multi-repo workflows |
| 📊 | Summary status |
| 🤖 | Agent lanes / guardrails |
| ⚖️ | Compliance-sensitive flows |
| 🟢 | Ready / Production |
| 🟡 | In Progress / Staging |
| 🟠 | Experimental / Development |
| 🔴 | Blocked / Critical Issue |

---

## 🎯 Success Criteria

If a new "Cadillac-level" operator (human or agent) lands here, they should be able to:

1. 1️⃣ **Understand** the full BlackRoad OS constellation (core, infra, packs, agents) from one place
2. 2️⃣ **See** which repos/services/envs are considered core vs experimental
3. 3️⃣ **Follow** or codify orchestration playbooks for big moves (new env, new pack, big launch) without guessing

---

## 🚀 Quick Links

- 📓 [Playbooks](./playbooks/)
- 🧭 [Registries](./registries/)
- 🧬 [Automation Config](./config/)
- 📊 [Status Summary](./status/)
- 🚦 [Status Light Templates](./templates/status-lights/)
- 📚 [BlackRoad Codex](./templates/codex/)
- 🧬 [Schemas](./schemas/)