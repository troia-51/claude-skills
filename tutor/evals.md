# Evals — Tutor
> Pass/fail checks for quiz tutor quality.

## Quiz Quality
- [ ] Each quiz has exactly 4 questions, each with 4 options
- [ ] No hints appear in option labels or descriptions (zero hint policy)
- [ ] Correct answer positions are randomized (not always A or B)
- [ ] Questions test concept understanding, not rote memorization of exact phrasing

## Concept Tracking
- [ ] New concepts are added to the correct `concepts/{area}.md` file
- [ ] Existing concepts update attempts/correct counts accurately
- [ ] Status changes correctly: wrong -> 🔴, correct from 🔴 -> 🟢
- [ ] Error notes capture the specific confusion, not generic "review this topic"

## Dashboard Accuracy
- [ ] Proficiency badges match actual percentages (🟥 0-39%, 🟨 40-69%, 🟩 70-89%, 🟦 90-100%)
- [ ] Stats (total questions, cumulative rate, weakest/strongest) are recalculated from concept files
- [ ] Dashboard stays compact -- no per-question details, no session logs

## Session Flow
- [ ] Asks user what to do via AskUserQuestion (diagnostic / drill / choose section)
- [ ] Options are context-aware (unmeasured areas suggest diagnostic, weak areas suggest drill)
- [ ] After grading, updates BOTH concept file AND dashboard
- [ ] Communicates in user's detected language

---
Score: X/Y passed
