# CLAUDE.md

## Tools & Environment

- Before drafting recurring artifacts (weekly updates, status posts, reviews), check available skills/plugins/MCP servers first — only go freehand if none fit
- Use `gh` CLI for GitHub (authenticated access)
- Use `sentry-cli` skill for Sentry issues (`*.sentry.io/issues/*`)
- Use `gh-pr` skill when creating pull requests on GitHub
- Use `betting:write-update` plugin for weekly bet updates, not freehand drafts
- Use MCP locker for Jira interactions (jira-cli has been removed)
- Use MCP locker or Glean to read Google Docs and Slack messages — try these before declining
- Use Notion MCP for Notion documents (`*.notion.so/*`)
- Detect JS/TS package manager: `pnpm-lock.yaml` → pnpm, `yarn.lock` → yarn, `package-lock.json` → npm, `deno.lock` → deno
- Prefer simple git commands without `-C` flag when already in the working directory
- Primary languages and ecosystems: TypeScript, Ruby, YAML (Helm/K8s)
- Use `jq` for JSON processing in Bash, not Python
- Use `yamllint` for YAML validation in Bash, not Python

## Style

- Canadian spelling in docs/commits, American in code
- Avoid "robust", "thorough", "comprehensive"
- Prefer evergreen language, never use "new", "improved", or "enhanced"
- Never comment out code, delete it instead
- When modifying documentation, preserve existing formatting choices (emojis, headers, styling)

## Workflow

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- Break work into phases: Phase 1: investigation → Phase 2: implementation → Phase 3: commit and PR. Summarize after each phase.
- When given a bug report: fix it autonomously — identify logs, errors, failing tests, then resolve
- Verify before acting: search docs/code/configs before speculating about external APIs, network behaviour, or CI failure causes
- For multi-PR work, produce a written stack plan (PR boundaries, scope, dependencies, rollback story) before writing code

## Scope Discipline

- Fix only what was asked — do not start broader refactors, upgrades, or cleanup mid-task
- When fixing deployed/production config (e.g., TLD migrations), do NOT also modify local dev config — confirm scope first
- Offer commands for interactive prompts (passwords, auth flows) instead of running them yourself

## Code Changes

- Code style priority: (1) Consistency with file, (2) Readability, (3) Performance, (4) Concise
- Stop and confirm before: architectural changes, multiple valid approaches, shared code/API changes, full rewrites
- Default to small, focused PRs — split large changes into stacked PRs for safe independent rollback
- Keep database migrations in separate PRs — never bundle them with code changes

## PR Reviews

- Verify every concern against the actual code: read the file (not just the diff), grep for related usages, quote specific lines
- Drop any concern you cannot verify — no speculation
- Draft inline comments in the user's voice (concise, direct, no hedging); ask before posting Request Changes

## Testing & Verification

- Never mock the functionality being tested
- Never write tests that only test mocked behaviour
- Test output must be clean (no ignored warnings/errors)
- IMPORTANT: Never mark a task complete without proving it works — show explicit proof of completion (command output, test results)

## Git

- Use semantic commits: `fix:`, `feat:`, `chore:` prefix, keep the message under 80 chars
- Use `--force-with-lease`, never `--force`
- Before amending or force-pushing, `git fetch` and check for upstream commits (bots, co-authors) — create a fresh commit instead if any landed
- When rebasing stacks, verify upstream refs carefully to avoid dropping squash-merged commits
- Never add AI as coauthor
- 1Password/GPG signing may cause transient commit failures — retry once if signing fails

### Work vs Personal Repositories

Check `git remote get-url origin`:

- **Work**: URL does NOT contain "cchawn"
- **Personal**: URL contains "cchawn"

## IMPORTANT: Forbidden Actions

- Never use `--no-verify` to bypass hooks
- Never commit directly to main/master
- Never rewrite pushed history without coordination
- Never make changes unrelated to assigned task
- Never commit secrets or credentials
- Never reply to comments in GitHub on my behalf
