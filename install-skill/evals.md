# Evals — Install Skill
> Pass/fail checks for output quality. 每次安裝 skill 之後用呢個 checklist 驗收。

## URL Parsing
- [ ] GitHub URL 正確解析出 owner/repo
- [ ] Fork URL 同 original URL 正確區分
- [ ] 非 GitHub URL 有 error message

## Clone & Directory
- [ ] Repo clone 到 `~/.claude/skills-repos/repo-name`
- [ ] 已存在嘅 repo 走 pull 而唔係 re-clone
- [ ] Clone 失敗時有明確 error（URL / network / permissions）

## Remote Configuration
- [ ] 有 fork 時：origin → user's fork，upstream → original
- [ ] 冇 fork 時：origin → original，upstream → original
- [ ] `git remote -v` 驗證結果正確

## Symlink
- [ ] 所有 `SKILL.md` 嘅 skill directories 都被 symlink
- [ ] Symlink 用 `-sf` flag（force overwrite existing）
- [ ] Single-skill repo（root 有 SKILL.md）正確處理
- [ ] `ls -la ~/.claude/skills/` 驗證 symlink 存在

## Reporting
- [ ] Output 包含：skills installed names, remote config, update command
- [ ] Update command 正確（`git pull upstream main`）
- [ ] Error 報告清楚指出失敗原因

---
Score: X/Y passed
