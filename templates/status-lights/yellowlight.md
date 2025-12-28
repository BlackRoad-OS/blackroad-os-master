# 🟡 YellowLight Template

> **Status: IN-PROGRESS** — Component is under active development or requires attention

---

## 🎯 YellowLight Status Indicators

A component is in **YellowLight** status when:

### 🔧 Active Development
- [ ] New features being implemented
- [ ] Major refactoring in progress
- [ ] API changes planned or ongoing
- [ ] Migration to new architecture underway

### ⚠️ Issues Requiring Attention
- [ ] Non-critical bugs present
- [ ] Performance optimization needed
- [ ] Technical debt accumulation
- [ ] Documentation gaps

### 🚧 Partial Deployment
- [ ] Deployed to dev and/or staging only
- [ ] Feature flags controlling rollout
- [ ] A/B testing in progress
- [ ] Gradual rollout to production

---

## 📊 YellowLight Checklist Template

Copy this template when marking a component as YellowLight:

```yaml
component: blackroad-os-{name}
status: yellowlight
emoji: 🟡
version: 0.5.0
environments:
  - dev: ✅
  - staging: ✅
  - prod: 🚧 (partial)

current_phase: [development|optimization|migration|testing]

blockers:
  - description: "Waiting for API gateway updates"
    severity: medium
    owner: backend-team
    eta: 2025-12-30
  
work_in_progress:
  - feature: "New dashboard widgets"
    progress: 60%
    target: 2026-01-15
  
known_issues:
  - id: ISSUE-123
    description: "Slow query on large datasets"
    severity: low
    workaround: "Use pagination"
  
missing_criteria:
  - "Load testing not completed"
  - "Documentation in draft"
  - "Monitoring dashboards partial"

target_greenlight: 2026-02-01T00:00:00Z
last_updated: 2025-12-25T00:00:00Z
updated_by: [team-name]
```

---

## 🚦 Path to GreenLight

### Action Items
1. **Complete Development**
   - Finish pending features
   - Resolve known bugs
   - Stabilize APIs

2. **Testing & Validation**
   - Achieve test coverage targets
   - Complete load/stress testing
   - User acceptance testing

3. **Documentation**
   - Finalize API documentation
   - Complete runbooks
   - Update architecture docs

4. **Operations Readiness**
   - Configure full monitoring
   - Test backup/recovery
   - Establish on-call rotation

### Timeline Template
```
Week 1-2: Feature completion
Week 3: Testing & bug fixes
Week 4: Documentation
Week 5: Operations setup
Week 6: GreenLight review
```

---

## ⚠️ Risk Monitoring

### Escalation to RedLight

Move to **RedLight** if:
- Critical bug discovered
- Security vulnerability (high/critical)
- Production impact detected
- Deadline missed by >2 weeks
- Team capacity lost

### Indicators to Watch
- 🔴 Test failure rate increasing
- 🔴 Bug count growing
- 🔴 Performance degrading
- 🔴 Scope creep detected
- 🔴 Dependencies blocked

---

## 🛠️ YellowLight Best Practices

### Communication
- Daily standups for active development
- Weekly status updates to stakeholders
- Transparent blocker tracking
- Regular demos of progress

### Quality Gates
- Code review required for all changes
- Automated tests must pass
- Performance benchmarks tracked
- Security scans on every build

### Resource Management
- Clear owner assignments
- Backup owners identified
- Estimated completion dates
- Regular timeline reviews

---

## 📋 YellowLight Registry Entry

Update these files for YellowLight status:

1. **registries/repos.json**
   ```json
   {
     "status": "in-progress",
     "emoji": "🟡",
     "notes": "Active development - dashboard features"
   }
   ```

2. **status/summary.json**
   ```json
   {
     "status": "in-progress",
     "emoji": "🟡",
     "notes": "Active development phase",
     "targetGreenlight": "2026-02-01T00:00:00Z"
   }
   ```

3. Update project board status to "In Progress"

---

## 🔗 Related Templates

- [GreenLight Template](./greenlight.md) - Ready status
- [RedLight Template](./redlight.md) - Blocked/critical status
- [Status Transition Playbook](../../playbooks/status-transition.md)
