# Evals — Find Skills
> Pass/fail checks for skill discovery quality.

## Search Quality
- [ ] Identifies the user's domain and specific task before searching
- [ ] Checks skills.sh leaderboard before running CLI search
- [ ] Search keywords are specific (not generic single-word queries)
- [ ] Tries alternative terms if initial search yields no results

## Recommendation Quality
- [ ] Recommends skills with 1K+ installs; flags anything under 100
- [ ] Prefers official sources (vercel-labs, anthropics, microsoft)
- [ ] Presents skill name, description, install count, and install command
- [ ] Includes skills.sh link for each recommendation

## No-Result Handling
- [ ] Acknowledges when no skills are found (does not hallucinate results)
- [ ] Offers to help with the task directly using general capabilities
- [ ] Suggests `npx skills init` for custom skill creation

## Install Flow
- [ ] Uses `-g -y` flags for global unattended install
- [ ] Confirms installation success before reporting done
- [ ] Does not recommend unverified or low-reputation skills

---
Score: X/Y passed
