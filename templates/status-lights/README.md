# 🚦 Status Light Templates

> Standardized templates for GreenLight 🟢, YellowLight 🟡, and RedLight 🔴 status management across BlackRoad OS

---

## 🎯 Overview

The Status Light system provides a clear, universal language for communicating component health across the entire BlackRoad OS constellation. Every repository, service, pack, and environment can be assigned one of three status levels.

---

## 🚦 The Three Lights

| Status | Emoji | Meaning | Template |
|--------|-------|---------|----------|
| **GreenLight** | 🟢 | Ready - Production stable, fully operational | [greenlight.md](./greenlight.md) |
| **YellowLight** | 🟡 | In-Progress - Under development or needs attention | [yellowlight.md](./yellowlight.md) |
| **RedLight** | 🔴 | Blocked/Critical - Requires immediate action | [redlight.md](./redlight.md) |

---

## 📋 Quick Start

### 1. Assess Current Status
Review your component against the criteria in each template:
- GreenLight: All quality, ops, and compliance criteria met
- YellowLight: Active work or issues requiring attention
- RedLight: Critical issues or blockers present

### 2. Apply the Template
Copy the appropriate template's checklist and fill it out for your component.

### 3. Update Registries
Update the status in:
- `registries/repos.json`
- `status/summary.json`
- Project boards and dashboards

### 4. Communicate
- Announce status changes to stakeholders
- Update documentation
- Set expectations for timeline

---

## 🔄 Status Transitions

### GreenLight → YellowLight
**Triggers:**
- New feature development started
- Performance optimization needed
- Non-critical bugs discovered
- Planned maintenance/refactoring

**Actions:**
1. Update status in registries
2. Create work plan with milestones
3. Notify stakeholders
4. Maintain quality gates

### YellowLight → GreenLight
**Triggers:**
- All development complete
- Tests passing, docs updated
- Deployed to production
- Quality criteria met

**Actions:**
1. Complete GreenLight checklist
2. Get team sign-off
3. Update all registries
4. Announce achievement

### GreenLight → RedLight
**Triggers:**
- Production outage
- Critical security issue
- Major functionality broken
- Compliance violation

**Actions:**
1. Declare incident immediately
2. Assemble response team
3. Follow incident protocol
4. Update status page

### YellowLight → RedLight
**Triggers:**
- Critical bug discovered
- Hard blocker encountered
- Security vulnerability found
- Resource crisis

**Actions:**
1. Escalate immediately
2. Pause non-critical work
3. Focus on resolution
4. Frequent stakeholder updates

### RedLight → YellowLight
**Triggers:**
- Crisis resolved
- Service restored
- Root cause addressed
- Stability returned

**Actions:**
1. Complete incident report
2. Schedule postmortem
3. Create action items
4. Plan return to GreenLight

### RedLight → GreenLight
**Rare:** Only if incident was very brief with full resolution and no follow-up work needed.

---

## 📊 Status Dashboard Integration

### Prism Console
Status lights should be prominently displayed in the Prism Console dashboard:

```json
{
  "component": "blackroad-os-web",
  "status": "greenlight",
  "emoji": "🟢",
  "lastVerified": "2025-12-25T00:00:00Z",
  "metrics": {
    "uptime": "99.99%",
    "responseTime": "120ms",
    "errorRate": "0.01%"
  }
}
```

### Operator Jobs
Status light checks can be automated:

```yaml
job:
  name: status-light-monitor
  schedule: "*/15 * * * *"  # Every 15 minutes
  actions:
    - check_health_metrics
    - verify_test_status
    - validate_deployment
    - update_status_light
```

---

## 🎯 Best Practices

### 1. Be Honest
- Don't inflate status to GreenLight prematurely
- Don't delay RedLight declaration when appropriate
- Transparency builds trust

### 2. Be Consistent
- Use same criteria across all components
- Update status promptly
- Follow templates exactly

### 3. Be Proactive
- Monitor indicators that predict transitions
- Plan YellowLight work to avoid RedLight
- Maintain GreenLight status actively

### 4. Be Clear
- Status should be obvious to anyone
- Include notes explaining context
- Link to detailed information

---

## 🧬 Integration with Registries

### repos.json
```json
{
  "id": "blackroad-os-pack-finance",
  "name": "Pack: Finance",
  "status": "in-progress",
  "emoji": "🟡",
  "statusDetails": {
    "light": "yellowlight",
    "phase": "development",
    "targetGreenlight": "2026-02-01"
  }
}
```

### status/summary.json
```json
{
  "subsystems": {
    "packs": {
      "status": "in-progress",
      "emoji": "🟡",
      "components": {
        "blackroad-os-pack-finance": {
          "status": "in-progress",
          "emoji": "🟡",
          "light": "yellowlight"
        }
      }
    }
  }
}
```

---

## 📡 Related Resources

- [GreenLight Template](./greenlight.md) - 🟢 Ready status
- [YellowLight Template](./yellowlight.md) - 🟡 In-progress status
- [RedLight Template](./redlight.md) - 🔴 Blocked/critical status
- [Status Transition Playbook](../../playbooks/status-transition.md)
- [Incident Response Playbook](../../playbooks/incident-response.md)
- [Status Summary JSON](../../status/summary.json)

---

## 🚀 Quick Reference Card

```
🟢 GreenLight = SHIP IT!
   → Production ready
   → Tests passing
   → Docs complete
   → Monitoring active
   → Team confident

🟡 YellowLight = WORK IN PROGRESS
   → Active development
   → Some issues present
   → Timeline established
   → Path to green clear
   → Regular updates

🔴 RedLight = ALL HANDS ON DECK
   → Critical issue
   → Immediate action needed
   → Incident response active
   → Frequent communication
   → Clear escalation
```

---

*Last Updated: 2025-12-25*  
*Maintained by: Orchestration Team 🧠*
