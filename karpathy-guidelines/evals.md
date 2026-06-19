# Evals — Karpathy Guidelines
> Pass/fail checks for LLM coding guideline adherence.

## Think Before Coding
- [ ] States assumptions explicitly before implementing
- [ ] Surfaces multiple interpretations when ambiguity exists, does NOT pick silently
- [ ] Pushes back when a simpler approach exists
- [ ] Stops and asks when something is genuinely unclear

## Simplicity First
- [ ] No features beyond what was asked
- [ ] No abstractions for single-use code
- [ ] No speculative "flexibility" or "configurability"
- [ ] Output could pass the "senior engineer would not call this overcomplicated" test

## Surgical Changes
- [ ] Only touches lines directly related to the user's request
- [ ] Does NOT "improve" adjacent code, comments, or formatting
- [ ] Matches existing code style even if it differs from preference
- [ ] Removes only orphaned imports/variables/functions created by own changes

## Goal-Driven Execution
- [ ] Transforms vague tasks into verifiable goals (e.g., "fix bug" -> write failing test -> make it pass)
- [ ] Multi-step tasks include a brief plan with verification checkpoints
- [ ] Loops until success criteria are met, not just until code is written

---
Score: X/Y passed
