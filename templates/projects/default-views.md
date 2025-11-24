# Default project views and columns

Use this template to set up new GitHub Projects with the BlackRoad OS emoji workflow. Emoji definitions are inherited from [`BlackRoad-OS/blackroad-os/handbooks/workflows/emoji-workflows.md`](https://github.com/BlackRoad-OS/blackroad-os/blob/main/handbooks/workflows/emoji-workflows.md).

## Columns
- 📓 Backlog
- 🟢 Ready
- 🟡 In Progress
- 📗 In Review
- 📘 Approved / Done
- 📙 Needs Update
- 🚫 Won’t Do

## Recommended views
- **All Work** – group by Team / Service Line
- **Now** – filter by active Sprint or Milestone
- **Blocked** – filter Status = 🔴 or 🆘 or 🛑
- **Needs Clarification** – filter Status = 🤔
- **Incidents** – filter label = `incident` and status uses 🆘

## Description block
Copy the block below into the Project description when creating a new board.

```md
**Status legend:** 🟢 Ready • 🟡 In Progress • 🔴 Blocked • 🤔 Needs Clarification • 🆘 Emergency • 🛟 Assist • ⚠️ Risk • 🚫 Won’t Do • 🛑 Hold
**Doc states:** 📕 Draft • 📗 In Review • 📘 Approved • 📙 Needs Update • 📖 Canon • 📓 Notes
**Roles:** 🧍‍♀️ Human • 🤖 Agent • 🧬 Hybrid • 🫸 Requester • 🫀 Impacted team
**Columns:** 📓 Backlog → 🟢 Ready → 🟡 In Progress → 📗 In Review → 📘 Approved/Done → 📙 Needs Update → 🚫 Won’t Do
**Views:** All Work | Now | Blocked | Needs Clarification | Incidents
**Progress:** 🟩🟩🟩🟩🟩🟩🟩🟩⬜⬜

This project follows the canonical emoji workflow spec in `blackroad-os`. Do not redefine emojis locally.
```
