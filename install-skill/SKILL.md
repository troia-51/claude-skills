---
name: install-skill
description: Install Claude Code skills from GitHub repos with proper symlink setup and fork/upstream remote configuration. Use when the user wants to install a skill from a GitHub URL, set up a skill repo for easy updates, or configure fork+upstream remotes for a skill repository.
---

# Install Skill

Automates the installation of Claude Code skills from GitHub repositories.

**Workflow:** Clone → Configure remotes → Symlink skills → Verify

## When to Use

Use this skill when the user:
- Provides a GitHub URL and wants to install it as a skill
- Says "install this skill" with a repo link
- Wants to set up a skill repo with fork+upstream for easy updates
- Asks to configure a skill repository for automatic updates

## Installation Steps

### Step 1: Parse the GitHub URL

Extract the repo info from the URL:
- `https://github.com/owner/repo` → `owner/repo`
- Identify if user has a fork (ask or check if they mention it)

### Step 2: Clone to skills-repos

```bash
cd ~/.claude/skills-repos
git clone https://github.com/owner/repo.git
```

If directory already exists, skip clone and pull latest:
```bash
cd ~/.claude/skills-repos/repo
git pull origin main
```

### Step 3: Configure Remotes

**If user provides their fork URL:**
```bash
cd ~/.claude/skills-repos/repo
git remote set-url origin https://github.com/user-fork/repo.git
git remote add upstream https://github.com/original-owner/repo.git
```

**If no fork specified (use original as origin):**
```bash
cd ~/.claude/skills-repos/repo
git remote add upstream https://github.com/original-owner/repo.git
```

### Step 4: Discover and Symlink Skills

Find all skill directories (containing SKILL.md):
```bash
find ~/.claude/skills-repos/repo/skills -name "SKILL.md" -type f
```

For each skill found, create symlink:
```bash
ln -sf ~/.claude/skills-repos/repo/skills/skill-name ~/.claude/skills/skill-name
```

If no `skills/` directory, check if root has SKILL.md (single-skill repo):
```bash
ln -sf ~/.claude/skills-repos/repo ~/.claude/skills/repo-name
```

### Step 5: Verify Installation

```bash
# Check symlinks
ls -la ~/.claude/skills/ | grep skill-name

# Check remotes
cd ~/.claude/skills-repos/repo && git remote -v
```

### Step 6: Report Results

Output summary:
- Skills installed (names)
- Remote configuration (origin/upstream)
- Update command for user

## Update Command Template

After installation, provide the update command:
```bash
cd ~/.claude/skills-repos/repo && git pull upstream main
```

## Error Handling

- **Clone fails:** Check URL validity, network, and permissions
- **Symlink exists:** Use `-sf` flag to force overwrite
- **No SKILL.md found:** Search for `*.md` files with skill frontmatter
- **Multiple skills in one repo:** Symlink each separately

## Good Output Examples

### Example 1: Successful GitHub Install (Multi-Skill Repo)

User: `install this skill: https://github.com/multica-ai/andrej-karpathy-skills`

**Terminal output:**

```
$ cd ~/.claude/skills-repos && git clone https://github.com/multica-ai/andrej-karpathy-skills.git
Cloning into 'andrej-karpathy-skills'...
remote: Enumerating objects: 142, done.
remote: Counting objects: 100% (142/142), done.
remote: Compressing objects: 100% (89/89), done.
remote: Total 142 (delta 45), reused 120 (delta 38), pack-reused 0
Receiving objects: 100% (142/142), 38.42 KiB | 1.28 MiB/s, done.
Resolving deltas: 100% (45/45), done.

$ cd ~/.claude/skills-repos/andrej-karpathy-skills && git remote add upstream https://github.com/multica-ai/andrej-karpathy-skills.git

$ find ~/.claude/skills-repos/andrej-karpathy-skills/skills -name "SKILL.md" -type f
~/.claude/skills-repos/andrej-karpathy-skills/skills/karpathy-guidelines/SKILL.md
~/.claude/skills-repos/andrej-karpathy-skills/skills/karpathy-code-review/SKILL.md

$ ln -sf ~/.claude/skills-repos/andrej-karpathy-skills/skills/karpathy-guidelines ~/.claude/skills/karpathy-guidelines
$ ln -sf ~/.claude/skills-repos/andrej-karpathy-skills/skills/karpathy-code-review ~/.claude/skills/karpathy-code-review

$ ls -la ~/.claude/skills/ | grep karpathy
lrwxr-xr-x  1 troia  staff  72 Jun  7 09:30 karpathy-code-review -> /Users/troia/.claude/skills-repos/andrej-karpathy-skills/skills/karpathy-code-review
lrwxr-xr-x  1 troia  staff  72 Jun  7 09:30 karpathy-guidelines -> /Users/troia/.claude/skills-repos/andrej-karpathy-skills/skills/karpathy-guidelines

$ cd ~/.claude/skills-repos/andrej-karpathy-skills && git remote -v
origin	https://github.com/multica-ai/andrej-karpathy-skills.git (fetch)
origin	https://github.com/multica-ai/andrej-karpathy-skills.git (push)
upstream	https://github.com/multica-ai/andrej-karpathy-skills.git (fetch)
upstream	https://github.com/multica-ai/andrej-karpathy-skills.git (push)
```

