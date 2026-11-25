<!-- Loop Spec template (Loop Engineering, from https://chou-lei.github.io/loop-desing/).
     Replace every {…}. Delete optional lines that do not apply. -->
# LOOP SPEC

## 1. RULES & CONTEXT

**Goal**
{One sentence: the result you want}

**Rules**
- State assumptions first: ask when unsure, don’t guess
- Don’t over-engineer: keep simple fixes simple (unless structure is needed)
- Stay in scope: fixing a bug means fixing the bug, not refactoring the world
- Verify when done: run the tests and check the result really works

**Project rules / must not change**
- {For example: public API, data format, other pages, existing tests may not be deleted or loosened}

**Context**
{Relevant paths, map, background, errors, links — only what is needed}
Evidence file (optional; recommended for install or architecture tasks): {~/research/…, via the cross-verify skill}

**May change**
{Directories or files}

## 2. MULTI-STEP VERIFICATION LOOP

**Steps** (each: gather → act → verify; move on only when that step's check passes)
1. {step} — check: {a command or a clear observation}
2. {step} — check: {…}
3. {step} — check: {…}

**Loop**
- At most {20} turns; stop as soon as every check passes and do no extra work.
- If the same check fails twice in a row, change approach; if it still fails, stop and report why, with evidence.
- Keep progress in `{PROGRESS.md}` (done, current state, next step, open questions); update after every step and read it first after an interruption or compaction.

## 3. AUTOMATED TESTING & DELIVERY

**Done when** (all must pass)
- `{npm test && npm run build}` exits with code 0
- {other machine-checkable conditions}

**Independent check**
When your own checks pass, do not declare done. Start a separate read-only subagent that re-runs every done condition and reports PASS/FAIL with evidence; any FAIL sends you back into the loop.
Evidence gate: the deliverable must be cross-verified (cross-verify skill, evidence file under ~/research/); the checker states which case applies, and a missing evidence file is FAIL. The only exemption: the deliverable has no factual claim, recommendation, or third-party choice, and the verify commands prove it (code, config, or formatting only).

**Delivery**
- {Commit on a local branch; do not push or deploy | Push a new branch and open a PR; do not merge or deploy | Deliver the changed files; do not commit or push | Deliver a report only; change no files}
- Every done condition and the independent check must pass before delivery; otherwise do not deliver.

**Report format**
Report only: files changed, PASS/FAIL with evidence for each check, where the deliverable is, and remaining risks or open decisions. The last line must be exactly one of: `Evidence: <path under ~/research>`, `Evidence: exempt — code-only, verified by \`<cmd>\``, or `Evidence: none — BLOCKED (<reason>)` (the Stop hook checks this line).

## 4. HUMANS DESIGN, AI EXECUTES

**Needs my approval first**
- Deploying / going live, pushing to main
- Deleting files, data or branches
- Spending money, purchases, paid APIs
- Sending externally (email, messages, posts)
- {Other, for example: installing new packages or tools}

**AI autonomy**
Inside this spec, decide how to do the work yourself; do not ask me at every step.

**When to stop and ask me**
- An assumption is unclear, or requirements conflict
- The scope must grow, or something under "must not change" would be touched
- The failure policy is exhausted and checks still fail
- The next step is on the "needs my approval" list
