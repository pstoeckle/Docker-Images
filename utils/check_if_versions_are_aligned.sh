#!/bin/bash
set -eu
RUBY_VERSION_IN_DOCKERFILE=$(grep -oE 'ENV RUBY_VERSION=([0-9]+\.[0-9]+\.[0-9]+)' node-ruby/Dockerfile | cut -d'=' -f2)
readonly RUBY_VERSION_IN_DOCKERFILE

NODE_VERSION_IN_DOCKERFILE=$(grep -oE 'FROM node:([0-9]+\.[0-9]+\.[0-9]+)' node-ruby/Dockerfile | cut -d':' -f2 | cut -d'-' -f1)
readonly NODE_VERSION_IN_DOCKERFILE

COMBINED="${NODE_VERSION_IN_DOCKERFILE}--${RUBY_VERSION_IN_DOCKERFILE}"
COMBINED="${COMBINED/ /}"
readonly COMBINED

COMBINED_IN_CI=$(grep -oE 'image-tag:\s+([0-9]+\.[0-9]+\.[0-9]+--[0-9]+\.[0-9]+\.[0-9]+)' .github/workflows/ci.yml | cut -d':' -f2 )
COMBINED_IN_CI="${COMBINED_IN_CI/ /}"
readonly COMBINED_IN_CI

if [ "$COMBINED_IN_CI" = "$COMBINED" ]; then
    echo "Everything in sync"
else
    echo "The versions are **NOT** in sync!"
    echo "$COMBINED_IN_CI != $COMBINED"
    exit 1
fi
