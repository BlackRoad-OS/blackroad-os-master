# 🔗 RoadChain: Blockchain Commit Tracking System

**Version:** 1.0.0  
**Author:** BlackRoad OS, Inc.  
**Purpose:** Immutable SHA-256-based commit tracking and verification

---

## Overview

RoadChain is BlackRoad OS's proprietary blockchain-based commit tracking system that creates an immutable, cryptographically-secure ledger of all repository changes. Every commit is tracked as a block in a distributed blockchain, providing tamper-proof verification and audit trails.

---

## Quick Start

### Initialize RoadChain

```bash
./.roadchain/init.sh
```

### View Ledger

```bash
cat .roadchain/ledger/current.json | jq .
```

### Verify Chain

```bash
jq -r '.roadchain.state.totalBlocks' .roadchain/ledger/current.json
```

---

## Architecture

### Block Structure

Each commit creates a new block with SHA-256 hashing:

```json
{
  "blockNumber": 1,
  "blockHash": "sha256-hash",
  "previousHash": "parent-hash",
  "commit": {
    "hash": "git-commit-sha",
    "message": "commit message",
    "author": { "name": "...", "email": "..." }
  }
}
```

### Security

- **SHA-256 hashing** for all blocks
- **Chain linking** ensures tamper-proof history
- **Distributed backup** to RoadChain network
- **Automatic verification** via GitHub Actions

---

## Features

✅ **Immutable Ledger** - Commits permanently recorded  
✅ **SHA-256 Verification** - Cryptographic security  
✅ **Distributed Sync** - Network-wide backup  
✅ **Real-Time Tracking** - Automatic on every commit  
✅ **API Integration** - REST API access  
✅ **Cross-Repo Support** - Multi-repository tracking

---

## API

```bash
# Get ledger
curl https://roadchain-api.blackroad.io/v1/ledger/blackroad-os-master

# Sync ledger
curl -X POST https://roadchain-api.blackroad.io/v1/sync \
  -H "Content-Type: application/json" \
  -d @.roadchain/ledger/current.json
```

---

**Copyright © 2025-2026 BlackRoad OS, Inc. All rights reserved.**
