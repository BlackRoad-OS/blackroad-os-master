# 📦 New Pack Playbook 🚂

> Orchestration playbook for spinning up a new BlackRoad OS pack

---

## 🎯 Overview

This playbook defines the steps to create and integrate a new domain-specific pack into the BlackRoad OS ecosystem.

---

## 📋 Preconditions

Before starting, ensure:

- [ ] Pack concept has been approved by the Orchestration Team 🧠
- [ ] Domain requirements are documented
- [ ] Pack naming follows convention: `blackroad-os-pack-{domain}`
- [ ] No existing pack covers the same domain

---

## 🔄 Workflow Steps

### Phase 1: Repository Setup 🏗️

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 1.1 | Create repository `blackroad-os-pack-{name}` | Infrastructure Team | ⬜ |
| 1.2 | Apply repository template | Infrastructure Team | ⬜ |
| 1.3 | Configure branch protection rules | Infrastructure Team | ⬜ |
| 1.4 | Add CODEOWNERS file | Packs Team | ⬜ |
| 1.5 | Set up CI/CD pipeline | Infrastructure Team | ⬜ |

**Dry Run:** Preview repository creation with `gh repo create --dry-run`

### Phase 2: Registry Updates 📓

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 2.1 | Add pack to `registries/repos.json` | Orchestration Team | ⬜ |
| 2.2 | Update `registries/ownership.json` | Orchestration Team | ⬜ |
| 2.3 | Add pack to appropriate environment config | Orchestration Team | ⬜ |
| 2.4 | Run schema validation | Orchestration Team | ⬜ |

**Dry Run:** Validate JSON changes with schema before commit

### Phase 3: Integration Setup 🔗

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 3.1 | Configure pack in Operator jobs | Infrastructure Team | ⬜ |
| 3.2 | Add pack to Prism Console monitoring | Observability Team | ⬜ |
| 3.3 | Set up pack-specific dashboards | Observability Team | ⬜ |
| 3.4 | Configure Archive retention policies | Observability Team | ⬜ |

### Phase 4: Documentation 📖

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 4.1 | Create pack README with mission and scope | Packs Team | ⬜ |
| 4.2 | Add pack to main documentation site | Brand & Docs Team | ⬜ |
| 4.3 | Update constellation diagram | Orchestration Team | ⬜ |

### Phase 5: Launch 🚀

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 5.1 | Deploy to dev environment | Infrastructure Team | ⬜ |
| 5.2 | Verify integration tests pass | Packs Team | ⬜ |
| 5.3 | Update status in `status/summary.json` | Orchestration Team | ⬜ |
| 5.4 | Announce pack availability | Brand & Docs Team | ⬜ |

---

## ✅ Postconditions

After completion:

- [ ] Pack repository exists and is accessible
- [ ] Pack is registered in all master registries
- [ ] CI/CD pipeline is functional
- [ ] Monitoring is configured
- [ ] Documentation is published
- [ ] Pack status is "experimental" 🟠

---

## ⚠️ Rollback Procedure

If issues occur:

1. Set pack status to "blocked" in registries
2. Disable pack in Operator jobs
3. Archive monitoring dashboards
4. Update documentation with deprecation notice

---

## 🔐 Compliance Notes

For packs touching sensitive domains:

```
// COMPLIANCE-SENSITIVE ORCHESTRATION
```

Additional requirements:
- 💰 Finance packs: Require compliance team approval at Phase 1.1
- ⚖️ Legal packs: Require legal review at Phase 4.1
- 🪪 Identity packs: Require security review at Phase 3.1

---

## 📡 Related Links

- [Operator Job Templates](https://github.com/BlackRoad-OS/blackroad-os-operator)
- [Prism Console Setup](https://github.com/BlackRoad-OS/blackroad-os-prism-console)
- [Pack Template Repository](https://github.com/BlackRoad-OS/blackroad-os-pack-template)
