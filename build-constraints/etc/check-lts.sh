#!/usr/bin/env bash

set -euxo pipefail

ETC=$(cd $(dirname $0) ; pwd)
export GHCVER=$(sed -n "s/^ghc-version: \"\(.*\)\"/\1/p" "$ETC/../lts-24-build-constraints.yaml")

# bootstrap pantry db since GH action keeps fails to generate fresh one
if [ ! -e ~/.stack/pantry/pantry.sqlite3 ]; then
    mkdir -p ~/.stack/pantry
    curl -L https://petersen.fedorapeople.org/pantry.sqlite3.gz | gunzip > ~/.stack/pantry/pantry.sqlite3
fi

# Download and unpack the stack executable
mkdir -p ~/.local/bin
export PATH=$HOME/.local/bin:$PATH
curl -L https://www.stackage.org/stack/linux-x86_64 | tar xz --wildcards --strip-components=1 -C ~/.local/bin '*/stack'

# Get new Stackage curator
curl -L "https://github.com/commercialhaskell/curator/releases/download/commit-6689440033b12182c0853bdd23880a84849eb6b2/curator.bz2" | bunzip2 > ~/.local/bin/curator
chmod +x ~/.local/bin/curator

# Install GHC
stack setup $GHCVER

./build-constraints/check-lts
