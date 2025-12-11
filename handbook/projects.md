# Projects handbook

This guide defines how to structure GitHub Projects for BlackRoad OS. Every status, document stage, and role emoji inherits its meaning from the canonical spec in [`BlackRoad-OS/blackroad-os/handbooks/workflows/emoji-workflows.md`](https://github.com/BlackRoad-OS/blackroad-os/blob/main/handbooks/workflows/emoji-workflows.md). Do not redefine emojis locally—reuse the shared language.

## Emoji cheat sheet

- **Status:** 🟢 Ready, 🟡 In Progress, 🔴 Blocked, 🤔 Needs Clarification, 🆘 Emergency, 🛟 Assist, ⚠️ Risky, 🚫 Won’t Do, 🛑 Hold
- **Documents:** 📕 Draft, 📗 In Review, 📘 Approved, 📙 Needs Update, 📖 Canon, 📓 Notes
- **Roles:** 🧍‍♀️ Human owner, 🤖 Agent owner, 🧬 Hybrid pair, 🫸 Requester/sponsor, 🫀 Impacted team

Brief explanations accompany the first use of each emoji in templates so new collaborators can map meaning quickly.

## Default board columns

Use these column names for kanban-style boards:

- 📓 Backlog – ideas and unsized cards
- 🟢 Ready – clarified and sized cards
- 🟡 In Progress – actively being worked
- 📗 In Review – under review or awaiting acceptance
- 📘 Approved / Done – completed and accepted
- 📙 Needs Update – requires maintenance or new info
- 🚫 Won’t Do – declined or out of scope

## Default views

Create consistent views across projects:

- **All Work** – grouped by Team / Service Line
- **Now** – filter by active Sprint or Milestone
- **Blocked** – Status = 🔴 or 🆘 or 🛑
- **Needs Clarification** – Status = 🤔
- **Incidents** – label = `incident`, status uses 🆘

## Project description block (copy/paste)

Paste the block below into new GitHub Project descriptions. It reinforces the shared emoji language and keeps every project aligned.

```md
### BlackRoad OS project defaults

**Status legend:** 🟢 Ready • 🟡 In Progress • 🔴 Blocked • 🤔 Needs Clarification • 🆘 Emergency • 🛟 Assist • ⚠️ Risk • 🚫 Won’t Do • 🛑 Hold
**Document states:** 📕 Draft • 📗 In Review • 📘 Approved • 📙 Needs Update • 📖 Canon • 📓 Notes
**Human/agent roles:** 🧍‍♀️ Human lead • 🤖 Agent • 🧬 Hybrid • 🫸 Requester • 🫀 Impacted team

**Columns:** 📓 Backlog → 🟢 Ready → 🟡 In Progress → 📗 In Review → 📘 Approved/Done → 📙 Needs Update → 🚫 Won’t Do
**Views:** All Work | Now | Blocked | Needs Clarification | Incidents

**Progress bar:** 🟩🟩🟩🟩🟩🟩🟩🟩⬜⬜ (update as milestones move)

This project follows the canonical emoji workflow spec from `BlackRoad-OS/blackroad-os`. Do not change emoji meanings locally; adjust only the filters or labels as needed.
```
