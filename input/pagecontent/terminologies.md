本頁彙整本 IG 使用的所有專門術語（terminology），包含引用的標準代碼系統，以及本 IG 定義的代碼系統（CodeSystems）與值集（ValueSets）。

### 標準代碼系統

若有精確對應的標準代碼，請優先使用。本 IG 引用的標準代碼系統如下：

| 代碼系統 | 用途 |
|---|---|
| LOINC（`http://loinc.org`） | NIHSS 總分與 15 個分項、mRS 分數、GCS 總分與睜眼／語言／動作三項。身高、體重、體溫、心率、呼吸速率與血壓沿用 TW Core 生命徵象 Profile 的 LOINC 代碼；職業與吸菸狀態的 Observation.code 也沿用 TW Core 的 LOINC 代碼。 |
| SNOMED CT（`http://snomed.info/sct`） | 醫療處置若有精確對應，在本 IG 處置代碼外另附 SNOMED CT coding。吸菸狀態結果填入目前吸菸或已戒菸的 SNOMED CT 代碼。 |
| ICD-10-CM（`http://hl7.org/fhir/sid/icd-10-cm`） | 中風診斷（StrokeCondition.code）。院方若採用臺灣版 ICD-10-CM，可同時填入 TW Core 對應的 Slice（icd10-cm-2023）。 |
| UCUM（`http://unitsofmeasure.org`） | 數值結果的單位。 |
{: .grid .rwd-table}

若無精確對應的標準代碼，請使用本 IG 的本地代碼系統。檢驗項目目前使用本地代碼；院方確認檢體、單位與方法後，再加入 LOINC。

### 本地代碼系統

本 IG 用於資料項目（code）與 Extension 的本地代碼系統如下，每個代碼皆提供中文顯示名稱與定義。

| 代碼系統 | 值集 | 說明 |
|---|---|---|
| [觀察項目代碼](CodeSystem-stroke-observation.html) | [觀察項目值集](ValueSet-stroke-observation.html) | 供各 Observation Profile 的 code 使用。NIHSS、mRS、GCS 與生命徵象使用 LOINC，不收錄於此。 |
| [藥品與藥物類別代碼](CodeSystem-stroke-medication.html) | [藥品與藥物類別值集](ValueSet-stroke-medication.html)<br>[NOAC 藥品值集](ValueSet-noac.html)<br>[抗凝血藥物類別值集](ValueSet-anticoagulant-detail.html) | 用藥紀錄與給藥紀錄的藥品、藥物類別與治療方式。NOAC 藥品值集列出住院前或離院時可記錄的 NOAC 品項；抗凝血藥物類別值集列出 EVT 後 24 小時內可記錄的抗凝血藥類別。 |
| [醫療處置代碼](CodeSystem-stroke-procedure.html) | [醫療處置值集](ValueSet-stroke-procedure.html) | 醫療處置（StrokeProcedure）的處置代碼，包括 EVT 主處置與子術式、腦部手術及住院期間處置。 |
| [評估時點代碼](CodeSystem-assessment-phase.html) | [評估時點值集](ValueSet-assessment-phase.html) | 評估時點 Extension 的值：入院、出院、施針前、治療後 24 小時、中風前、3 個月追蹤或尚未分類。 |
| [用藥紀錄時窗代碼](CodeSystem-medication-recording-context.html) | [用藥紀錄時窗值集](ValueSet-medication-recording-context.html) | 用藥紀錄時窗 Extension 的值：住院前、住院中、離院時或 EVT 後 24 小時內。 |
{: .grid .rwd-table}

#### 觀察項目值集

各 Observation Profile 的 code 均綁定專屬的項目值集，代碼皆來自觀察項目代碼。