**Summary report:**

```
Skills installed:
  - karpathy-guidelines (behavioral guidelines for LLM coding)
  - karpathy-code-review (code review checklist)

Remote configuration:
  - origin: https://github.com/multica-ai/andrej-karpathy-skills.git
  - upstream: https://github.com/multica-ai/andrej-karpathy-skills.git

To update later:
  cd ~/.claude/skills-repos/andrej-karpathy-skills && git pull upstream main
```

### Example 2: Install from User's Fork

User: `install this skill, here's my fork: https://github.com/troia-51/claude-skills — original is multica-ai/claude-skills`

**Terminal output:**

```
$ cd ~/.claude/skills-repos && git clone https://github.com/multica-ai/claude-skills.git
Cloning into 'claude-skills'...
remote: Enumerating objects: 210, done.
Receiving objects: 100% (210/210), 52.18 KiB | 2.61 MiB/s, done.
Resolving deltas: 100% (98/98), done.

$ cd ~/.claude/skills-repos/claude-skills
$ git remote set-url origin https://github.com/troia-51/claude-skills.git
$ git remote add upstream https://github.com/multica-ai/claude-skills.git

$ find ~/.claude/skills-repos/claude-skills/skills -name "SKILL.md" -type f
~/.claude/skills-repos/claude-skills/skills/data-pipeline/SKILL.md
~/.claude/skills-repos/claude-skills/skills/schema-gen/SKILL.md
~/.claude/skills-repos/claude-skills/skills/migration-runner/SKILL.md

$ ln -sf ~/.claude/skills-repos/claude-skills/skills/data-pipeline ~/.claude/skills/data-pipeline
$ ln -sf ~/.claude/skills-repos/claude-skills/skills/schema-gen ~/.claude/skills/schema-gen
$ ln -sf ~/.claude/skills-repos/claude-skills/skills/migration-runner ~/.claude/skills/migration-runner

$ git remote -v
origin	https://github.com/troia-51/claude-skills.git (fetch)
origin	https://github.com/troia-51/claude-skills.git (push)
upstream	https://github.com/multica-ai/claude-skills.git (fetch)
upstream	https://github.com/multica-ai/claude-skills.git (push)
```

**Summary report:**

```
Skills installed:
  - data-pipeline
  - schema-gen
  - migration-runner

Remote configuration:
  - origin: https://github.com/troia-51/claude-skills.git (your fork)
  - upstream: https://github.com/multica-ai/claude-skills.git (original)

To get updates from original:
  cd ~/.claude/skills-repos/claude-skills && git pull upstream main

To push your changes to fork:
  cd ~/.claude/skills-repos/claude-skills && git push origin main
```

### Example 3: Error Case (Invalid URL)

User: `install this skill: https://github.com/not-a-real-user/nope-skills-404`

**Terminal output:**

```
$ cd ~/.claude/skills-repos && git clone https://github.com/not-a-real-user/nope-skills-404.git
Cloning into 'nope-skills-404'...
remote: Repository not found.
fatal: repository 'https://github.com/not-a-real-user/nope-skills-404.git/' not found
```

**Error report:**

```
Installation failed: repository not found.

Possible causes:
  - The URL may be incorrect (typo in owner or repo name)
  - The repository may be private — check if you have access
  - The repository may have been deleted

Please verify:
  1. Open https://github.com/not-a-real-user/nope-skills-404 in your browser
  2. If it's a private repo, make sure your SSH key or token is configured:
     gh auth status
  3. Double-check the URL and try again
```
