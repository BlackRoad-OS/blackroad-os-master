# 🏷️ Labels – BlackRoad OS

This document defines the canonical label set for all BlackRoad OS repositories.

## Overview 🎯

Labels help organize issues and PRs, route work to the right teams, track progress, and enable automation.

## Label Categories 📦

### Team Labels 👥

Indicate which team owns or should work on an issue/PR.

| Label | Color | Description |
|-------|-------|-------------|
| `Team: Core` | `#0052CC` | Core type system & shared libraries |
| `Team: API` | `#0052CC` | HTTP API & REST endpoints |
| `Team: Operator` | `#0052CC` | Orchestration & scheduling |
| `Team: Web` | `#0052CC` | Web frontend & UI |
| `Team: Prism Console` | `#0052CC` | Admin & management console |
| `Team: Infra` | `#0052CC` | Infrastructure & DevOps |
| `Team: Docs` | `#0052CC` | Documentation |
| `Team: Research` | `#0052CC` | Research & experiments |
| `Team: Brand` | `#0052CC` | Branding & design system |
| `Team: Packs – Education` | `#0052CC` | Education domain pack |
| `Team: Packs – Infra DevOps` | `#0052CC` | Infrastructure/DevOps pack |
| `Team: Packs – Finance` | `#0052CC` | Finance domain pack |
| `Team: Packs – Legal` | `#0052CC` | Legal domain pack |
| `Team: Packs – Creator Studio` | `#0052CC` | Creator content pack |

**Usage:**
- Every issue/PR should have exactly **one** Team label
- Auto-assigned based on repository or file paths
- Used for routing and ownership

### Type Labels 📌

Indicate the kind of work.

| Label | Color | Description |
|-------|-------|-------------|
| `Type: Feature` | `#0E8A16` | New features or enhancements |
| `Type: Bug` | `#D73A4A` | Bug fixes or error corrections |
| `Type: Chore` | `#FEF2C0` | Maintenance, refactoring, dependencies |
| `Type: Docs` | `#0075CA` | Documentation only |
| `Type: Research` | `#8B5CF6` | Experimental or research work |
| `Type: Security` | `#D93F0B` | Security vulnerabilities or patches |
| `Type: Performance` | `#FBCA04` | Performance improvements |
| `Type: Test` | `#BFD4F2` | Testing-related changes |

**Usage:**
- Every issue/PR should have exactly **one** Type label
- Auto-assigned based on branch name or PR title
- Used for changelog generation

### Status Labels 🔄

Track progress through workflow.

| Label | Color | Description |
|-------|-------|-------------|
| `Status: New` | `#FFFFFF` | Just created, not yet triaged |
| `Status: Ready` | `#0E8A16` | Ready to be worked on |
| `Status: In Progress` | `#FBCA04` | Currently being worked on |
| `Status: Blocked` | `#D73A4A` | Cannot proceed (waiting on something) |
| `Status: Needs Review` | `#0075CA` | Ready for code review |
| `Status: Waiting on Infra` | `#FEF2C0` | Waiting on infrastructure changes |
| `Status: Waiting on Response` | `#FEF2C0` | Waiting on feedback or clarification |

**Usage:**
- Issues progress: New → Ready → In Progress → Done
- PRs progress: New → In Progress → Needs Review → Merged
- Auto-updated by workflows when possible

### Priority Labels ⚡

Indicate urgency and importance.

| Label | Color | Description |
|-------|-------|-------------|
| `Priority: Critical` | `#B60205` | Must be done immediately (SEV-1 incidents) |
| `Priority: High` | `#D93F0B` | Should be done soon (this sprint) |
| `Priority: Medium` | `#FBCA04` | Normal priority (next sprint) |
| `Priority: Low` | `#0E8A16` | Nice to have (backlog) |

**Usage:**
- Not required for all issues
- Used for sprint planning
- Critical/High trigger notifications

### Size Labels 📏

Estimate effort or complexity.

| Label | Color | Description |
|-------|-------|-------------|
| `Size: XS` | `#C2E0C6` | < 1 hour |
| `Size: S` | `#BFD4F2` | 1-4 hours |
| `Size: M` | `#FEF2C0` | 1-2 days |
| `Size: L` | `#FBCA04` | 3-5 days |
| `Size: XL` | `#D93F0B` | 1+ weeks |

**Usage:**
- Optional but helpful for planning
- Added during triage or planning
- Large sizes (L, XL) may need breakdown

### Agent Labels 🤖

For agent automation and coordination.

| Label | Color | Description |
|-------|-------|-------------|
| `Agent: Available` | `#7057FF` | Can be automated by agents |
| `Agent: In Progress` | `#7057FF` | Agent is working on this |
| `Agent: Blocked` | `#7057FF` | Agent needs human help |
| `Agent: Human Required` | `#7057FF` | Requires human judgment |
| `Agent: Review Needed` | `#7057FF` | Agent completed, needs human review |

**Usage:**
- Mark work suitable for automation
- Track agent progress
- Coordinate human-agent collaboration

### Special Labels 🌟

For specific situations.

| Label | Color | Description |
|-------|-------|-------------|
| `good first issue` | `#7057FF` | Good for newcomers |
| `help wanted` | `#008672` | Extra attention needed |
| `duplicate` | `#CFD3D7` | Duplicate of another issue |
| `invalid` | `#E4E669` | Not valid issue |
| `wontfix` | `#FFFFFF` | Will not be addressed |
| `breaking change` | `#D73A4A` | Introduces breaking change |
| `needs triage` | `#FEF2C0` | Needs initial assessment |
| `dependencies` | `#0366D6` | Dependency updates |
| `question` | `#D876E3` | Questions or discussions |

