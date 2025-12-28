# 🌍 New Environment Playbook 🚂

> Orchestration playbook for launching a new environment in BlackRoad OS

---

## 🎯 Overview

This playbook defines the steps to create and configure a new environment (dev, staging, prod, or custom) across the BlackRoad OS constellation.

---

## 📋 Preconditions

Before starting, ensure:

- [ ] Environment name follows allowed naming convention
- [ ] Environment is approved by Infrastructure and Orchestration teams
- [ ] Cloud resources budget is approved
- [ ] Network topology is designed
- [ ] No conflicting environment with same name exists

---

## 🔄 Workflow Steps

### Phase 1: Infrastructure Provisioning ☁️

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 1.1 | Create environment definition in `blackroad-os-infra` | Infrastructure Team | ⬜ |
| 1.2 | Provision cloud resources (VPC, subnets, etc.) | Infrastructure Team | ⬜ |
| 1.3 | Configure DNS entries | Infrastructure Team | ⬜ |
| 1.4 | Set up SSL certificates | Infrastructure Team | ⬜ |
| 1.5 | Configure secrets management | Infrastructure Team | ⬜ |

**Dry Run:** Use `terraform plan` to preview infrastructure changes

### Phase 2: Core Services Deployment 🔌

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 2.1 | Deploy `blackroad-os-api-gateway` | Backend Team | ⬜ |
| 2.2 | Deploy `blackroad-os-api` | Backend Team | ⬜ |
| 2.3 | Deploy `blackroad-os-core` | Core Platform Team | ⬜ |
| 2.4 | Deploy `blackroad-os-web` | Frontend Team | ⬜ |
| 2.5 | Verify core health checks | Infrastructure Team | ⬜ |

**Dry Run:** Deploy to isolated namespace first

### Phase 3: Observability Setup 📊

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 3.1 | Configure monitoring endpoints | Observability Team | ⬜ |
| 3.2 | Set up alerting rules | Observability Team | ⬜ |
| 3.3 | Create environment dashboard in Prism Console | Observability Team | ⬜ |
| 3.4 | Configure log aggregation | Observability Team | ⬜ |

### Phase 4: Registry Updates 📓

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 4.1 | Add environment to `registries/repos.json` for each service | Orchestration Team | ⬜ |
| 4.2 | Update `config/automation.json` allowed environments | Orchestration Team | ⬜ |
| 4.3 | Run schema validation | Orchestration Team | ⬜ |

**Dry Run:** Validate JSON changes with schema before commit

### Phase 5: Integration & Testing 🧪

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 5.1 | Run environment smoke tests | Infrastructure Team | ⬜ |
| 5.2 | Verify cross-service communication | Backend Team | ⬜ |
| 5.3 | Test authentication flows | Core Platform Team | ⬜ |
| 5.4 | Validate monitoring data flow | Observability Team | ⬜ |

### Phase 6: Documentation & Announcement 📖

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 6.1 | Document environment access procedures | Brand & Docs Team | ⬜ |
| 6.2 | Update runbooks with environment-specific info | Infrastructure Team | ⬜ |
| 6.3 | Update `status/summary.json` | Orchestration Team | ⬜ |
| 6.4 | Announce environment availability | Orchestration Team | ⬜ |

---

## ✅ Postconditions

After completion:

- [ ] All core services are running and healthy
- [ ] Monitoring is active with appropriate alerts
- [ ] Environment is registered in all master registries
- [ ] Access documentation is published
- [ ] Environment status is "ready" 🟢

---

## ⚠️ Rollback Procedure

If issues occur:

1. Set environment status to "blocked" in registries
2. Stop all non-essential services
3. Preserve logs for debugging
4. Notify affected teams via escalation path
5. If necessary, destroy infrastructure resources

---

## 🔐 Compliance Notes

For production or compliance-sensitive environments:

```
// COMPLIANCE-SENSITIVE ORCHESTRATION
```

Additional requirements:
- 💰 Finance environments: Require SOC 2 compliance verification
- 🪪 Identity environments: Require security audit before launch
- ⚖️ Legal environments: Require data residency verification

---

## 📡 Related Links

- [Infrastructure Repository](https://github.com/BlackRoad-OS/blackroad-os-infra)
- [Operator Job Definitions](https://github.com/BlackRoad-OS/blackroad-os-operator)
- [Prism Console](https://github.com/BlackRoad-OS/blackroad-os-prism-console)
