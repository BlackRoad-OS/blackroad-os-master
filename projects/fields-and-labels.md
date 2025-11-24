# 🏷️ Project Fields and Labels – BlackRoad OS

This document describes how GitHub Project fields map to issue/PR labels and how they work together.

## Overview 🎯

BlackRoad OS uses a combination of:
- **GitHub Labels** – Applied to issues/PRs in repositories
- **Project Fields** – Organized in GitHub Projects
- **Automation** – Syncs labels ↔ fields bidirectionally

This enables:
- Consistent categorization across repos
- Automated project management
- Agent coordination
- Reporting and analytics

## Label → Field Mapping 🔄

### Team

**Label Prefix:** `Team: *`

**Project Field:** Team (Single select)

**Mapping:**
| Label | Field Value |
|-------|-------------|
| `Team: Core` | Core |
| `Team: API` | API |
| `Team: Operator` | Operator |
| `Team: Web` | Web |
| `Team: Prism Console` | Prism Console |
| `Team: Infra` | Infra |
| `Team: Docs` | Docs |
| `Team: Research` | Research |
| `Team: Brand` | Brand |
| `Team: Packs – Education` | Packs – Education |
| `Team: Packs – Infra DevOps` | Packs – Infra DevOps |
| `Team: Packs – Finance` | Packs – Finance |
| `Team: Packs – Legal` | Packs – Legal |
| `Team: Packs – Creator Studio` | Packs – Creator Studio |

**Automation:**
```
Label added → Update project field
Field changed → Update label
```

### Type

**Label Prefix:** `Type: *`

**Project Field:** Type (Single select)

**Mapping:**
| Label | Field Value |
|-------|-------------|
| `Type: Feature` | Feature |
| `Type: Bug` | Bug |
| `Type: Chore` | Chore |
| `Type: Docs` | Docs |
| `Type: Research` | Research |
| `Type: Security` | Security |
| `Type: Performance` | Performance |
| `Type: Test` | Test |

**Automation:**
```
Label added → Update project field
Field changed → Update label
```

### Status

**Label Prefix:** `Status: *`

**Project Field:** Status (Single select)

**Mapping:**
| Label | Field Value |
|-------|-------------|
| `Status: New` | 📋 New |
| `Status: Ready` | ✅ Ready |
| `Status: In Progress` | 🔄 In Progress |
| `Status: Blocked` | 🚧 Blocked |
| `Status: Needs Review` | 👀 In Review |
| `Status: Waiting on Infra` | ⏸️ On Hold |
| `Status: Waiting on Response` | ⏸️ On Hold |

**Special mappings:**
- Issue/PR opened → Status: New (if no status label)
- Issue assigned → Status: In Progress (if status is New/Ready)
- PR opened → Status: In Review
- Issue/PR closed → Status: Done

**Automation:**
```
Label added → Update project field
Field changed → Update label
Issue assigned → Status: In Progress
PR opened → Status: In Review
Closed → Status: Done
```

### Priority

**Label Prefix:** `Priority: *`

**Project Field:** Priority (Single select)

**Mapping:**
| Label | Field Value |
|-------|-------------|
| `Priority: Critical` | 🔴 Critical |
| `Priority: High` | 🟠 High |
| `Priority: Medium` | 🟡 Medium |
| `Priority: Low` | 🟢 Low |

**Automation:**
```
Label added → Update project field
Field changed → Update label
```

### Size

**Label Prefix:** `Size: *`

**Project Field:** Size (Single select)

**Mapping:**
| Label | Field Value |
|-------|-------------|
| `Size: XS` | XS (< 1 hour) |
| `Size: S` | S (1-4 hours) |
| `Size: M` | M (1-2 days) |
| `Size: L` | L (3-5 days) |
| `Size: XL` | XL (1+ weeks) |

**Automation:**
```
Label added → Update project field
Field changed → Update label
```

### Agent Labels

