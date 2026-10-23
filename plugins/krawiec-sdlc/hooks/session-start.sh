#!/usr/bin/env bash
# SessionStart: injects the rules from the sdlc-standards skill into the session context.
# Output: hook JSON for Claude Code and GitHub Copilot CLI.
root="${1:-${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}}"
skill="$root/skills/sdlc-standards/SKILL.md"

json_escape() {
  tr -d '\r' | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/\t/\\t/g' | awk '{ printf "%s\\n", $0 }'
}

# Skill body without YAML frontmatter.
context=$( {
  echo "Plugin krawiec-sdlc: zasady obowiązujące w tej sesji (skill sdlc-standards, katalog: $root/skills/sdlc-standards)."
  echo
  awk 'n >= 2 { print; next } /^---[[:space:]]*$/ { n++ }' "$skill"
} | json_escape )

# Claude Code reads hookSpecificOutput.additionalContext, GitHub Copilot CLI the top-level additionalContext.
printf '{"additionalContext":"%s","hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}' "$context" "$context"
