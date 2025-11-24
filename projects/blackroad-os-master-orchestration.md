# 🗺️ BlackRoad OS – Master Orchestration Project

This document defines the configuration and usage of the BlackRoad OS Master Orchestration GitHub Project.

## Overview 🎯

The **BlackRoad OS – Master Orchestration** project is a central GitHub Project board that provides visibility into work across all BlackRoad OS repositories. It enables coordination between 10,000 agents and 1 human.

## Project Structure 📊

### Project Type

**Table View** – Primary view for managing work

Additional views:
- **Board View** – Kanban-style status tracking
- **Roadmap View** – Timeline visualization
- **Team View** – Grouped by team

### Project Location

```
Organization: BlackRoad-OS
Project: BlackRoad OS – Master Orchestration
URL: https://github.com/orgs/BlackRoad-OS/projects/1
```

## Fields Configuration 📋

### Built-in Fields

#### Title
- **Type:** Text
- **Source:** Issue/PR title
- **Editable:** Yes (edits sync to issue/PR)

#### Status
- **Type:** Single select
- **Options:**
  - 📋 **New** – Just created, needs triage
  - ✅ **Ready** – Triaged, ready to work on
  - 🔄 **In Progress** – Currently being worked on
  - 👀 **In Review** – PR open, needs review
  - 🚧 **Blocked** – Cannot proceed
  - ⏸️ **On Hold** – Paused temporarily
  - ✔️ **Done** – Completed and merged

#### Assignees
- **Type:** People
- **Source:** Issue/PR assignees
- **Multi-select:** Yes

### Custom Fields

#### Team
- **Type:** Single select
- **Options:**
  - Core
  - API
  - Operator
  - Web
  - Prism Console
  - Infra
  - Docs
  - Research
  - Brand
  - Packs – Education
  - Packs – Infra DevOps
  - Packs – Finance
  - Packs – Legal
  - Packs – Creator Studio
- **Mapping:** Syncs from `Team: *` labels

#### Type
- **Type:** Single select
- **Options:**
  - Feature
  - Bug
  - Chore
  - Docs
  - Research
  - Security
  - Performance
  - Test
- **Mapping:** Syncs from `Type: *` labels

#### Priority
- **Type:** Single select
- **Options:**
  - 🔴 Critical
  - 🟠 High
  - 🟡 Medium
  - 🟢 Low
- **Mapping:** Syncs from `Priority: *` labels

#### Size
- **Type:** Single select
- **Options:**
  - XS (< 1 hour)
  - S (1-4 hours)
  - M (1-2 days)
  - L (3-5 days)
  - XL (1+ weeks)
- **Mapping:** Syncs from `Size: *` labels

#### Repository
- **Type:** Text (auto-populated)
- **Source:** Repository name
- **Read-only:** Yes

#### Agent Owner
- **Type:** Text
- **Purpose:** Track which agent is working on this
- **Format:** `agent-code-gen-v1`, `agent-docs-v2`, etc.
- **Optional:** Only for agent-worked items

#### Sprint
- **Type:** Iteration
- **Duration:** 2 weeks
- **Start Day:** Monday
- **Purpose:** Track sprint assignments

#### Epic
- **Type:** Text
- **Purpose:** Link to parent epic/initiative
- **Format:** `#123` (epic issue number)

#### Estimated Points
- **Type:** Number
- **Purpose:** Story points or complexity estimate
- **Scale:** 1, 2, 3, 5, 8, 13, 21

#### Due Date
- **Type:** Date
- **Purpose:** Target completion date
- **Optional:** Not required for all items

## Workflows & Automation 🤖

### Auto-Add to Project

All issues and PRs from BlackRoad OS repos are automatically added:

```yaml
# .github/workflows/project-sync.yml (in each repo)
on:
  issues:
    types: [opened]
  pull_request:
    types: [opened]

jobs:
  add-to-project:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/add-to-project@v0.5.0
        with:
          project-url: https://github.com/orgs/BlackRoad-OS/projects/1
          github-token: ${{ secrets.PROJECT_TOKEN }}
```

### Auto-Update Fields

Fields are auto-updated based on issue/PR changes:

#### Status Updates
- **Issue opened** → Status: New
- **Issue labeled `Status: Ready`** → Status: Ready
- **Issue assigned** → Status: In Progress
- **PR opened** → Status: In Review
- **PR labeled `Status: Blocked`** → Status: Blocked
- **Issue/PR closed** → Status: Done

#### Team/Type/Priority Updates
- **Label added** → Sync to corresponding field
- **Label removed** → Clear corresponding field

#### Repository Field
- **Auto-populated** from issue/PR repository

### Agent Coordination

Agents query the project for available work:

```python
# Example: Query for available work
def get_available_work(team, agent_type):
    """
    Query project for work items matching criteria
    """
    items = project.items.filter(
        status="Ready",
        team=team,
        labels__contains="Agent: Available"
    )
    return items
```

## Views 👁️

### Table View (Default)

**Columns:**
- Title
- Status
- Team
- Type
- Priority
- Size
- Assignees
- Repository
- Sprint

