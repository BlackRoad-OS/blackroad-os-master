#!/bin/bash
# RoadChain Initialization Script
# Initializes the blockchain ledger for commit tracking

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$SCRIPT_DIR/.."
LEDGER_DIR="$REPO_ROOT/.roadchain/ledger"
CONFIG_FILE="$REPO_ROOT/roadchain-config.json"

echo "🔗 Initializing RoadChain for $(basename $REPO_ROOT)..."

# Create directories
mkdir -p "$LEDGER_DIR"
mkdir -p "$REPO_ROOT/.roadchain/blocks"
mkdir -p "$REPO_ROOT/.roadchain/state"

# Get repository info
REPO_NAME=$(basename $REPO_ROOT)
REPO_ORG=$(git remote get-url origin | sed -E 's/.*[:/]([^/]+)\/[^/]+\.git/\1/' 2>/dev/null || echo "local")
GENESIS_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
GENESIS_HASH=$(echo -n "${REPO_ORG}/${REPO_NAME}:${GENESIS_TIMESTAMP}" | sha256sum | cut -d' ' -f1)

# Create genesis block
GENESIS_BLOCK="$LEDGER_DIR/genesis.json"
cat > "$GENESIS_BLOCK" << EOF
{
  "roadchain": {
    "version": "1.0.0",
    "chainId": "$REPO_NAME",
    "genesis": {
      "timestamp": "$GENESIS_TIMESTAMP",
      "hash": "$GENESIS_HASH",
      "previousHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "repository": {
        "name": "$REPO_NAME",
        "organization": "$REPO_ORG",
        "fullName": "${REPO_ORG}/${REPO_NAME}"
      },
      "metadata": {
        "created": "$GENESIS_TIMESTAMP",
        "version": "1.0.0",
        "type": "genesis"
      }
    },
    "blocks": [],
    "state": {
      "latestBlock": 0,
      "latestHash": "$GENESIS_HASH",
      "totalCommits": 0,
      "totalBlocks": 0
    }
  }
}
EOF

echo "✅ Genesis block created: $GENESIS_HASH"

# Create current ledger state
LEDGER_STATE="$LEDGER_DIR/current.json"
cp "$GENESIS_BLOCK" "$LEDGER_STATE"

echo "✅ Ledger initialized at $LEDGER_DIR"

# Add commit tracking hook
HOOKS_DIR="$REPO_ROOT/.git/hooks"
POST_COMMIT_HOOK="$HOOKS_DIR/post-commit"

cat > "$POST_COMMIT_HOOK" << 'EOFHOOK'
#!/bin/bash
# RoadChain Post-Commit Hook
# Tracks commits to the blockchain ledger

REPO_ROOT="$(git rev-parse --show-toplevel)"
ROADCHAIN_SCRIPT="$REPO_ROOT/.roadchain/track-commit.sh"

if [ -f "$ROADCHAIN_SCRIPT" ]; then
    "$ROADCHAIN_SCRIPT" "$(git rev-parse HEAD)"
fi
EOFHOOK

chmod +x "$POST_COMMIT_HOOK"

echo "✅ Git hooks installed"
echo "🔗 RoadChain initialization complete!"
echo ""
echo "Repository Chain ID: $REPO_NAME"
echo "Genesis Hash: $GENESIS_HASH"
echo "Ledger Location: $LEDGER_DIR"