**Label Prefix:** `Agent: *`

**Project Field:** Agent Owner (Text)

**Mapping:**
| Label | Behavior |
|-------|----------|
| `Agent: Available` | Item can be claimed by agents |
| `Agent: In Progress` | Agent is working on this |
| `Agent: Blocked` | Agent needs human help |
| `Agent: Human Required` | Cannot be automated |
| `Agent: Review Needed` | Agent completed, needs review |

**Automation:**
```
Label "Agent: Available" → Available for agent pickup
Label "Agent: In Progress" → Agent Owner field populated
Label "Agent: Blocked" → Notify human
```

## Project-Only Fields 📊

These fields exist only in the project (not as labels):

### Repository
- **Type:** Text (auto-populated)
- **Source:** Issue/PR repository
- **Read-only:** Yes

### Sprint
- **Type:** Iteration
- **Duration:** 2 weeks
- **Editable:** Yes

### Epic
- **Type:** Text
- **Format:** `#123` (epic issue number)
- **Editable:** Yes

### Estimated Points
- **Type:** Number
- **Purpose:** Story points
- **Editable:** Yes

### Due Date
- **Type:** Date
- **Purpose:** Target completion
- **Editable:** Yes

### Agent Owner
- **Type:** Text
- **Format:** `agent-name-v1.0.0`
- **Purpose:** Track which agent is working
- **Editable:** Yes

## Sync Logic 🔄

### Label → Field (Automatic)

**When:** Label added to issue/PR

**Action:**
1. Extract field value from label (e.g., `Team: API` → `API`)
2. Update corresponding project field
3. Log sync event

**Example:**
```yaml
# Workflow pseudo-code
on:
  issues:
    types: [labeled]

jobs:
  sync:
    steps:
      - name: Extract field from label
        run: |
          label="${{ github.event.label.name }}"
          if [[ $label == Team:* ]]; then
            team="${label#Team: }"
            # Update project field "Team" to $team
          fi
```

### Field → Label (Automatic)

**When:** Project field changed

**Action:**
1. Find corresponding label (e.g., `Priority` field = `High` → `Priority: High`)
2. Add label to issue/PR
3. Remove old label if field changed (e.g., `Priority: Low` → `Priority: High`)

**Example:**
```python
# Pseudo-code
def sync_field_to_label(item, field, value):
    # Remove old labels with same prefix
    for label in item.labels:
        if label.startswith(f"{field}: "):
            item.remove_label(label)
    
    # Add new label
    new_label = f"{field}: {value}"
    item.add_label(new_label)
```

### Conflict Resolution

**What if label and field disagree?**

**Priority:** Field takes precedence

**Resolution:**
1. Project field is source of truth
2. Sync field → label on next update
3. Log conflict for review

## Workflow Automation Examples 🤖

### Auto-Label New Issues

```yaml
name: Auto Label New Issues

on:
  issues:
    types: [opened]

jobs:
  label:
    runs-on: ubuntu-latest
    steps:
      - name: Add default labels
        uses: actions/github-script@v7
        with:
          script: |
            // Add Status: New
            await github.rest.issues.addLabels({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              labels: ['Status: New']
            });
            
            // Detect team from repository
            const repo = context.repo.repo;
            let team = 'Core';
            if (repo.includes('api')) team = 'API';
            if (repo.includes('web')) team = 'Web';
            if (repo.includes('operator')) team = 'Operator';
            
            await github.rest.issues.addLabels({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              labels: [`Team: ${team}`]
            });
```

### Sync Labels to Project

