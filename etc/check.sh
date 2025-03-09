#!/usr/bin/env bash

set -euxo pipefail

ETC=$(cd $(dirname $0) ; pwd)
export GHCVER=$(sed -n "s/^ghc-version: \"\(.*\)\"/\1/p" "$ETC/../build-constraints/lts-23-build-constraints.yaml")

# Download and unpack the stack executable
mkdir -p ~/.local/bin
export PATH=$HOME/.local/bin:$PATH
curl -L https://www.stackage.org/stack/linux-x86_64 | tar xz --wildcards --strip-components=1 -C ~/.local/bin '*/stack'

# Get new Stackage curator
curl -L "https://github.com/commercialhaskell/curator/releases/download/latest/curator.bz2" | bunzip2 > curator
chmod +x curator

# Install GHC
stack setup $GHCVER

./build-constraints/check-lts
