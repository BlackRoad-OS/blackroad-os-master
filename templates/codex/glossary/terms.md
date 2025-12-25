# BlackRoad OS Glossary

> Definitions of terms, acronyms, and concepts used across the BlackRoad OS constellation

---

## Core Concepts

### BlackRoad OS
The complete ecosystem of services, packs, and infrastructure that form the BlackRoad operating system.

### Constellation
The collection of all BlackRoad OS repositories, services, and components working together as a unified system.

### Meta-Orchestrator
The `blackroad-os-master` repository that serves as the control book and coordination layer for the entire constellation.

---

## Repository Types

### Core Repo
Essential repositories that form the foundation of BlackRoad OS:
- `blackroad-os-core` - Core business logic
- `blackroad-os-web` - Frontend application
- `blackroad-os-api` - Backend API services
- `blackroad-os-api-gateway` - Edge gateway

### Pack
Domain-specific functionality modules that extend BlackRoad OS capabilities:
- `blackroad-os-pack-finance` 💰
- `blackroad-os-pack-legal` ⚖️
- `blackroad-os-pack-education` 📚
- `blackroad-os-pack-infra-devops` 🔧
- `blackroad-os-pack-creator-studio` 🎨

### Infrastructure Repo
Repositories that manage infrastructure, operations, and observability:
- `blackroad-os-infra` - Infrastructure as code
- `blackroad-os-operator` - Job orchestration
- `blackroad-os-prism-console` - Monitoring dashboards
- `blackroad-os-archive` - Data archival

### Support Repo
Repositories for documentation, branding, and research:
- `blackroad-os-docs` 📖
- `blackroad-os-brand` 🎨
- `blackroad-os-home` 🏠
- `blackroad-os-research` 🧪

---

## Status System

### GreenLight 🟢
**Status: Ready** - Component is production-ready, stable, and fully operational.

**Criteria:**
- All tests passing
- Documentation complete
- Deployed to production
- Monitoring active
- Compliance verified

### YellowLight 🟡
**Status: In-Progress** - Component is under active development or requires attention.

**Indicators:**
- New features in development
- Non-critical issues present
- Partial deployment
- Quality improvements needed

### RedLight 🔴
**Status: Blocked/Critical** - Component has critical issues requiring immediate attention.

**Triggers:**
- Production outage
- Critical security vulnerability
- Major functionality broken
- Compliance violation

---

## Orchestration Terms

### Playbook
Step-by-step guide for executing complex cross-repo workflows (e.g., spinning up a new pack, launching an environment, coordinating releases).

### Registry
JSON-based catalog of repos, teams, agents, or configurations that serves as a source of truth.

### Agent Lane
Defined category of automated actions that agents can perform, with specific guardrails and restrictions.

### Guardrail
Safety constraint that prevents agents or automation from making risky or unauthorized changes.

---

## Team & Ownership

### Ownership Area
The repositories and domains that a team is responsible for maintaining and evolving.

### Escalation Path
Defined sequence of teams to notify when issues occur in a specific domain (e.g., security incidents → infrastructure → core-platform → orchestration).

### On-Call Rotation
Schedule of team members responsible for responding to incidents during specific time periods.

---

## Infrastructure & Operations

### Prism Console
The runtime dashboard and monitoring system (`blackroad-os-prism-console`) that provides visibility into system health.

### Operator
The job orchestration system (`blackroad-os-operator`) that automates workflows across the constellation.

### Archive
Long-term data storage and backup system (`blackroad-os-archive`).

### Environment
Deployment target (dev, staging, prod) where BlackRoad OS services run.

---

## Compliance & Security

### Compliance-Sensitive
Designation for systems that handle regulated data or require special oversight (finance 💰, identity 🪪, legal ⚖️).

### COMPLIANCE-SENSITIVE ORCHESTRATION
Marker in playbooks indicating additional review and approval requirements for operations touching sensitive systems.

### Security Scan
Automated analysis of code and dependencies for vulnerabilities (e.g., CodeQL, dependency checks).

---

## Release & Deployment

### Release Train
Coordinated release process that deploys updates across multiple repositories simultaneously.

### Canary Deployment
Gradual rollout strategy where changes are deployed to a small subset of infrastructure first, then expanded if stable.

### Rollback
Process of reverting to a previous version when issues are detected in a deployment.

### Feature Flag
Configuration toggle that enables/disables features without code deployment.

---