```yaml
name: Sync Labels to Project

on:
  issues:
    types: [labeled, unlabeled]
  pull_request:
    types: [labeled, unlabeled]

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - name: Sync to project
        uses: actions/github-script@v7
        env:
          PROJECT_ID: ${{ secrets.PROJECT_ID }}
        with:
          github-token: ${{ secrets.PROJECT_TOKEN }}
          script: |
            const label = context.payload.label.name;
            
            // Extract field and value
            const [field, ...valueParts] = label.split(': ');
            const value = valueParts.join(': ');
            
            if (['Team', 'Type', 'Status', 'Priority', 'Size'].includes(field)) {
              // Update project field via GraphQL
              // (Actual implementation requires GraphQL mutation)
              console.log(`Updating ${field} to ${value}`);
            }
```

### Update Status on PR Events

```yaml
name: Update Status on PR Events

on:
  pull_request:
    types: [opened, ready_for_review, closed]

jobs:
  update-status:
    runs-on: ubuntu-latest
    steps:
      - name: Update labels
        uses: actions/github-script@v7
        with:
          script: |
            const pr = context.payload.pull_request;
            let status = null;
            
            if (context.payload.action === 'opened') {
              status = 'Status: In Review';
            } else if (context.payload.action === 'ready_for_review') {
              status = 'Status: Needs Review';
            } else if (context.payload.action === 'closed' && pr.merged) {
              status = 'Status: Done';
            }
            
            if (status) {
              // Remove old status labels
              const oldStatuses = pr.labels
                .filter(l => l.name.startsWith('Status: '))
                .map(l => l.name);
              
              for (const oldStatus of oldStatuses) {
                await github.rest.issues.removeLabel({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: pr.number,
                  name: oldStatus
                });
              }
              
              // Add new status
              await github.rest.issues.addLabels({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: pr.number,
                labels: [status]
              });
            }
```

## Label Templates 📝

### Creating Labels with GitHub CLI

```bash
# Create all Team labels
for team in "Core" "API" "Operator" "Web" "Prism Console" "Infra" "Docs" "Research" "Brand"; do
  gh label create "Team: $team" --color "0052CC" --description "Team: $team"
done

# Create all Type labels
gh label create "Type: Feature" --color "0E8A16" --description "New features"
gh label create "Type: Bug" --color "D73A4A" --description "Bug fixes"
gh label create "Type: Chore" --color "FEF2C0" --description "Maintenance"
gh label create "Type: Docs" --color "0075CA" --description "Documentation"

# Create all Status labels
gh label create "Status: New" --color "FFFFFF" --description "Just created"
gh label create "Status: Ready" --color "0E8A16" --description "Ready to work"
gh label create "Status: In Progress" --color "FBCA04" --description "Being worked on"
gh label create "Status: Blocked" --color "D73A4A" --description "Blocked"
gh label create "Status: Needs Review" --color "0075CA" --description "Needs review"

# Create all Priority labels
gh label create "Priority: Critical" --color "B60205" --description "Critical priority"
gh label create "Priority: High" --color "D93F0B" --description "High priority"
gh label create "Priority: Medium" --color "FBCA04" --description "Medium priority"
gh label create "Priority: Low" --color "0E8A16" --description "Low priority"

# Create all Size labels
gh label create "Size: XS" --color "C2E0C6" --description "< 1 hour"
gh label create "Size: S" --color "BFD4F2" --description "1-4 hours"
gh label create "Size: M" --color "FEF2C0" --description "1-2 days"
gh label create "Size: L" --color "FBCA04" --description "3-5 days"
gh label create "Size: XL" --color "D93F0B" --description "1+ weeks"
```

## Best Practices ✅

### DO ✅
- **Use labels consistently** across all repos
- **Let automation sync** labels ↔ fields
- **Review sync logs** to catch issues
- **Update labels** when fields change
- **Document custom labels** if added

### DON'T ❌
- **Create duplicate labels** with different formats
- **Manually manage both** labels and fields (automate!)
- **Skip required labels** (Team, Type)
- **Ignore sync failures** (investigate and fix)

---

**Related docs:**
- [Labels Convention](../conventions/labels.md)
- [Project Orchestration](./blackroad-os-master-orchestration.md)
- [Workflows](../workflows/coding-workflow.md)
