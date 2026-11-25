# Starting presets

Use these as starting points. Replace the placeholders. Defaults not listed here still apply (house rules, 20 turns, `PROGRESS.md`, subagent checker, local commit unless noted, the five approval items).

## Bugfix / 修問題

- Goal: 修好以下 Bug：（描述現象與重現步驟） / Fix this bug: (symptom and steps to reproduce)
- Must not change: 不做與 Bug 無關的重構或格式調整；既有測試不可刪除或放寬
- Scope: 與這個 Bug 直接相關的檔案
- Steps:
  1. 寫一個重現 Bug 的測試 — 檢查: 測試先失敗
  2. 找出原因並修正 — 檢查: 新測試通過
  3. 回歸檢查 — 檢查: 既有測試全部通過
- Verify: `npm test` exits 0

## Feature / 新功能

- Goal: 新增功能：（一句話描述使用者能做到什麼）
- Must not change: 既有功能的行為不變；公開 API 不變
- Steps:
  1. 先寫出這個功能的測試 — 檢查: 測試先失敗
  2. 實作功能 — 檢查: 新測試通過
  3. 整合與建置 — 檢查: 測試與建置全部通過
- Verify: `npm test && npm run build` exits 0

## Refactor / 整理程式

- Goal: 重構：（要改善的模組與原因），外部行為完全不變
- Must not change: 任何對外行為與輸出不變；既有測試的斷言不可修改（只能新增）
- Steps:
  1. 記錄重構前的測試結果 — 檢查: 測試全部通過
  2. 小步重構 — 檢查: 每一步後測試仍全部通過
  3. 清理 — 檢查: lint 與型別檢查無錯誤
- Verify: `npm test && npm run lint` exits 0

## UI / 改網站外觀

- Goal: 改版：（頁面名稱）的介面與操作體驗
- Must not change: 資料格式與儲存方式不變；其他頁面不動；網址結構不變
- Steps:
  1. 截下改版前的桌面與手機畫面 — 檢查: 截圖已存檔
  2. 改版介面 — 檢查: 建置成功
  3. 檢查版面 — 檢查: 390px 與 1440px 沒有水平捲軸、主控台沒有錯誤
- Verify: `npm run build && npm test` exits 0
- Extra done condition: 改版前後截圖已存檔供比對

## Research / 查資料

- Goal: 研究並整理：（主題），產出有來源的結論
- Must not change: 不捏造數據或來源
- Scope: 只產出報告檔，不修改其他檔案
- Delivery: report only
- Steps:
  1. 列出要回答的問題 — 檢查: 問題清單經我確認
  2. 蒐集資料 — 檢查: 每個重點都有可開啟的來源
  3. 寫結論 — 檢查: 結論回答了每個問題
- Done when: 區分已查證事實與推論
- For research or recommendation tasks, the executor should also run the cross-verify skill and attach an evidence file under `~/research/`.
