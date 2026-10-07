本頁列出本 IG 定義的所有 FHIR Profiles 與 Extensions。

本 IG 的 Profiles 依資料性質分為八類：

1. **共用資料元素**：病人、就醫事件、醫療院所與醫事人員，供其他 Profile 參照。
2. **生命徵象與量表**：到院時的生命徵象，以及 GCS、NIHSS、mRS 評估。
3. **中風評估**：病人背景與病史、中風診斷與分類、住院照護與結果。
4. **EVT 處置**：動脈內血栓移除術（EVT）的處置細節、處置時點與術後結果。
5. **用藥與處置**：用藥紀錄、給藥紀錄與醫療處置。
6. **影像**：影像檢查、影像判讀結果與影像檢查醫令。
7. **表單與追溯**：登錄表單回覆、資料來源追溯與研究同意。
8. **個案資料包**：個管系統、EVT 登錄與 RAPID 影像分析各一個 Bundle，一包代表該來源一個個案的完整資料。

Profiles 以 [TW Core IG 1.0.0](https://twcore.mohw.gov.tw/ig/twcore/index.html) 的 Profile 為父層；TW Core 1.0.0 沒有對應 Profile 的 Consent 與 MedicationAdministration，則以 FHIR R4 Resource 為父層。

### Resources 之 Profiles

以下為臺灣榮總腦中風實作指引（TW VGH Stroke IG）使用的所有 Profiles。

#### 一、共用資料元素

供其他 Profile 以 Reference 參照的基礎資料。

| 名稱 | Profile | 說明 |
|---|---|---|
| [病人基本資料](StructureDefinition-StrokePatient.html) | StrokePatient | 病歷號、性別、出生年月與死亡日期。每個院所的每個病歷號各建立一筆。 |
| [就醫事件](StructureDefinition-StrokeEncounter.html) | StrokeEncounter | 急診與住院的就醫期間與離院情形。本院急診、他院急診與本院住院各建立一筆。 |
| [醫療院所](StructureDefinition-StrokeOrganization.html) | StrokeOrganization | 登錄醫院的院所名稱與本地院所代號。 |
| [醫事人員](StructureDefinition-StrokePractitioner.html) | StrokePractitioner | 已在院所人員主檔核定的醫事人員與登錄人員。只有姓名時不建立，改用 Reference.display。 |
{: .grid .rwd-table}

#### 二、生命徵象與量表

##### 生命徵象

到院時測得的生命徵象。代碼與單位沿用 TW Core 生命徵象 Profile 的規定。

| 名稱 | Profile | 說明 |
|---|---|---|
| [身高](StructureDefinition-StrokeBodyHeight.html) | StrokeBodyHeight | 到院時測得的身高，單位 cm。 |
| [體重](StructureDefinition-StrokeBodyWeight.html) | StrokeBodyWeight | 到院時測得的體重，單位 kg。 |
| [體溫](StructureDefinition-StrokeBodyTemperature.html) | StrokeBodyTemperature | 到院時測得的體溫，單位 Cel。 |
| [心率](StructureDefinition-StrokeHeartRate.html) | StrokeHeartRate | 到院時測得的心率。 |
| [呼吸速率](StructureDefinition-StrokeRespiratoryRate.html) | StrokeRespiratoryRate | 到院時測得的呼吸速率。 |
| [血壓](StructureDefinition-StrokeBloodPressure.html) | StrokeBloodPressure | 到院時測得的收縮壓與舒張壓，記錄在同一筆的兩個 component。 |
{: .grid .rwd-table}

##### 評估量表

代碼使用 LOINC。

| 名稱 | Profile | 說明 |
|---|---|---|
| [昏迷指數](StructureDefinition-StrokeGCS.html) | StrokeGCS | 格拉斯哥昏迷指數（GCS）。睜眼、語言、動作三項以 component 記錄。 |
| [NIHSS 評估](StructureDefinition-StrokeNIHSS.html) | StrokeNIHSS | 美國國衛院中風量表（NIHSS）總分與 15 個分項。每次評估建立一筆。 |
| [mRS 評估](StructureDefinition-StrokeMRS.html) | StrokeMRS | 修正版 Rankin 量表（mRS）分數。中風前、離院與 3 個月追蹤各建立一筆。 |
{: .grid .rwd-table}

#### 三、中風評估

病人背景、病史、中風分類與住院照護的評估結果。多數 Observation Profile 每個項目各建立一筆，以 code 區分項目。

##### 病人背景與病史

| 名稱 | Profile | 說明 |
|---|---|---|
| [就醫背景](StructureDefinition-StrokeAdmissionContext.html) | StrokeAdmissionContext | 就醫來源、到院方式、未住院註記、病人年齡與教育程度。 |
| [職業](StructureDefinition-StrokeOccupation.html) | StrokeOccupation | 病人的職業類別，以本 IG 的職業類別代碼記錄。 |
| [吸菸狀態](StructureDefinition-StrokeSmokingStatus.html) | StrokeSmokingStatus | 目前吸菸或已戒菸，同時記錄 SNOMED CT 與本 IG 的吸菸狀態細分代碼。 |
| [危險因子與病史](StructureDefinition-StrokeRiskFactor.html) | StrokeRiskFactor | 高血壓、糖尿病、既往中風、心臟病史、家族病史、吸菸量與吸菸年數。 |
{: .grid .rwd-table}

##### 中風診斷與分類

| 名稱 | Profile | 說明 |
|---|---|---|
| [中風診斷](StructureDefinition-StrokeCondition.html) | StrokeCondition | 中風診斷，診斷碼採用 ICD-10-CM。 |
| [發病時間](StructureDefinition-StrokeOnsetTime.html) | StrokeOnsetTime | 中風發病時間、最後正常時間、發病時間不確定與醒後中風註記。 |
| [中風分類評估](StructureDefinition-StrokeClinicalAssessment.html) | StrokeClinicalAssessment | 中風類型、TOAST 分類、ICH 分數、Hunt and Hess 分級、心電圖心房顫動與中風前可否獨立生活。 |
{: .grid .rwd-table}

##### 住院照護與結果

| 名稱 | Profile | 說明 |
|---|---|---|
| [照護流程紀錄](StructureDefinition-StrokeCareProcess.html) | StrokeCareProcess | 未施打 IV-tPA 的原因、首次 CT／MRI 是否為外院影像、入住加護病房，以及各項「無用藥」「無手術」註記。 |
| [住院併發症與惡化](StructureDefinition-StrokeComplication.html) | StrokeComplication | 住院期間的併發症、中風惡化與神經學惡化原因。 |
| [檢驗結果](StructureDefinition-StrokeLaboratory.html) | StrokeLaboratory | 抽血檢驗結果。每個檢驗項目、每次採檢各建立一筆。 |
| [離院與追蹤結果](StructureDefinition-StrokeOutcome.html) | StrokeOutcome | 離院死亡原因與去向、中風後 3 個月所在處所、追蹤期間的醫療狀態、死亡原因與再中風。 |
{: .grid .rwd-table}

#### 四、EVT 處置

EVT 主處置與各子術式記錄在[醫療處置](StructureDefinition-StrokeProcedure.html)；以下 Profile 記錄無法用 Procedure 表達的細節與結果。

| 名稱 | Profile | 說明 |
|---|---|---|
| [EVT 處置細節](StructureDefinition-StrokeEvtProcedureDetail.html) | StrokeEvtProcedureDetail | EVT 前灌流影像註記、血管解剖與狹窄程度、目標血管、麻醉與鎮靜、取栓技術與救援策略。 |
| [處置時點結果](StructureDefinition-StrokeProcedureResult.html) | StrokeProcedureResult | 首次血管再通、最終血管再通與再灌流時間，每個時點各建立一筆。 |
| [EVT 術後結果](StructureDefinition-StrokeEvtOutcome.html) | StrokeEvtOutcome | 最終 TICI 分級、再血栓、新血管區域栓塞、術後血壓控制目標、EVT 相關併發症與追蹤影像結果。 |
{: .grid .rwd-table}

#### 五、用藥與處置

| 名稱 | Profile | 說明 |
|---|---|---|
| [用藥紀錄](StructureDefinition-StrokeMedicationStatement.html) | StrokeMedicationStatement | 住院前、住院中、離院時及 EVT 後 24 小時內，是否使用特定藥品或藥物類別。 |
| [給藥紀錄](StructureDefinition-StrokeMedicationAdministration.html) | StrokeMedicationAdministration | 實際給予的 IV-tPA、EVT 鎮靜藥物與動脈內治療藥物。 |
| [醫療處置](StructureDefinition-StrokeProcedure.html) | StrokeProcedure | EVT 主處置與子術式、動脈穿刺、腦部手術及住院期間處置。 |
{: .grid .rwd-table}

#### 六、影像

| 名稱 | Profile | 說明 |
|---|---|---|
| [影像檢查](StructureDefinition-StrokeImagingStudy.html) | StrokeImagingStudy | 首次 CT／MRI、EVT 前 CT、CTA、MRI、追蹤 CT／MR，以及 RAPID 影像分析所用的掃描。 |
| [影像判讀結果](StructureDefinition-StrokeImagingResult.html) | StrokeImagingResult | ASPECTS、灌流體積、mismatch、Tmax、低灌流強度比值（HIR）、影響側與多期 CTA 側枝循環。 |
| [影像檢查醫令](StructureDefinition-StrokeServiceRequest.html) | StrokeServiceRequest | 影像檢查醫令。院方核定醫令識別方式後才使用。 |
{: .grid .rwd-table}

#### 七、表單與追溯

| 名稱 | Profile | 說明 |
|---|---|---|
| [登錄表單回覆](StructureDefinition-StrokeRegistryResponse.html) | StrokeRegistryResponse | 登錄識別碼、表單狀態、尚未轉成臨床資源的欄位，以及來源原始值備份。 |
| [資料來源追溯](StructureDefinition-StrokeProvenance.html) | StrokeProvenance | 匯入來源、登錄經手人員與來源時戳。每次匯入、每個來源資料版本各建立一筆。 |
| [研究同意](StructureDefinition-StrokeConsent.html) | StrokeConsent | 可查核的研究同意文件。只有簽署旗標時不建立，改存登錄表單回覆。 |
{: .grid .rwd-table}

登錄表單回覆依據的表單定義為[腦中風登錄表單](Questionnaire-stroke-registry.html)，包含正規化題目，以及個管系統、EVT 登錄與 RAPID 三個來源的原始值群組。

#### 八、個案資料包

三個資料來源各自組包，Bundle 類型為 collection。每包有一位病人與至少一份登錄表單回覆，包內資源互相參照，所有資源的病人都指向包內的 Patient。

| 名稱 | Profile | 說明 |
|---|---|---|
| [個管系統個案資料包](StructureDefinition-StrokeCaseManagementBundle.html) | StrokeCaseManagementBundle | 一個個管事件的完整資料，以個管流水序號識別。 |
| [EVT 登錄個案資料包](StructureDefinition-StrokeEvtRegistryBundle.html) | StrokeEvtRegistryBundle | 一位 EVT 個案的完整資料，包括主表與追蹤表，以 EVT 登錄個案識別碼識別。 |
| [RAPID 影像分析資料包](StructureDefinition-StrokeRapidBundle.html) | StrokeRapidBundle | 一次 RAPID 掃描的完整資料，以醫院代號、病歷號、申請序號與掃描類型組成的掃描紀錄鍵識別。 |
{: .grid .rwd-table}

### Extensions

以下為臺灣榮總腦中風實作指引（TW VGH Stroke IG）定義的 [Extensions]({{site.data.fhir.path}}extensibility.html)。

| 名稱 | Extension | 使用位置 | 說明 |
|---|---|---|---|
| [評估時點](StructureDefinition-assessment-phase.html) | StrokeAssessmentPhase | Observation | 評估所屬的臨床時點，例如入院、出院、施針前、治療後 24 小時、中風前或 3 個月追蹤。 |
| [評估序號](StructureDefinition-assessment-sequence.html) | StrokeAssessmentSequence | Observation（NIHSS、mRS） | 來源記錄的評估序號。序號不代表臨床時點，臨床時點以評估時點記錄。 |
| [用藥紀錄時窗](StructureDefinition-medication-recording-context.html) | StrokeMedicationRecordingContext | MedicationStatement | 用藥紀錄所屬的時窗：住院前、住院中、離院時或 EVT 後 24 小時內。 |
| [來源事件時間](StructureDefinition-event-time-only.html) | StrokeEventTimeOnly | Condition.onset[x]、Encounter.period.start、Encounter.period.end、Observation.value[x]、Observation.effective[x]、Procedure.performed[x]、MedicationAdministration.effective[x]、MedicationStatement.effective[x]、ImagingStudy.started、Provenance.occurred[x]、ServiceRequest.authoredOn、ServiceRequest.occurrence[x]、Consent.dateTime、QuestionnaireResponse.authored | 保留來源記錄的事件時間。用於兩種情況：來源只有時間、沒有日期；或來源時區尚待確認，原元素只填日期。 |
{: .grid .rwd-table}

父層要求必填的元素（例如 Patient.birthDate）若無來源值，本 IG 沿用 FHIR 官方的 [Data Absent Reason]({{site.data.fhir.path}}extension-data-absent-reason.html) Extension 說明缺值原因。
