---
name: loop-desing
description: Design a Loop Engineering Loop Spec (迴圈規格 / 任務單) and optional /goal one-liner. Use when the user gives Claude Code a task, asks to write or design a Loop Spec, 迴圈規格, 任務單, or /goal command, or to turn a brief into a verified loop with goal, context, rules, steps, verification, acceptance, and delivery. Do not use for casual questions. If a complete # Loop Spec is already provided for execution, do not take over; only fill missing sections first.
license: MIT
---

# loop-desing

Turn a task into a Loop Engineering Loop Spec (迴圈規格 / 任務單). The human designs the loop; AI executes it. You write the spec; you do not execute it unless the user also asked you to run it.

This skill is the Claude Code form of [loop-desing](https://github.com/chou-lei/loop-desing) (visual designer: https://chou-lei.github.io/loop-desing/). Use this template, not an invented format. The current designer URL is the only one to use; the previous product name is retired.

## When not to take over
- Casual questions, chitchat, or explanations that are not a task to hand to Claude Code: do not load this workflow.
- A complete `# Loop Spec` already provided for execution: do not rewrite it. Follow the injected loop protocol and execute it. If required sections are missing, fill them first with this skill, show the completed spec, then continue only if the user asked you to run it.

## Output
Default: a full Loop Spec in the user's language (Traditional Chinese if they wrote in Chinese; English otherwise). Also offer the `/goal` one-liner when they ask for a short command, or when a one-line form is clearly enough.
- Full template: `references/template.md` (Chinese) or `references/template-en.md` (English).
- One-liner: `references/goal-command.md`.
- Starting points: `references/presets.md` (bugfix, feature, refactor, UI, research).

The report section of the spec must include the Evidence line. The website does not yet add it; this skill does, because the Stop hook `evidence-gate.py` blocks Loop Spec replies that omit it.

## Workflow
1. **Read the brief.** Reuse what the user already gave. Do not invent project facts.
2. **Ask before guessing.** Goal is required. If the goal, the allowed scope, or a done condition is unclear, ask. If a verify command is unknown, leave a placeholder and say the executor must propose a machine-checkable command and wait for confirmation before starting.
3. **Fill the four pillars**, using the defaults below unless the user overrides them.
4. **Show the spec** (and the `/goal` line if useful). List any placeholders the user still needs to confirm. Do not start executing unless they asked.

## Defaults (same as the loop-desing designer)
- **House rules** (include all four, verbatim):
  - 先講清楚假設：不確定先問，不要自己猜
  - 不要過度工程化：能簡單解決就不要加戲(除非必要結構)
  - 不碰無關範圍：修Bug就修Bug，不要順手重構全世界
  - 做完必須驗證：跑測試、看結果確認真的可以用
- Max turns: 20. Progress file: `PROGRESS.md`.
- Failure policy (fixed): if the same check fails twice in a row, change approach; if it still fails, stop and report why, with evidence.
- Each step is gather → act → verify; advance only when that step's check passes. Prefer 2–5 steps, each with a check written after an em dash (`— 檢查:` / `— check:`).
- Checker: a read-only subagent that re-runs every done condition and reports PASS/FAIL with evidence; any FAIL returns to the loop.
- Delivery: commit on a local branch; do not push or deploy (unless the user asked for a PR, files only, or a report).
- Approvals required before: deploy / push to main; delete files, data, or branches; spend money or paid APIs; send email, messages, or posts; install new packages or tools.
- Autonomy: inside the spec, the executor decides how to do the work and does not ask at every step.
- Stop and ask when an assumption is unclear, requirements conflict, scope must grow or a "must not change" item would be touched, the failure policy is exhausted, or the next step needs approval.

## Required sections
1. **規則與上下文** — goal (one sentence), house rules, project rules / must not change, context (paths, errors, links; only what is needed), may-change scope.
2. **多步驗證迴圈** — numbered steps with checks, max turns, failure policy, progress file.
3. **自動化測試與交付** — done conditions (verify command exits 0, plus any other checks), independent checker, delivery, report format with the Evidence line:
   `Evidence: <path under ~/research>` | `Evidence: exempt — code-only, verified by \`<cmd>\`` | `Evidence: none — BLOCKED (<reason>)`
4. **人類設計，AI 執行** — approval list, autonomy, when to stop and ask.

Optional: a cross-verify evidence file path under `~/research/` in Context, when the task is an install or architecture choice.

## Rules
- Do not over-engineer the spec. Keep it as short as the task allows.
- Do not expand scope. Touch only what the user said may change.
- Escape a leading `#` only in user-supplied field values as `\#` so they are not parsed as Markdown headings. Never escape the `# Loop Spec` title or the `##` section headings.
- Never put passwords, tokens, or seed-private material in the spec.
