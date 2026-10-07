Profile: StrokeAdmissionContext
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeAdmissionContext
Title: "腦中風－就醫背景"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人本次就醫的背景資料，包括就醫來源、到院方式、未住院註記、病人年齡與教育程度。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄腦中風登錄的就醫背景。每個項目建一筆 Observation，以 code 區分。同一來源、同一病人、同一項目在同一評估時點只建一筆。來源空白時不建立；無法辨識的來源代碼，原值保留在登錄表單（StrokeRegistryResponse）。病人年齡照登錄數值填寫。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，應填入 StrokeAssessmentPhaseVS 的代碼]"
* extension[assessmentPhase] ^definition = "此項目所屬的臨床時點。就醫背景屬於入院資料，可填 admission；無法確認時填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeAdmissionContextCodeVS (required)
* code ^short = "觀察項目。[應填入 StrokeAdmissionContextCodeVS 的代碼]"
* code ^definition = "這筆 Observation 記錄的項目，一筆只填一項。可填 admission-source（就醫來源）、arrival-mode（到院方式）、not-hospitalized（未住院）、patient-age（病人年齡）、education-level（教育程度）。"
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 arrival-mode]"

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
* effective[x] ^definition = "此項目的記錄日期，至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。只有時間沒有日期時不填。"

* value[x] MS
* value[x] only CodeableConcept or boolean or Quantity
* value[x] ^short = "觀察值。[依 code 填入 valueCodeableConcept、valueBoolean 或 valueQuantity]"
* value[x] ^definition = """
依 code 填入對應型別：

- valueCodeableConcept：就醫來源（admission-source）填 StrokeAdmissionSourceCS 代碼；到院方式（arrival-mode）填 StrokeArrivalModeCS 代碼；教育程度（education-level）填 StrokeEducationLevelCS 代碼。
- valueBoolean：未住院（not-hospitalized）。來源有勾選填 true；未勾選就不建立此 Observation。
- valueQuantity：病人年齡（patient-age），單位填 a（年）。

來源空白時不建立 Observation。
"""
* valueCodeableConcept from StrokeAdmissionContextAnswerVS (required)
* valueCodeableConcept ^short = "代碼值。[應填入 StrokeAdmissionContextAnswerVS 的代碼]"
* valueCodeableConcept ^definition = """
依項目選用對應代碼，並保留來源原碼：

- 就醫來源：1＝急診、2＝直入病房、3＝院內中風；A＝住院、E＝急診、O＝門診。數字代碼與英文代碼分類方式不同，各自保留。
- 到院方式：1＝緊急醫療救護（EMS）、2＝自行到院、3＝轉院、NONE＝無。
- 教育程度：EDU00＝無、EDU01＝小學、EDU02＝國中、EDU03＝高中職、EDU04＝大專、EDU05＝研究所、EDU99＝不詳。來源是 EDU99 就照填 EDU99。
"""
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "年齡數值。[例如 72]"
* valueQuantity.unit MS
* valueQuantity.unit ^short = "單位顯示文字。[例如 歲]"
* valueQuantity.system MS
* valueQuantity.system = $UCUM
* valueQuantity.system ^short = "單位系統。[固定填入 http://unitsofmeasure.org]"
* valueQuantity.code MS
* valueQuantity.code = #a
* valueQuantity.code ^short = "UCUM 單位代碼。[固定填入 a（年）]"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "本 Profile 項目沒有「不確定」選項。來源空白時不建立 Observation；教育程度「不詳」填 EDU99。"