**Filters:**
- Status: In Progress, In Review (see active work)
- Priority: Critical, High (see urgent work)
- Team: [Select team] (see team's work)

**Sorting:**
- Priority (descending)
- Status
- Due Date

### Board View (Kanban)

**Columns:** (Grouped by Status)
- New
- Ready
- In Progress
- In Review
- Blocked
- Done

**Swim Lanes:** (Optional)
- Group by Team
- Group by Priority

### Roadmap View

**Timeline:** Sprint-based

**Grouping:** By Epic or Team

**Purpose:** See what's planned for upcoming sprints

### Team Views

Separate views for each team:

**Filter:**
- Team: API (or other team)

**Purpose:** Team-specific dashboards

## Usage Patterns 🎯

### For Human Project Manager

**Daily standup:**
1. Open Board View
2. Review "In Progress" column
3. Check "Blocked" items
4. Move stale items back to "Ready"

**Sprint planning:**
1. Open Table View, filter Status: Ready
2. Sort by Priority
3. Assign to Sprint field
4. Assign to team members
5. Add size estimates

**Weekly review:**
1. Open Roadmap View
2. Check sprint progress
3. Adjust upcoming work

### For Agents

**Finding work:**
```python
# Agent polls for work
work = project.query(
    status="Ready",
    team="API",
    labels="Agent: Available",
    limit=5
)

# Claim work
for item in work:
    item.status = "In Progress"
    item.assignees.add("agent-bot")
    item.agent_owner = "agent-code-gen-v1.0.0"
```

**Updating progress:**
```python
# Agent updates status
item.status = "In Review"  # PR opened
item.comment("🤖 PR opened: #456")
```

**Reporting completion:**
```python
# Agent marks done
item.status = "Done"
item.comment("🤖 Work completed and merged")
```

### For Developers

**Claiming work:**
1. Open Table View
2. Filter: Status=Ready, Team=Your Team
3. Assign yourself
4. Status changes to "In Progress" (auto or manual)

**Tracking progress:**
1. Update status as you work
2. Add comments for blockers
3. Link PRs to issues

## Metrics & Insights 📊

### Velocity Tracking

**Sprint velocity:**
- Sum of Size/Points completed per sprint
- Track over time to estimate capacity

**Lead time:**
- Time from Ready → Done
- Track to improve efficiency

**Cycle time:**
- Time from In Progress → Done
- Optimize development process

### Bottleneck Identification

**High "Blocked" count** → Investigate blockers

**High "In Review" count** → Need more reviewers

**Low "Done" count** → Check team capacity or task complexity

### Team Performance

**Per-team velocity:** Compare across teams

**Per-team cycle time:** Identify slow teams

**Agent vs Human:** Compare productivity

## Integration with Other Tools 🔗

### GitHub Issues/PRs

- Project items sync bidirectionally
- Labels → Project fields
- Closing issue/PR → Status: Done

### Slack

Send notifications for:
- High priority items added
- Items blocked
- Sprint milestones

```yaml
# Example webhook
- name: Notify Slack
  run: |
    curl -X POST ${{ secrets.SLACK_WEBHOOK }} \
      -d '{"text": "🚨 Critical priority item added: ${{ issue.title }}"}'
```

### CI/CD

Update project on deployment:

```yaml
# After successful deploy
- name: Update project
  run: |
    gh project item-edit --field Status --value Done \
      --project "BlackRoad OS – Master Orchestration" \
      --item-id ${{ issue.node_id }}
```

## Best Practices ✅

### DO ✅
- **Keep status current** – Update as work progresses
- **Assign owners** – Clear ownership for each item
- **Use labels** – Auto-sync to project fields
- **Link PRs to issues** – Maintain traceability
- **Close stale items** – Clean up backlog regularly
- **Review project weekly** – Keep it organized

### DON'T ❌
- **Let status go stale** – Update regularly
- **Leave items unassigned** – Assign to person or agent
- **Create duplicate items** – Search before creating
- **Forget to triage** – Review "New" items daily
- **Over-assign work** – Respect WIP limits

## Triage Process 🔍

**Daily triage (New → Ready):**

1. **Review "New" items**
2. **Add missing fields:**
   - Team
   - Type
   - Priority
   - Size (estimate)
3. **Decide:**
   - Move to "Ready" if clear
   - Add "needs triage" label if unclear
   - Close if duplicate/invalid
4. **Assign if urgent**

**Weekly backlog refinement:**

1. **Review "Ready" items**
2. **Update priorities** based on business needs
3. **Break down large items** (Size: XL)
4. **Archive old items** (>6 months, low priority)

## Cleanup & Maintenance 🧹

### Weekly
- Review stale "In Progress" items (>1 week)
- Update blocked items
- Close completed items not auto-closed

### Monthly
- Archive items from >2 sprints ago
- Review and update field options
- Check automation is working

### Quarterly
- Analyze velocity and metrics
- Adjust sprint length if needed
- Review team assignments

## Access & Permissions 🔐

### Who can view?
- All organization members
- Public (if project is public)

### Who can edit?
- Organization admins
- Project maintainers
- Repo maintainers (for items from their repos)

### Who can configure?
- Organization admins
- Project admins

---

**Related docs:**
- [Coding Workflow](../workflows/coding-workflow.md)
- [Agent Workflows](../workflows/agent-workflows.md)
- [Labels](./fields-and-labels.md)
