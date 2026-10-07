Profile: StrokeCareProcess
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeCareProcess
Title: "腦中風－照護流程紀錄"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風照護流程的登錄註記，包括未施打 IV-tPA 的原因、首次 CT／MRI 是否為外院影像、是否入住加護病房，以及各項「無用藥」「無手術」註記。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄照護流程登錄註記。每個項目建立一筆 Observation，以 code 區分；同一來源、同一病人、同一項目在同一評估時點限建一筆。「無用藥」與「無手術」註記僅代表表單勾選結果，不另建立 MedicationStatement 或 Procedure。入住加護病房僅記錄是否入住。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，應填入 StrokeAssessmentPhaseVS 的代碼]"
* extension[assessmentPhase] ^definition = "此項目的臨床時點。可確認時填具體時點（如離院無用藥 no-discharge-medication 填 discharge）；無法確認時填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeCareProcessCodeVS (required)
* code ^short = "照護流程項目。[應填入 StrokeCareProcessCodeVS 的代碼]"
* code ^definition = "記錄照護流程項目，每筆 Observation 僅填一項。包含未施打 IV-tPA 主要原因與 10 項次要原因（ivtpa-not-given-*）、首次 CT／MRI 為外院影像、入住加護病房，以及住院前、EVT 後 24 小時內、住院手術與離院時的「無」註記。"
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 icu-admission]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "此項目所屬的就醫事件，能確認時再填。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "記錄日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "記錄日期，至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。僅有時間而無日期時不填。"

* value[x] MS
* value[x] only CodeableConcept or boolean
* value[x] ^short = "觀察值。[依 code 填入 valueCodeableConcept 或 valueBoolean]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

- valueCodeableConcept：未施打 IV-tPA 主要原因（ivtpa-not-given-main-reason），填 StrokeIvtpaNotGivenReasonCS 代碼。
- valueBoolean（是／否）：來源 1 填 true、0 填 false；其他代碼原值保留在登錄表單（StrokeRegistryResponse）。適用：住院前無用藥（no-pre-admission-medication）、入住加護病房（icu-admission）、首次 CT／MRI 為外院影像（first-ct-mri-from-outside-hospital）、離院時無用藥（no-discharge-medication），以及未施打 IV-tPA 的 10 項次要原因（ivtpa-not-given-onset-over-3h、ivtpa-not-given-mild-or-improving、ivtpa-not-given-severe-stroke、ivtpa-not-given-age-out-of-range、ivtpa-not-given-prior-stroke-with-diabetes、ivtpa-not-given-high-blood-pressure、ivtpa-not-given-recent-stroke-or-head-trauma、ivtpa-not-given-seizure-at-onset、ivtpa-not-given-oral-anticoagulant、ivtpa-not-given-family-refusal）。次要原因 true＝有此原因，false＝沒有此原因。
- valueBoolean（勾選註記）：EVT 後 24 小時內未用抗血栓藥（no-antithrombotic-within-24h）、無手術治療（no-surgery）。來源有勾選填 true，未勾選不建立。
"""
* valueCodeableConcept from StrokeCareProcessAnswerVS (required)
* valueCodeableConcept ^short = "未施打 IV-tPA 主要原因代碼。[應填入 StrokeCareProcessAnswerVS 的代碼]"
* valueCodeableConcept ^definition = "REA01＝發作超過 3 小時或發作時間不明；REA02＝發作至到院 2 小時內但不符條件；REA03＝發作至到院 2 至 3 小時但不符條件。保留來源原碼。"
* valueBoolean ^short = "註記值。[true＝是，false＝否]"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "本 Profile 沒有「不確定」選項。來源空白時不建立 Observation。"
