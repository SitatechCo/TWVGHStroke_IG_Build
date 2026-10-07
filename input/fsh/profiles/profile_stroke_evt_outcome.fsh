Profile: StrokeEvtOutcome
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeEvtOutcome
Title: "腦中風－EVT 術後結果"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現動脈內血栓移除術（EVT）的術後結果，包括最終 TICI 分級、再血栓、新血管區域栓塞、術後血壓控制目標、EVT 相關併發症與追蹤影像結果。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄 EVT 結束時與術後結果。每個項目建立一筆 Observation，以 code 區分項目，並以 partOf 參照 EVT 主處置（StrokeProcedure）。同一來源、同一病人、同一項目在同一次 EVT 只建立一筆。來源空白時不建立；無法辨識的來源代碼，原值保存在登錄表單（StrokeRegistryResponse）。effective 依項目填實際評估或追蹤檢查時間。追蹤 CT／MRI 檢查本身記錄在 StrokeImagingStudy；血管再通與再灌流時間記錄在 StrokeProcedureResult。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，本 Profile 可不填]"
* extension[assessmentPhase] ^definition = "EVT 術後結果屬於該次 EVT，不屬於特定評估時點，可不填。需要註記但無法確認時點時填 unclassified。"

* partOf MS
* partOf only Reference(StrokeProcedure)
* partOf ^short = "所屬 EVT 處置。[應參照 StrokeProcedure 的 EVT 主處置]"
* partOf ^definition = "填入 EVT 主處置參照，也就是 code 為 evt 的 StrokeProcedure，例如 Procedure/stroke-procedure-evt-example。即使時間未知而省略 effective，仍以 partOf 關聯 EVT 主處置。尚未建立 EVT 主處置時可不填。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeEvtOutcomeCodeVS (required)
* code ^short = "EVT 術後結果項目。[應填入 StrokeEvtOutcomeCodeVS 的代碼]"
* code ^definition = """
本筆 Observation 記錄的項目，一筆只填一項，包括：

- EVT 結果：最終 TICI 分級（final-tici-grade）、血管再通後 5 至 10 分鐘內再血栓（rethrombosis-within-10-minutes）、新血管區域栓塞（new-territory-embolism）與其說明（new-territory-embolism-detail）、EVT 後血壓控制目標（post-evt-bp-target）。
- EVT 相關併發症：無 EVT 相關併發症（no-evt-complication）、血管剝離（evt-arterial-dissection）、穿刺處血腫（evt-puncture-site-hematoma）、其他 EVT 相關併發症（evt-other-complication）。
- 追蹤影像：無追蹤影像（no-follow-up-imaging）、執行追蹤 CT（follow-up-ct-performed）、執行追蹤 MRI（follow-up-mri-performed）、追蹤影像顯示顱內出血（follow-up-imaging-ich）與其症狀分類（follow-up-ich-symptom-type）、追蹤影像顯示梗塞（follow-up-imaging-infarct）、追蹤影像其他發現（follow-up-imaging-other-finding）。
"""
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 final-tici-grade]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "填入執行 EVT 的就醫事件。能確認就醫事件時填寫。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "評估或檢查時間。[YYYY-MM-DD；確認時區後填 YYYY-MM-DDThh:mm:ss＋時區；時間未知時省略]"
* effective[x] ^definition = """
依項目填實際評估或追蹤檢查時間：

- EVT 當下取得的結果：最終 TICI 分級（final-tici-grade）、5 至 10 分鐘內再血栓（rethrombosis-within-10-minutes）、新血管區域栓塞（new-territory-embolism）與其說明（new-territory-embolism-detail），填 EVT 執行時間，可與 partOf 參照的 EVT 主處置相同。
- 追蹤影像項目：執行追蹤 CT／MRI（follow-up-ct-performed、follow-up-mri-performed）、追蹤影像顯示顱內出血（follow-up-imaging-ich）與其症狀分類（follow-up-ich-symptom-type）、追蹤影像顯示梗塞（follow-up-imaging-infarct）、追蹤影像其他發現（follow-up-imaging-other-finding），填該次追蹤影像檢查時間，與 StrokeImagingStudy 的 started 相同。無法確認結果取自哪一次追蹤影像時，省略本元素。
- EVT 後血壓控制目標（post-evt-bp-target）：填實際訂定血壓控制目標的時間。
- EVT 相關併發症（no-evt-complication、evt-arterial-dissection、evt-puncture-site-hematoma、evt-other-complication）：填實際評估或確認併發症的時間。

各項目至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。

若時間未知、只有時間沒有日期，或該項目沒有對應的檢查時間（例如無追蹤影像 no-follow-up-imaging），請省略本元素，改以 partOf 關聯 EVT 主處置。
"""

* value[x] MS
* value[x] only boolean or CodeableConcept or string
* value[x] ^short = "觀察值。[依 code 填入 valueBoolean、valueCodeableConcept 或 valueString]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

**valueBoolean（有／沒有）**：來源 1 填 true，0 填 false；其他代碼原值保存在登錄表單（StrokeRegistryResponse）。適用：再血栓（rethrombosis-within-10-minutes）、新血管區域栓塞（new-territory-embolism）、血管剝離（evt-arterial-dissection）、穿刺處血腫（evt-puncture-site-hematoma）、其他 EVT 相關併發症（evt-other-complication）、執行追蹤 CT（follow-up-ct-performed）、執行追蹤 MRI（follow-up-mri-performed）、追蹤影像顯示顱內出血（follow-up-imaging-ich）、追蹤影像顯示梗塞（follow-up-imaging-infarct）、追蹤影像其他發現（follow-up-imaging-other-finding）。

**valueBoolean（勾選註記）**：無 EVT 相關併發症（no-evt-complication）、無追蹤影像（no-follow-up-imaging）。來源有勾選填 true，未勾選則不建立。

**valueCodeableConcept**：最終 TICI 分級（final-tici-grade）、EVT 後血壓控制目標（post-evt-bp-target）、追蹤影像顱內出血症狀分類（follow-up-ich-symptom-type）。可用代碼見 valueCodeableConcept 說明。

**valueString**：新血管區域栓塞說明（new-territory-embolism-detail），原樣填入來源文字。
"""
* valueBoolean ^short = "是否發生。[true＝有，false＝沒有]"
* valueCodeableConcept from StrokeEvtOutcomeAnswerVS (required)
* valueCodeableConcept ^short = "代碼值。[應填入 StrokeEvtOutcomeAnswerVS 的代碼]"
* valueCodeableConcept ^definition = """
依項目選用對應代碼：

- 最終 TICI 分級（final-tici-grade）：填 StrokeTiciCS 的 0、1、2a、2b、2c、3，等級越高表示再灌流越完整。
- EVT 後血壓控制目標（post-evt-bp-target）：填 StrokePostEvtBpTargetCS，1＝低於 180 mmHg、2＝低於 160 mmHg、3＝低於 140 mmHg、4＝低於 120 mmHg，代表控制目標的上限分組。
- 追蹤影像顱內出血症狀分類（follow-up-ich-symptom-type）：填 StrokeIchSymptomCS，1＝有症狀（36 小時內 NIHSS 增加 4 分）、2＝無症狀。
"""
* valueString ^short = "栓塞位置或細節。[原樣填入來源文字]"
* valueString ^definition = "原樣填入來源文字，不列入醫事機構名稱、病人與醫師姓名等資訊。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "本 Profile 沒有「不確定」選項。來源空白時不建立 Observation。"
