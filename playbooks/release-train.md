# 🚂 Full OS Release Train Playbook

> Orchestration playbook for coordinating a full BlackRoad OS release across all repositories

---

## 🎯 Overview

This playbook defines the steps to coordinate a synchronized release across the entire BlackRoad OS constellation. This is the "big launch" playbook for major version releases.

---

## 📋 Preconditions

Before starting, ensure:

- [ ] All core repositories have completed their individual release preparations
- [ ] All automated tests are passing across the constellation
- [ ] Security scans have been completed with no critical issues
- [ ] Release notes are drafted for each repository
- [ ] Rollback procedures are documented and tested
- [ ] All teams have acknowledged release schedule

---

## 🔄 Workflow Steps

### Phase 1: Release Preparation 📝

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 1.1 | Create release branch in each core repository | Release Agent 🤖 | ⬜ |
| 1.2 | Freeze feature merges (code freeze) | Orchestration Team | ⬜ |
| 1.3 | Generate changelog for each repository | Release Agent 🤖 | ⬜ |
| 1.4 | Update version numbers | Release Agent 🤖 | ⬜ |
| 1.5 | Create release PR in each repository | Release Agent 🤖 | ⬜ |

**Dry Run:** Create release branches in a test environment first

### Phase 2: Validation & Approval ✅

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 2.1 | Run full integration test suite | Test Agent 🤖 | ⬜ |
| 2.2 | Perform security scan | Security Scanning Agent 🤖 | ⬜ |
| 2.3 | Conduct release review meeting | Orchestration Team | ⬜ |
| 2.4 | Obtain sign-off from each team lead | All Team Leads | ⬜ |
| 2.5 | Final approval from Orchestration Team | Orchestration Team | ⬜ |

### Phase 3: Staging Deployment 🟡

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 3.1 | Deploy `blackroad-os-infra` changes | Infrastructure Team | ⬜ |
| 3.2 | Deploy `blackroad-os-api-gateway` | Backend Team | ⬜ |
| 3.3 | Deploy `blackroad-os-api` | Backend Team | ⬜ |
| 3.4 | Deploy `blackroad-os-core` | Core Platform Team | ⬜ |
| 3.5 | Deploy `blackroad-os-web` | Frontend Team | ⬜ |
| 3.6 | Deploy active packs | Packs Team | ⬜ |
| 3.7 | Verify staging environment health | Observability Team | ⬜ |

**Dry Run:** Validate each deployment in staging before production

### Phase 4: Staging Validation 🧪

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 4.1 | Execute staging smoke tests | Test Agent 🤖 | ⬜ |
| 4.2 | Perform manual QA verification | All Teams | ⬜ |
| 4.3 | Validate monitoring and alerting | Observability Team | ⬜ |
| 4.4 | Confirm staging sign-off | Orchestration Team | ⬜ |

### Phase 5: Production Deployment 🟢

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 5.1 | Enable maintenance mode (if applicable) | Infrastructure Team | ⬜ |
| 5.2 | Deploy infrastructure changes | Infrastructure Team | ⬜ |
| 5.3 | Deploy backend services (canary) | Backend Team | ⬜ |
| 5.4 | Verify canary health | Observability Team | ⬜ |
| 5.5 | Full backend rollout | Backend Team | ⬜ |
| 5.6 | Deploy frontend (canary) | Frontend Team | ⬜ |
| 5.7 | Full frontend rollout | Frontend Team | ⬜ |
| 5.8 | Deploy packs (canary → full) | Packs Team | ⬜ |
| 5.9 | Disable maintenance mode | Infrastructure Team | ⬜ |

### Phase 6: Post-Deployment Verification ✅

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 6.1 | Verify production health checks | Observability Team | ⬜ |
| 6.2 | Monitor error rates and performance | Observability Team | ⬜ |
| 6.3 | Validate critical user journeys | All Teams | ⬜ |
| 6.4 | Confirm no alert escalations | Observability Team | ⬜ |

### Phase 7: Release Finalization 🎉

| Step | Action | Owner | Status |
|------|--------|-------|--------|
| 7.1 | Merge release PRs in all repositories | Release Agent 🤖 | ⬜ |
| 7.2 | Create and push release tags | Release Agent 🤖 | ⬜ |
| 7.3 | Publish release notes | Brand & Docs Team | ⬜ |
| 7.4 | Update `status/summary.json` | Orchestration Team | ⬜ |
| 7.5 | Archive release artifacts | Observability Team | ⬜ |
| 7.6 | Send release announcement | Brand & Docs Team | ⬜ |
| 7.7 | Conduct release retrospective | Orchestration Team | ⬜ |

---

## ✅ Postconditions

After completion:

- [ ] All repositories are tagged with consistent version
- [ ] Production is running the new release
- [ ] Monitoring confirms stable operation
- [ ] Documentation is updated
- [ ] Release announcement is published
- [ ] Retrospective is scheduled

---

## ⚠️ Rollback Procedure

If critical issues occur during production deployment:

### Immediate Rollback (< 15 minutes)

1. **Stop further deployments** - Halt any pending service deployments
2. **Revert to previous version** - Use deployment platform rollback
3. **Verify rollback** - Confirm services are running previous version
4. **Notify stakeholders** - Send immediate notification

### Extended Rollback (> 15 minutes)

1. Enable maintenance mode
2. Revert database migrations (if any)
3. Rollback infrastructure changes
4. Deploy previous release version
5. Verify system stability
6. Disable maintenance mode
7. Conduct incident review

### Rollback Decision Tree

```
┌─────────────────────────────────────────┐
│ Issue Detected During Deployment?       │
└─────────────────────────────────────────┘
              │
     ┌────────┴────────┐
     ▼                 ▼
   Yes               No
     │                 │
     ▼                 ▼
┌─────────────┐  Continue Deployment
│ Critical?   │
└─────────────┘
     │
  ┌──┴──┐
  ▼     ▼
 Yes   No
  │     │
  ▼     ▼
Immediate   Can Wait?
Rollback       │
           ┌───┴───┐
           ▼       ▼
          Yes     No
           │       │
           ▼       ▼
        Hotfix  Immediate
        After   Rollback
        Release
```

---

## 📊 Release Order (Dependency Graph)

```
Level 1 (First):
├── blackroad-os-infra ☁️

Level 2 (After Infra):
├── blackroad-os-api-gateway 🌉
├── blackroad-os-archive 📦

Level 3 (After Gateway):
├── blackroad-os-api 🔌
├── blackroad-os-core 💻

Level 4 (After API/Core):
├── blackroad-os-web 🌐
├── blackroad-os-pack-* 📦

Level 5 (Last):
├── blackroad-os-prism-console 🕹️
├── blackroad-os-docs 📖
├── blackroad-os-home 🏠
```

---

## 🔐 Compliance Notes

For releases containing compliance-sensitive changes:

```
// COMPLIANCE-SENSITIVE ORCHESTRATION
```

Additional requirements:
- 💰 Finance features: Require audit trail documentation
- 🪪 Identity features: Require security certification
- ⚖️ Legal features: Require legal sign-off before release

---

## 📡 Related Links

- [Operator Release Jobs](https://github.com/BlackRoad-OS/blackroad-os-operator)
- [Prism Console Dashboards](https://github.com/BlackRoad-OS/blackroad-os-prism-console)
- [Infrastructure Runbooks](https://github.com/BlackRoad-OS/blackroad-os-infra)
- [Release Notes Template](https://github.com/BlackRoad-OS/blackroad-os-docs)