## Development Practices

### CodeOwners
GitHub mechanism for designating teams/individuals responsible for reviewing changes to specific paths.

### CI/CD
Continuous Integration / Continuous Deployment - automated pipelines for testing and deploying code.

### ADR (Architecture Decision Record)
Document in the Codex that captures a significant architectural decision, alternatives considered, and rationale.

### Pattern
Reusable solution to a common problem, documented in the Codex for reference and consistency.

---

## Automation & Agents

### Agent
Automated system that performs tasks like code review, dependency updates, testing, or documentation generation.

### Bot
Synonym for agent in many contexts.

### Automation Config
JSON files that define what automation and agents are allowed to do and where (`config/automation.json`, `config/agent-lanes.json`).

---

## Codex Terms

### Codex
The living knowledge base (`templates/codex/`) containing decisions, patterns, practices, and glossary.

### ADR (Architecture Decision Record)
Formal document recording an architectural decision, context, options considered, and outcome.

### Pattern
Documented reusable solution to a recurring problem in the codebase.

### Practice
Team convention or best practice documented for consistency (e.g., code review guidelines, testing strategies).

---

## Metrics & Monitoring

### SLA (Service Level Agreement)
Commitment to specific performance or availability targets (e.g., 99.9% uptime).

### SLO (Service Level Objective)
Internal target for service performance (more ambitious than SLA).

### SLI (Service Level Indicator)
Measurable metric used to assess service performance (e.g., response time, error rate).

### Uptime
Percentage of time a service is operational and accessible.

### MTTR (Mean Time to Recovery)
Average time taken to restore service after an incident.

---

## Incident Management

### Incident
Unplanned interruption or degradation of service requiring response.

### Postmortem
Blameless retrospective after an incident to identify root cause and improvements.

### War Room
Dedicated communication channel (e.g., Slack channel) for coordinating incident response.

### Incident Commander
Person leading the response to an incident.

### Status Page
Public or internal page showing current system status and ongoing incidents.

---

## Acronyms

| Acronym | Meaning |
|---------|---------|
| ADR | Architecture Decision Record |
| API | Application Programming Interface |
| CI/CD | Continuous Integration / Continuous Deployment |
| CVE | Common Vulnerabilities and Exposures |
| DNS | Domain Name System |
| ETA | Estimated Time of Arrival/Completion |
| IaC | Infrastructure as Code |
| MTTR | Mean Time to Recovery |
| P0/P1/P2 | Priority levels (0=critical, 1=high, 2=medium) |
| PR | Pull Request |
| QA | Quality Assurance |
| RBAC | Role-Based Access Control |
| REST | Representational State Transfer |
| SLA | Service Level Agreement |
| SLI | Service Level Indicator |
| SLO | Service Level Objective |
| SOC 2 | Service Organization Control 2 (security audit standard) |
| SSL/TLS | Secure Sockets Layer / Transport Layer Security |
| TTL | Time to Live |
| UI/UX | User Interface / User Experience |
| VPC | Virtual Private Cloud |

---

## Emoji Legend

| Emoji | Meaning |
|-------|---------|
| 🧠 | Master/meta brain, orchestration |
| 🧭 | Maps, registries, navigation |
| 📓 | Playbooks, orchestration plans |
| 🧩 | Multi-repo workflows |
| 📊 | Summary status, metrics |
| 🤖 | Agent lanes, guardrails |
| ⚖️ | Compliance-sensitive flows |
| 🟢 | GreenLight - Ready status |
| 🟡 | YellowLight - In-progress status |
| 🟠 | Experimental status |
| 🔴 | RedLight - Blocked/critical status |
| 💰 | Finance-related |
| 🪪 | Identity-related |
| 🔐 | Security-related |
| ☁️ | Infrastructure, cloud |
| 🚀 | Release, deployment |
| 🔧 | DevOps, tooling |
| 📦 | Packs, packages |
| 🎨 | Brand, design, creativity |
| 📖 | Documentation |
| 🏠 | Home, landing page |
| 🧪 | Research, experimental |
| 🕹️ | Dashboards, monitoring |
| ⚙️ | Operator, automation |
| 📡 | Links, external references |

---

## Contributing

To add a new term:
1. Identify the appropriate section
2. Add the term and definition
3. Link to related documents when applicable
4. Submit a PR for review

---

*Last Updated: 2025-12-25*  
*Maintained by: Orchestration Team 🧠*