**Usage:**
- Add as needed for special cases
- Some auto-added by Dependabot or bots

## Label Management 🛠️

### Creating Labels

**GitHub CLI:**
```bash
gh label create "Team: Core" --color "0052CC" --description "Core type system"
```

**GitHub Web:**
1. Go to repository → Issues → Labels
2. Click "New label"
3. Enter name, color, description
4. Save

### Syncing Labels Across Repos

Use a tool like `github-label-sync`:

```bash
npm install -g github-label-sync

# Create labels.json
github-label-sync --labels labels.json BlackRoad-OS/blackroad-os-api
```

**labels.json:**
```json
[
  {
    "name": "Team: Core",
    "color": "0052CC",
    "description": "Core type system & shared libraries"
  },
  {
    "name": "Type: Feature",
    "color": "0E8A16",
    "description": "New features or enhancements"
  }
]
```

### Automation

**Auto-label based on branch:**
```yaml
# .github/workflows/auto-label.yml
name: Auto Label

on:
  pull_request:
    types: [opened]

jobs:
  label:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/labeler@v4
        with:
          repo-token: ${{ secrets.GITHUB_TOKEN }}
```

**Auto-label config (.github/labeler.yml):**
```yaml
'Team: API':
  - 'apps/api/**/*'
  - 'packages/api/**/*'

'Team: Web':
  - 'apps/web/**/*'
  - 'packages/web/**/*'

'Type: Docs':
  - '**/*.md'
  - 'docs/**/*'

'Type: Test':
  - '**/*.test.ts'
  - '**/*.spec.ts'
```

## Label Usage Patterns 🎯

### For Issues

**Minimal labeling:**
```
Team: API
Type: Feature
```

**Complete labeling:**
```
Team: API
Type: Feature
Priority: High
Size: M
Status: Ready
Agent: Available
```

### For PRs

**Auto-labeled from branch:**
```
Branch: feature/api-new-endpoint
→ Labels: Team: API, Type: Feature
```

**Manual additions:**
```
Team: API
Type: Feature
breaking change
Size: L
```

### For Projects

Labels sync to project fields:
- `Team: *` → **Team** field
- `Status: *` → **Status** field
- `Priority: *` → **Priority** field
- `Type: *` → **Type** field

## Label Conventions ✅

### DO ✅
- Use exactly one **Team** label per issue/PR
- Use exactly one **Type** label per issue/PR
- Update **Status** as work progresses
- Add **Priority** for important work
- Use **Agent: Available** for automatable tasks
- Be consistent across repositories

### DON'T ❌
- Create custom labels without documentation
- Use multiple Team labels
- Use multiple Type labels
- Leave issues unlabeled
- Create duplicate labels with different names

## Label Colors 🎨

### Color Palette

Our label colors follow a consistent scheme:

- **Blue (`#0052CC`, `#0075CA`)** – Teams, informational
- **Green (`#0E8A16`)** – Positive states (Ready, Features)
- **Yellow (`#FBCA04`, `#FEF2C0`)** – In progress, warnings
- **Red (`#D73A4A`, `#D93F0B`)** – Bugs, urgent, blocked
- **Purple (`#7057FF`, `#8B5CF6`)** – Agent-related, research
- **Gray (`#CFD3D7`, `#FFFFFF`)** – Neutral, closed states

### Accessibility

Colors chosen to be colorblind-friendly:
- High contrast with background
- Distinguishable by shape/name, not just color
- Tested with various colorblindness simulations

## Integration with GitHub Projects 🗂️

### Field Mapping

GitHub Projects can extract labels as fields:

| Label Prefix | Project Field | Type |
|--------------|---------------|------|
| `Team: *` | Team | Single select |
| `Type: *` | Type | Single select |
| `Status: *` | Status | Single select |
| `Priority: *` | Priority | Single select |
| `Size: *` | Size | Single select |

**Automation example:**
```yaml
# .github/workflows/project-sync.yml
- name: Sync labels to project
  # When issue labeled, update project field
  if: github.event.action == 'labeled'
  run: |
    # Extract team from label
    # Update project field via GraphQL API
```

## Repository-Specific Labels 📚

While most labels are standard, some repos may have specific needs:

### blackroad-os-api
```
Component: Routes
Component: Middleware
Component: Models
Component: Controllers
```

### blackroad-os-web
```
Component: UI
Component: Pages
Component: Layouts
Component: Hooks
```

### blackroad-os-operator
```
Component: Scheduler
Component: Workers
Component: Queue
Component: Events
```

**Note:** Keep repo-specific labels minimal. Prefer standard labels.

## Quick Reference Card 🎴

```
┌─────────────────────────────────────────┐
│ BlackRoad OS Labels                     │
├─────────────────────────────────────────┤
│ TEAM (one required):                    │
│   Team: Core, API, Operator, Web...    │
│                                         │
│ TYPE (one required):                    │
│   Type: Feature, Bug, Chore, Docs...   │
│                                         │
│ STATUS (auto-updated):                  │
│   Status: New → Ready → In Progress    │
│   Status: Blocked, Needs Review...     │
│                                         │
│ PRIORITY (optional):                    │
│   Priority: Critical, High, Medium, Low │
│                                         │
│ SIZE (optional):                        │
│   Size: XS, S, M, L, XL                │
│                                         │
│ AGENT (for automation):                 │
│   Agent: Available, In Progress...     │
│                                         │
│ SPECIAL (as needed):                    │
│   good first issue, help wanted...     │
└─────────────────────────────────────────┘
```

---

**Related docs:**
- [Coding Workflow](../workflows/coding-workflow.md)
- [Project Management](../projects/blackroad-os-master-orchestration.md)
- [Branch Naming](./branches.md)