| 值集 | 說明 |
|---|---|
| [就醫背景項目值集](ValueSet-stroke-admission-context-code.html) | 就醫背景（StrokeAdmissionContext）的項目代碼。 |
| [發病時間項目值集](ValueSet-stroke-onset-time-code.html) | 發病時間（StrokeOnsetTime）的項目代碼。 |
| [危險因子與病史項目值集](ValueSet-stroke-risk-factor-code.html) | 危險因子與病史（StrokeRiskFactor）的項目代碼。 |
| [中風分類評估項目值集](ValueSet-stroke-clinical-assessment-code.html) | 中風分類評估（StrokeClinicalAssessment）的項目代碼。 |
| [照護流程紀錄項目值集](ValueSet-stroke-care-process-code.html) | 照護流程紀錄（StrokeCareProcess）的項目代碼。 |
| [住院併發症與惡化項目值集](ValueSet-stroke-complication-code.html) | 住院併發症與惡化（StrokeComplication）的項目代碼。 |
| [檢驗結果項目值集](ValueSet-stroke-laboratory-code.html) | 檢驗結果（StrokeLaboratory）的項目代碼。 |
| [離院與追蹤結果項目值集](ValueSet-stroke-outcome-code.html) | 離院與追蹤結果（StrokeOutcome）的項目代碼。 |
| [EVT 處置細節項目值集](ValueSet-stroke-evt-procedure-detail-code.html) | EVT 處置細節（StrokeEvtProcedureDetail）的項目代碼。 |
| [處置時點結果項目值集](ValueSet-stroke-procedure-result-code.html) | 處置時點結果（StrokeProcedureResult）的項目代碼。 |
| [EVT 術後結果項目值集](ValueSet-stroke-evt-outcome-code.html) | EVT 術後結果（StrokeEvtOutcome）的項目代碼。 |
| [影像判讀結果項目值集](ValueSet-stroke-imaging-result-code.html) | 影像判讀結果（StrokeImagingResult）的項目代碼。 |
{: .grid .rwd-table}

### 答案代碼

本 IG 用於記錄結果或分類（例如 Observation.valueCodeableConcept）的本地代碼系統如下。多數代碼沿用來源原碼（例如 `1`、`2`、`LEV05`、`EDU00`），以利轉換；取栓救援策略代碼改用語意化代碼，原碼對照已列於各代碼定義中。

| 代碼系統 | 值集 | 說明 |
|---|---|---|
| [就醫來源代碼](CodeSystem-admission-source.html) | [就醫來源值集](ValueSet-admission-source.html) | 本次就醫或住院的來源類別，用於就醫背景。數字代碼與英文代碼兩組分類方式不同，不互相轉換。 |
| [到院方式代碼](CodeSystem-arrival-mode.html) | [到院方式值集](ValueSet-arrival-mode.html) | 病人抵達醫院的方式，用於就醫背景。 |
| [教育程度代碼](CodeSystem-education-level.html) | [教育程度值集](ValueSet-education-level.html) | 病人的最高教育程度，用於就醫背景。 |
| [職業類別代碼](CodeSystem-occupation-category.html) | [職業類別值集](ValueSet-occupation-category.html) | 病人的職業類別，用於職業（StrokeOccupation）。 |
| [吸菸狀態細分代碼](CodeSystem-smoking-status-detail.html) | [吸菸狀態細分值集](ValueSet-smoking-status-detail.html) | 吸菸狀態的原始分組，與 SNOMED CT 代碼並列於吸菸狀態（StrokeSmokingStatus）。 |
| [TOAST 分類代碼](CodeSystem-toast-classification.html) | [TOAST 分類值集](ValueSet-toast-classification.html) | 缺血性中風的 TOAST 病因分類，用於中風分類評估。 |
| [未施打 IV-tPA 原因代碼](CodeSystem-ivtpa-not-given-reason.html) | [未施打 IV-tPA 原因值集](ValueSet-ivtpa-not-given-reason.html) | 未施打靜脈血栓溶解劑的主要原因，用於照護流程紀錄。 |
| [EVT 前 IV-tPA 施打院所代碼](CodeSystem-pre-evt-ivtpa-site.html) | [EVT 前 IV-tPA 施打院所值集](ValueSet-pre-evt-ivtpa-site.html) | EVT 前是否施打 IV-tPA 及施打院所，用於登錄表單回覆（StrokeRegistryResponse）。 |
| [主動脈弓分型代碼](CodeSystem-aortic-arch-type.html) | [主動脈弓分型值集](ValueSet-aortic-arch-type.html) | 主動脈弓分型（第 I 至 III 型），用於 EVT 處置細節。 |
| [血管狹窄程度分組代碼](CodeSystem-stenosis-grade.html) | [血管狹窄程度分組值集](ValueSet-stenosis-grade.html) | 總頸動脈、內頸動脈與椎動脈的狹窄程度分組，用於 EVT 處置細節。 |
| [穿刺部位代碼](CodeSystem-puncture-site.html) | [穿刺部位值集](ValueSet-puncture-site.html) | EVT 動脈穿刺部位，用於醫療處置的 bodySite。 |
| [抽吸取栓策略代碼](CodeSystem-aspiration-strategy.html) | [抽吸取栓策略值集](ValueSet-aspiration-strategy.html) | 抽吸取栓採用的策略，用於 EVT 處置細節。 |
| [取栓救援策略代碼](CodeSystem-rescue-strategy.html) | [抽吸失敗後救援策略值集](ValueSet-aspiration-rescue.html)<br>[支架取栓後救援策略值集](ValueSet-stent-retriever-rescue.html) | 第一線取栓未成功後採用的救援治療，用於 EVT 處置細節。抽吸失敗後與支架取栓後各用一個值集。 |
| [TICI 再灌流分級代碼](CodeSystem-tici-grade.html) | [TICI 再灌流分級值集](ValueSet-tici-grade.html) | EVT 結束時的再灌流程度，用於 EVT 術後結果。 |
| [EVT 後血壓控制目標代碼](CodeSystem-post-evt-bp-target.html) | [EVT 後血壓控制目標值集](ValueSet-post-evt-bp-target.html) | EVT 後血壓控制目標的上限分組，用於 EVT 術後結果。 |
| [顱內出血症狀分類代碼](CodeSystem-ich-symptom.html) | [顱內出血症狀分類值集](ValueSet-ich-symptom.html) | 追蹤影像發現顱內出血時的症狀分類，用於 EVT 術後結果。 |
| [影像分析掃描類型代碼](CodeSystem-rapid-scan-type.html) | [影像分析掃描類型值集](ValueSet-rapid-scan-type.html) | 自動化影像分析所用的掃描類型，用於影像檢查與影像檢查醫令。 |
| [影響側代碼](CodeSystem-affected-side.html) | [影響側值集](ValueSet-affected-side.html) | 影像判讀的病灶所在腦側，用於影像判讀結果。 |
| [mCTA 側枝循環分組代碼](CodeSystem-mcta-collateral.html) | [mCTA 側枝循環分組值集](ValueSet-mcta-collateral.html) | 多期 CTA 側枝循環評分的分組，用於影像判讀結果。 |
| [離院情形代碼](CodeSystem-discharge-status.html) | [離院情形值集](ValueSet-discharge-status.html) | 本次住院的離院情形，用於就醫事件的 hospitalization.dischargeDisposition。 |
| [死亡原因類別代碼](CodeSystem-death-cause.html) | [死亡原因類別值集](ValueSet-death-cause.html) | 離院死亡與追蹤期間死亡的原因類別，用於離院與追蹤結果。 |
| [離院去向代碼](CodeSystem-discharge-destination.html) | [離院去向值集](ValueSet-discharge-destination.html) | 病人離院後的去向，用於離院與追蹤結果。 |
| [3 個月追蹤所在處所代碼](CodeSystem-three-month-residence.html) | [3 個月追蹤所在處所值集](ValueSet-three-month-residence.html) | 中風後 3 個月追蹤時病人所在的處所，用於離院與追蹤結果。 |
| [追蹤期間醫療狀態代碼](CodeSystem-follow-up-care-status.html) | [追蹤期間醫療狀態值集](ValueSet-follow-up-care-status.html) | 追蹤期間病人的醫療狀態，用於離院與追蹤結果。 |
{: .grid .rwd-table}

