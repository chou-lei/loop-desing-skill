# /goal one-liner

The `/goal` command is Claude Code's compact form: one line that keeps working until the done conditions hold. Use it when the user asks for a short command, not as a replacement for a full Loop Spec when the task is large.

## Shape (Traditional Chinese)
```
/goal {目標}——完成條件：{`指令` 結束碼為 0}；{其他條件}；不可改動：{…}；最多 {20} 回合；以下先問我：{批准事項以 「 / 」 分隔}。
```

## Shape (English)
```
/goal {goal} — done when: {`command` exits 0}; {other conditions}; must not change: {…}; at most {20} turns; ask me before: {approvals, comma-separated}.
```

## Rules
- Needs a goal, plus at least one done condition or verify command. Without those, write the full Loop Spec instead.
- Omit `不可改動` / `must not change` and the approval clause when they are empty.
- Keep it one line. Collapse whitespace in the goal.
- The one-liner cannot carry the Evidence line or the step-by-step loop; for anything that will be a `# Loop Spec` session, prefer the full template.
