# loop-desing — Claude Code 迴圈規格設計技能

[繁體中文](#繁體中文) · [English](#english)

Companion skill for [loop-desing](https://github.com/chou-lei/loop-desing), the Loop Engineering spec designer (site: https://chou-lei.github.io/loop-desing/).

## 繁體中文

讓 Claude Code 在你交給它一個任務、或請它寫 Loop Spec（迴圈規格／任務單）時，自動依 Loop Engineering 的方法產出完整規格：目標、上下文、家規、步驟與檢查、驗證、驗收、交付，並附上 `Evidence:` 行。人類設計迴圈，AI 執行。

這是網站版 loop-desing 的技能形式，不是另一套格式。視覺化表單仍可使用：https://chou-lei.github.io/loop-desing/

### 會做什麼
- 把任務整理成四個支柱的 `# Loop Spec`：規則與上下文、多步驗證迴圈、自動化測試與交付、人類設計／AI 執行。
- 需要一行指令時，再產出 `/goal` 一行版。
- 提供修 Bug、新功能、重構、改版、查資料等起始範本（見 `references/presets.md`）。
- 已有一份完整的 `# Loop Spec` 要執行時，不會改寫或搶走執行權；缺漏的欄位才會先補上。

### 安裝
```bash
git clone https://github.com/chou-lei/loop-desing-skill.git
bash loop-desing-skill/install.sh
```
或手動複製：
```bash
mkdir -p ~/.claude/skills
cp -r loop-desing-skill ~/.claude/skills/loop-desing
# 也可以只複製 SKILL.md 和 references/
```
重新開啟 Claude Code 後就會出現。可以直接說「幫我把這個任務寫成 Loop Spec」，或輸入 `/loop-desing`。

### 需求
- Claude Code

### 限制
- 這個技能只負責設計規格，不會幫你執行任務（除非你同時要求它執行）。
- 規格裡的完成條件和驗證指令，仍要依你的專案調整。

## English

A Claude Code skill that, when you give it a task or ask it to write a Loop Spec, automatically drafts a full Loop Engineering brief: goal, context, rules, steps with checks, verification, acceptance, and delivery, including the `Evidence:` line. Humans design the loop; AI executes it.

This is the skill form of the [loop-desing](https://github.com/chou-lei/loop-desing) designer, not a different format. The visual form is still at https://chou-lei.github.io/loop-desing/.

### What it does
- Builds a `# Loop Spec` with the four pillars: rules and context, a multi-step verification loop, automated testing and delivery, and human design / AI execution.
- Also emits a `/goal` one-liner when a short command is enough.
- Includes starting presets for bugfix, feature, refactor, UI, and research work (`references/presets.md`).
- If a complete `# Loop Spec` is already provided for execution, it does not rewrite it or take over; it only fills missing sections.

### Install
```bash
git clone https://github.com/chou-lei/loop-desing-skill.git
bash loop-desing-skill/install.sh
```
Or copy the files yourself:
```bash
mkdir -p ~/.claude/skills
cp -r loop-desing-skill ~/.claude/skills/loop-desing
# or copy just SKILL.md and references/
```
Restart Claude Code, then ask it to design a Loop Spec, or type `/loop-desing`.

### Requirements
- Claude Code

### Limits
- This skill designs the spec; it does not execute the task unless you also ask it to run the work.
- Verify commands and done conditions still need to match your project.

## License
MIT
