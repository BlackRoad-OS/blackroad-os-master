# 🔴 RedLight Template

> **Status: BLOCKED / CRITICAL** — Component has critical issues requiring immediate attention

---

## 🚨 RedLight Status Triggers

A component enters **RedLight** status when:

### 🔥 Critical Issues
- [ ] Production outage or service degradation
- [ ] Critical security vulnerability (CVE score ≥ 7.0)
- [ ] Data loss or corruption risk
- [ ] Compliance violation
- [ ] Major functionality broken

### 🚫 Blockers
- [ ] Hard dependency failure
- [ ] Resource exhaustion (budget, capacity)
- [ ] Team capacity crisis
- [ ] Legal/regulatory block
- [ ] Critical third-party service down

### ⚠️ High-Risk Conditions
- [ ] Failed production deployment
- [ ] Cascading system failures
- [ ] Security breach detected
- [ ] SLA violations
- [ ] Customer escalations

---

## 🚨 RedLight Declaration Template

Copy this template when declaring RedLight status:

```yaml
component: blackroad-os-{name}
status: redlight
emoji: 🔴
severity: [P0-critical|P1-high]

incident:
  id: INC-2025-1234
  declared: 2025-12-25T06:00:00Z
  declared_by: [name]
  title: "Brief description of the critical issue"
  
  impact:
    affected_users: [all|percentage|specific-group]
    affected_services: [list]
    business_impact: critical
    environments:
      - prod: ❌ DOWN
      - staging: ⚠️ DEGRADED
      - dev: ✅ OK
  
  root_cause:
    category: [infra|code|dependency|security|config]
    description: "Detailed root cause"
    first_detected: 2025-12-25T05:45:00Z
    
  response:
    incident_commander: [name]
    response_team: [team-members]
    war_room: [slack-channel-link]
    status_page: [link]
    
  timeline:
    - 05:45: "Issue detected by monitoring"
    - 06:00: "RedLight declared"
    - 06:15: "Incident response team assembled"
    - 06:30: "Root cause identified"
    - 07:00: "Fix deployed to prod"
    
  resolution:
    status: [investigating|mitigating|resolved]
    eta: 2025-12-25T08:00:00Z
    rollback_completed: false
    services_restored: false
```

---

## 🚨 Immediate Response Actions

### First 5 Minutes
1. **Declare Incident** - Use incident management system
2. **Assemble Team** - Page on-call + incident commander
3. **Create War Room** - Dedicated communication channel
4. **Start Status Page** - Update customers
5. **Begin Timeline** - Document all actions

### First 15 Minutes
1. **Assess Impact** - Scope of affected services/users
2. **Identify Root Cause** - Initial investigation
3. **Implement Mitigation** - Stop the bleeding
4. **Escalate** - Notify leadership if needed
5. **Update Stakeholders** - Regular status updates

### First Hour
1. **Deploy Fix or Rollback** - Restore service
2. **Verify Resolution** - Confirm systems healthy
3. **Update Status Page** - Inform customers
4. **Capture Logs** - Preserve for postmortem
5. **Plan Monitoring** - Watch for recurrence

---

## 🔒 Compliance-Sensitive RedLight

For incidents involving compliance-sensitive systems:

```
// COMPLIANCE-SENSITIVE ORCHESTRATION
```

### Additional Requirements

**Finance Systems (💰)**
- [ ] Notify compliance team immediately
- [ ] Freeze all transactions if data integrity at risk
- [ ] Document all actions for audit trail
- [ ] Engage legal team if customer impact

**Identity Systems (🪪)**
- [ ] Security team must lead response
- [ ] Check for unauthorized access
- [ ] Review authentication logs
- [ ] Customer notification may be required

**Legal Systems (⚖️)**
- [ ] Legal team must be informed
- [ ] Preserve all evidence
- [ ] Consider regulatory reporting
- [ ] Document handling procedures

---

## 📊 RedLight Communication Protocol

### Internal Updates (Every 15-30 minutes)
```markdown
**Status Update #[N] - [HH:MM UTC]**

🔴 Status: [investigating|mitigating|resolved]
🎯 Current Action: [what we're doing now]
⏰ ETA: [expected resolution time]
👥 Team: [who's working on it]
📈 Progress: [what's been done]
```

### External Updates (Every 30-60 minutes)
```markdown
**Incident Update - [HH:MM UTC]**

We are aware of an issue affecting [service/feature].
Our team is actively working on a resolution.
ETA: [time]

Affected: [what's impacted]
Workaround: [if available]
Next Update: [time]
```

---

## 🔄 Path to YellowLight

### Resolution Checklist
- [ ] Root cause fully identified
- [ ] Fix deployed and verified
- [ ] Services restored to normal
- [ ] Monitoring confirms stability
- [ ] No recurrence for 2+ hours
- [ ] Postmortem scheduled

### Transition Criteria
Move to **YellowLight** when:
- ✅ Immediate crisis resolved
- ✅ Service restored (may be degraded)
- ✅ No active customer impact
- ✅ Root cause understood
- ✅ Monitoring shows stability

---

## 📝 Post-Incident Actions

### Immediate (Within 24 hours)
1. **Write Incident Report**
   - Timeline of events
   - Root cause analysis
   - Impact assessment
   - Resolution steps

2. **Update Documentation**
   - Runbooks with new learnings
   - Known issues list
   - Monitoring gaps identified

### Short-term (Within 1 week)
1. **Conduct Postmortem**
   - Blameless review
   - Action items identified
   - Process improvements
   - Follow-up owners assigned

2. **Implement Quick Fixes**
   - Address immediate gaps
   - Improve monitoring/alerting
   - Update response procedures

### Long-term (Within 1 month)
1. **Execute Action Items**
   - Architectural improvements
   - Test coverage gaps
   - Automation opportunities
   - Team training needs

2. **Validate Improvements**
   - Test incident response
   - Verify monitoring
   - Update status to GreenLight (if ready)

---

## 📋 RedLight Registry Entry

Update these files during RedLight:

1. **registries/repos.json**
   ```json
   {
     "status": "blocked",
     "emoji": "🔴",
     "incident": "INC-2025-1234",
     "notes": "Production outage - under active resolution"
   }
   ```

2. **status/summary.json**
   ```json
   {
     "status": "blocked",
     "emoji": "🔴",
     "incident": {
       "id": "INC-2025-1234",
       "severity": "P0-critical",
       "eta": "2025-12-25T08:00:00Z"
     }
   }
   ```

3. Create incident log in **incidents/[YYYY]/[incident-id].md**

---

## 🔗 Related Templates

- [GreenLight Template](./greenlight.md) - Ready status
- [YellowLight Template](./yellowlight.md) - In-progress status
- [Incident Response Playbook](../../playbooks/incident-response.md)
- [Postmortem Template](../postmortem-template.md)
