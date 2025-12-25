# Pattern: [Pattern Name]

**Category:** [Architecture | Integration | Data | Security | Performance | UI/UX]  
**Status:** [Active | Deprecated | Experimental]  
**Last Updated:** YYYY-MM-DD  
**Author:** [Name/Team]  
**Tags:** [comma, separated, tags]

---

## Intent

*What problem does this pattern solve? One clear sentence.*

**Example:**
> Prevent cascading failures when external services are unavailable by failing fast and providing graceful degradation.

---

## Motivation

*Why is this pattern needed in BlackRoad OS? What pain points does it address?*

**Common Scenarios:**
- Scenario 1: [Description]
- Scenario 2: [Description]

**Without This Pattern:**
- Problem 1
- Problem 2

---

## Applicability

*When should you use this pattern?*

**Use this pattern when:**
- ✅ Condition 1
- ✅ Condition 2

**Don't use this pattern when:**
- ❌ Condition 1
- ❌ Condition 2

---

## Structure

*Visual representation of the pattern*

```
┌──────────────┐         ┌──────────────┐
│              │         │              │
│   Client     │────────▶│   Pattern    │
│              │         │   Component  │
└──────────────┘         └──────────────┘
                                │
                                ▼
                         ┌──────────────┐
                         │  Downstream  │
                         │   Service    │
                         └──────────────┘
```

**Key Components:**
1. **Component 1:** Description
2. **Component 2:** Description

---

## Implementation

### Basic Example

```typescript
// Example implementation in TypeScript
class PatternExample {
  constructor() {
    // Setup
  }

  async execute() {
    // Implementation
  }
}
```

### Advanced Example

```typescript
// More complex usage with error handling
class AdvancedPatternExample {
  // Full implementation with edge cases
}
```

---

## Participants

**Who/what is involved in this pattern?**

| Participant | Responsibility |
|-------------|----------------|
| Client | Initiates the operation |
| Pattern Component | Implements the pattern logic |
| Downstream Service | Provides the actual functionality |

---

## Collaborations

*How do the participants interact?*

1. Client calls Pattern Component
2. Pattern Component applies logic
3. Result is returned to Client

**Sequence Diagram:**
```
Client -> PatternComponent: request()
PatternComponent -> Downstream: delegatedRequest()
Downstream --> PatternComponent: response
PatternComponent --> Client: processedResponse
```

---

## Consequences

### Benefits
- ✅ Benefit 1
- ✅ Benefit 2
- ✅ Benefit 3

### Tradeoffs
- ⚠️ Tradeoff 1
- ⚠️ Tradeoff 2

### Risks
- ⚠️ Risk 1
- ⚠️ Risk 2

---

## Implementation Guidelines

### Configuration

```json
{
  "pattern": {
    "option1": "value",
    "option2": 100
  }
}
```

### Best Practices

1. **Practice 1:** Description
2. **Practice 2:** Description
3. **Practice 3:** Description

### Common Pitfalls

1. **Pitfall 1:** Description
   - **Solution:** How to avoid

2. **Pitfall 2:** Description
   - **Solution:** How to avoid

---

## Testing Strategy

### Unit Tests
```typescript
describe('PatternComponent', () => {
  it('should handle normal case', () => {
    // Test implementation
  });

  it('should handle error case', () => {
    // Test implementation
  });
});
```

### Integration Tests
*How to test the pattern in context*

---

## Real-World Usage

**Repositories Using This Pattern:**
- `blackroad-os-api` - [Link to implementation]
- `blackroad-os-gateway` - [Link to implementation]

**Success Stories:**
- Story 1: How this pattern solved Problem X
- Story 2: Performance improvement achieved

---

## Variations

### Variation 1: [Name]
*Description of how this varies from the base pattern*

**When to use:** [Context]

### Variation 2: [Name]
*Description of how this varies from the base pattern*

**When to use:** [Context]

---

## Related Patterns

- **[Pattern Name](./pattern-name.md):** Relationship description
- **[Another Pattern](./another-pattern.md):** Relationship description

**Differences:**
- This pattern vs Related Pattern: Key differences

---

## References

### Internal
- [ADR-YYYY-MM-DD: Decision that led to this pattern](../decisions/YYYY-MM-DD-title.md)
- [Practice: Related practice](../practices/practice-name.md)

### External
- [Book/Article Title](URL)
- [Research Paper](URL)

---

## Examples in Other Languages

### Python
```python
# Python implementation
class PatternExample:
    pass
```

### Go
```go
// Go implementation
type PatternExample struct {}
```

---

## Metrics and Monitoring

**Key Metrics to Track:**
- Metric 1: [Description] - Target: [value]
- Metric 2: [Description] - Target: [value]

**Monitoring Setup:**
```yaml
alert:
  name: pattern-issue
  condition: metric > threshold
  action: notify-team
```

---

## Migration Guide

*If replacing an old approach, how do you migrate?*

**Step 1:** [Description]  
**Step 2:** [Description]  
**Step 3:** [Description]

**Rollback Plan:**
- How to revert if issues occur

---

## FAQ

**Q: Common question about this pattern?**  
A: Answer

**Q: Another common question?**  
A: Answer

---

## Changelog

| Date | Change | Author |
|------|--------|--------|
| YYYY-MM-DD | Initial pattern | [name] |
| YYYY-MM-DD | Added variation | [name] |

---

*Template Version: 1.0*  
*Last Updated: 2025-12-25*