#### 合併答案值集

當同一個 Observation Profile 使用多組答案代碼時，valueCodeableConcept 會綁定合併值集。各項目應填哪組代碼，請見各值集說明。

| 值集 | 說明 |
|---|---|
| [就醫背景答案值集](ValueSet-stroke-admission-context-answer.html) | 合併就醫來源、到院方式與教育程度代碼，綁定於就醫背景（StrokeAdmissionContext）。 |
| [中風分類評估答案值集](ValueSet-stroke-clinical-assessment-answer.html) | 包含 TOAST 分類代碼，綁定於中風分類評估（StrokeClinicalAssessment）。 |
| [照護流程紀錄答案值集](ValueSet-stroke-care-process-answer.html) | 包含未施打 IV-tPA 原因代碼，綁定於照護流程紀錄（StrokeCareProcess）。 |
| [離院與追蹤結果答案值集](ValueSet-stroke-outcome-answer.html) | 合併死亡原因類別、離院去向、3 個月追蹤所在處所與追蹤期間醫療狀態代碼，綁定於離院與追蹤結果（StrokeOutcome）。 |
| [EVT 處置細節答案值集](ValueSet-stroke-evt-procedure-detail-answer.html) | 合併主動脈弓分型、血管狹窄程度、抽吸取栓策略與取栓救援策略代碼，綁定於 EVT 處置細節（StrokeEvtProcedureDetail）。 |
| [EVT 術後結果答案值集](ValueSet-stroke-evt-outcome-answer.html) | 合併 TICI 再灌流分級、EVT 後血壓控制目標與顱內出血症狀分類代碼，綁定於 EVT 術後結果（StrokeEvtOutcome）。 |
| [影像判讀結果答案值集](ValueSet-stroke-imaging-result-answer.html) | 合併影響側與 mCTA 側枝循環分組代碼，綁定於影像判讀結果（StrokeImagingResult）。 |
{: .grid .rwd-table}
