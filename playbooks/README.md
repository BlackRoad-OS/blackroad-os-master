# 📓 Orchestration Playbooks

> Cross-repo workflows and step-by-step guides for major BlackRoad OS operations

---

## 🎯 Purpose

This directory contains orchestration playbooks that define:
- Cross-repo workflows that span multiple BlackRoad OS repositories
- Checklists and step sequences for major operations
- Links to operator jobs & Prism dashboards that implement these flows

---

## 📚 Available Playbooks

| Playbook | Description | Emoji |
|----------|-------------|-------|
| [new-pack.md](./new-pack.md) | Spin up a new domain-specific pack | 📦 |
| [new-environment.md](./new-environment.md) | Launch a new deployment environment | 🌍 |
| [release-train.md](./release-train.md) | Full OS release across all repositories | 🚂 |

---

## 📋 Playbook Structure

Each playbook follows a consistent structure:

1. **Overview** - What this playbook accomplishes
2. **Preconditions** - What must be true before starting
3. **Workflow Steps** - Phased steps with owners and status tracking
4. **Postconditions** - What should be true after completion
5. **Rollback Procedure** - How to recover if things go wrong
6. **Compliance Notes** - Special requirements for sensitive operations
7. **Related Links** - Connections to other systems

---

## 🧪 Dry Run Guidelines

Each playbook should support a "dry run" mode:
- Preview what changes would be made
- Validate prerequisites
- Identify potential issues before execution

---

## 🔐 Compliance Markers

Playbooks touching sensitive systems are marked with:

```
// COMPLIANCE-SENSITIVE ORCHESTRATION
```

This indicates additional review and approval requirements for:
- 💰 Finance-related operations
- 🪪 Identity-related operations
- ⚖️ Legal/compliance-related operations

---

## 📡 Related Links

- [Registries](../registries/) - System maps and ownership data
- [Config](../config/) - Automation and agent configuration
- [Status](../status/) - Current system status
- [Schemas](../schemas/) - JSON schema definitions
