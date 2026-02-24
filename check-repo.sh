#!/bin/bash
set -e

REPO_ROOT="docs/dists/stable"
CONFIG="apt-release.conf"

echo "🔍 Starting Repository Validation..."

# 1. Check if config exists
if [ ! -f "$CONFIG" ]; then
    echo "❌ Error: $CONFIG not found!"
    exit 1
fi

# 2. Extract expected architectures from config
EXPECTED_ARCHS=$(grep "Architectures" "$CONFIG" | sed 's/.*"\(.*\)".*/\1/')

for ARCH in $EXPECTED_ARCHS; do
    PKG_FILE="$REPO_ROOT/main/binary-$ARCH/Packages"
    if [ -f "$PKG_FILE" ]; then
        COUNT=$(grep -c "Package:" "$PKG_FILE" || true)
        echo "✅ Arch $ARCH: Found ($COUNT packages)"
    else
        echo "⚠️  Warning: Arch $ARCH is missing a Packages file!"
        # Optional: exit 1 if you want to force a failure here
    fi
done

# 3. Verify Release file contains hashes
if grep -q "SHA256" "$REPO_ROOT/Release"; then
    echo "✅ Release file contains SHA256 hashes."
else
    echo "❌ Error: Release file is missing security hashes!"
    exit 1
fi

# 4. Verify GPG Signature
if gpg --verify "$REPO_ROOT/InRelease" > /dev/null 2>&1; then
    echo "✅ GPG Signature (InRelease) is valid."
else
    echo "❌ Error: GPG Signature is invalid or missing!"
    exit 1
fi

echo "🚀 Validation Passed!"