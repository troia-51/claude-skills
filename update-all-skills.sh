#!/bin/bash
# Update all Claude Code skills from upstream
# Usage: bash ~/.claude/skills/update-all-skills.sh

set -e

echo "=== Updating git-based skills ==="

# Single-skill repos (direct in ~/.claude/skills/)
for dir in ~/.claude/skills/humanizer ~/.claude/skills/excalidraw-diagram ~/.claude/skills/defuddle ~/.claude/skills/slack-gif-creator ~/.claude/skills/frontend-slides; do
  if [ -d "$dir/.git" ]; then
    name=$(basename "$dir")
    echo -n "  $name... "
    cd "$dir"
    git fetch upstream 2>/dev/null && git merge upstream/main --no-edit 2>/dev/null && echo "OK" || echo "skipped (no changes or error)"
  fi
done

# Multi-skill repos (in ~/.claude/skills-repos/)
for dir in ~/.claude/skills-repos/claude-office-skills ~/.claude/skills-repos/tutor-skills; do
  if [ -d "$dir/.git" ]; then
    name=$(basename "$dir")
    echo -n "  $name (docx/pdf/xlsx/pptx or tutor)... "
    cd "$dir"
    git fetch upstream 2>/dev/null && git merge upstream/main --no-edit 2>/dev/null && echo "OK" || echo "skipped (no changes or error)"
  fi
done

echo ""
echo "Done! All skills updated from upstream."
echo ""
echo "Skills NOT managed by git (no upstream found):"
for dir in ~/.claude/skills/*/; do
  name=$(basename "$dir")
  if [ ! -d "$dir/.git" ] && [ ! -L "$dir" ]; then
    echo "  - $name"
  fi
done
