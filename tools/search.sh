#!/bin/bash
# Wiki search tool
# Usage: ./tools/search.sh "query"
# Options: pass any rg flags before the query, e.g. --type md, -l (files only)
#
# Examples:
#   ./tools/search.sh "agent loop"
#   ./tools/search.sh -l "cspec"          # list matching files only
#   ./tools/search.sh -C 5 "contradiction" # more context lines

WIKI_DIR="$(dirname "$0")/../wiki"

if [ $# -eq 0 ]; then
  echo "Usage: $0 [rg-flags] <query>"
  echo "Searches wiki/ directory with 3 lines of context."
  exit 1
fi

rg --ignore-case --context 3 --heading --line-number "$@" "$WIKI_DIR"
