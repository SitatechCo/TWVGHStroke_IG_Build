本頁說明腦中風資料庫三個資料來源的邏輯模型（Logical Model）。邏輯模型依各來源譯碼簿與實際檔案整理，保留原始欄位結構與值域，作為後續設計 FHIR Profile 與資料轉換的依據。

### 資料來源

| 邏輯模型 | 資料來源 | 一筆資料代表 | 識別欄位 | 欄位數 |
|---|---|---|---|---|
| [腦中風個管系統資料邏輯模型](StructureDefinition-StrokeCaseManagementLM.html) | 個管系統（NCVA）14 個資料表 | 一個個管事件 | 病歷號＋個管流水序號 | 189 |
| [急性缺血性腦中風 EVT 登錄資料邏輯模型](StructureDefinition-StrokeEvtRegistryLM.html) | EVT 登錄表 | 一位 EVT 個案 | EVT 登錄個案識別碼 | 326 |
| [RAPID 影像分析資料邏輯模型](StructureDefinition-StrokeRapidLM.html) | RAPID 影像分析（NCVA.RAPID） | 一次影像掃描 | 病歷號＋申請序號＋掃描類型＋醫院代號 | 18 |
{: .grid .rwd-table}

各邏輯模型的「Mappings」頁籤列出每個元素對應的原始欄位名稱，以及在本 IG 對應的 FHIR 路徑。

### 建模原則

- 元素名稱由原始欄位名稱轉為 lowerCamelCase，例如 `IVTPASUB01` 轉為 `ivtpasub01`、`Risk_ht_current` 轉為 `riskHtCurrent`。
- 個管系統的病歷號與個管流水序號放在模型根層；14 個資料表各自成為一個區塊。NIHSS 與 mRS 每次評估一筆，其餘資料表每個個管事件一筆。
- EVT 登錄表依譯碼簿分組整理成區塊，每位個案一筆。
- 代碼欄位的值域寫在元素定義中，暫不綁定 ValueSet。
- 來源未強制必填；除識別欄位外，元素基數皆為 0..1。

### 跨來源串接

三個來源沒有共同的就醫鍵：

- 個管系統以病歷號＋個管流水序號識別個管事件。
- EVT 登錄表只有 EVT 登錄個案識別碼，無法直接對應病歷號或個管流水序號。
- RAPID 以病歷號＋申請序號＋掃描類型＋醫院代號識別一次掃描。
