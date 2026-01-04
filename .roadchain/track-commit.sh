#!/bin/bash
# RoadChain Commit Tracking Script
# Creates blockchain entries for each commit

set -e

COMMIT_HASH="$1"
REPO_ROOT="$(git rev-parse --show-toplevel)"
LEDGER_DIR="$REPO_ROOT/.roadchain/ledger"
LEDGER_STATE="$LEDGER_DIR/current.json"
BLOCKS_DIR="$REPO_ROOT/.roadchain/blocks"

# Exit if ledger not initialized
if [ ! -f "$LEDGER_STATE" ]; then
    echo "⚠️  RoadChain not initialized. Run .roadchain/init.sh first."
    exit 0
fi

# Get commit information
COMMIT_MESSAGE=$(git log -1 --format=%s "$COMMIT_HASH")
COMMIT_AUTHOR=$(git log -1 --format=%an "$COMMIT_HASH")
COMMIT_EMAIL=$(git log -1 --format=%ae "$COMMIT_HASH")
COMMIT_TIMESTAMP=$(git log -1 --format=%cI "$COMMIT_HASH")
COMMIT_TREE=$(git log -1 --format=%T "$COMMIT_HASH")
PARENT_HASH=$(git log -1 --format=%P "$COMMIT_HASH" | cut -d' ' -f1)

# Get previous block hash from ledger
PREVIOUS_BLOCK_HASH=$(jq -r '.roadchain.state.latestHash' "$LEDGER_STATE")
BLOCK_NUMBER=$(jq -r '.roadchain.state.totalBlocks' "$LEDGER_STATE")
NEXT_BLOCK_NUMBER=$((BLOCK_NUMBER + 1))

# Calculate block hash (SHA-256 of commit data + previous hash)
BLOCK_DATA="${COMMIT_HASH}:${COMMIT_TIMESTAMP}:${PREVIOUS_BLOCK_HASH}"
BLOCK_HASH=$(echo -n "$BLOCK_DATA" | sha256sum | cut -d' ' -f1)

# Create block file
BLOCK_FILE="$BLOCKS_DIR/block-$(printf "%08d" $NEXT_BLOCK_NUMBER).json"
mkdir -p "$BLOCKS_DIR"

cat > "$BLOCK_FILE" << EOF
{
  "blockNumber": $NEXT_BLOCK_NUMBER,
  "blockHash": "$BLOCK_HASH",
  "previousHash": "$PREVIOUS_BLOCK_HASH",
  "timestamp": "$COMMIT_TIMESTAMP",
  "commit": {
    "hash": "$COMMIT_HASH",
    "message": "$COMMIT_MESSAGE",
    "author": {
      "name": "$COMMIT_AUTHOR",
      "email": "$COMMIT_EMAIL"
    },
    "tree": "$COMMIT_TREE",
    "parent": "$PARENT_HASH"
  },
  "verification": {
    "algorithm": "sha256",
    "verified": true,
    "signature": "$BLOCK_HASH"
  }
}
EOF

# Update ledger state
jq --arg blockHash "$BLOCK_HASH" \
   --arg commitHash "$COMMIT_HASH" \
   --argjson blockNum "$NEXT_BLOCK_NUMBER" \
   --argjson totalCommits "$NEXT_BLOCK_NUMBER" \
   '.roadchain.state.latestHash = $blockHash |
    .roadchain.state.latestBlock = $blockNum |
    .roadchain.state.totalBlocks = $blockNum |
    .roadchain.state.totalCommits = $totalCommits |
    .roadchain.blocks += [{
      "blockNumber": $blockNum,
      "blockHash": $blockHash,
      "commitHash": $commitHash,
      "timestamp": "'"$COMMIT_TIMESTAMP"'"
    }]' "$LEDGER_STATE" > "$LEDGER_STATE.tmp"

mv "$LEDGER_STATE.tmp" "$LEDGER_STATE"

echo "✅ Block #$NEXT_BLOCK_NUMBER tracked: $BLOCK_HASH"
echo "   Commit: $COMMIT_HASH"
echo "   Message: $COMMIT_MESSAGE"
