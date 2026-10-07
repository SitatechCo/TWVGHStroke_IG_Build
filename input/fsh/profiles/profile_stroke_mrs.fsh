Profile: StrokeMRS
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeMRS
Title: "腦中風－mRS 評估"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現修正版 Rankin 量表（mRS）的評估結果。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每次 mRS 評估建立一筆 Observation，同一次原始評估只建一筆；中風前 mRS 須與離院、3 個月追蹤分開建立，並以 assessmentPhase 標示中風前、離院、3 個月追蹤或尚未分類。若來源只有評估序號且意義尚未確認，assessmentPhase 請填 unclassified。"
* obeys stroke-mrs-pre-stroke-range

* extension contains
    StrokeAssessmentPhase named assessmentPhase 1..1 MS and
    StrokeAssessmentSequence named assessmentSequence 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[應填入 pre-stroke／discharge／3-month；無法確認時填 unclassified]"
* extension[assessmentPhase] ^definition = "必填。中風前填 pre-stroke，離院填 discharge，3 個月追蹤填 3-month；來源資料本身就是離院或 3 個月追蹤的 mRS 時，才填 discharge 或 3-month。來源只有評估序號時，序號 1 至 9 的意義確認前填 unclassified。"
* extension[assessmentSequence] ^short = "來源評估序號。[有序號時原樣填入]"
* extension[assessmentSequence] ^definition = "來源有評估序號時原樣填入（例如 1 至 9），沒有序號則不填。"

* status MS
* status ^short = "結果狀態。[填 final／amended／unknown 等]"
* status ^definition = "評估結果狀態。來源確認為正式結果填 final，無法確認填 unknown。"

* category MS
* category ^short = "評估類別。[須包含 survey]"
* category ^definition = "依 TW Core 規定，至少須包含 observation-category 的 survey。"

* code MS
* code = $LOINC#75859-9
* code ^short = "mRS 分數。[固定為 LOINC 75859-9]"
* code ^definition = "固定填 LOINC 75859-9（Modified rankin scale）。"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "填寫本次評估所屬的就醫事件。若 3 個月追蹤不屬於任何就醫事件，可不填。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "評估日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "填寫評估日期，至少須有完整日期。時區確認前僅填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附於此元素，並保留在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間並帶時區（例如 +08:00）。來源無時間時僅填日期。若只有年月或只有時間則不填本元素，原值改存登錄表單（StrokeRegistryResponse）。中風前 mRS 通常無評估日期，可不填。"

* value[x] MS
* value[x] only integer
* valueInteger ^minValueInteger = 0
* valueInteger ^maxValueInteger = 6
* value[x] ^short = "mRS 分數。[0–6 的整數；中風前為 0–5]"
* value[x] ^definition = "依來源原樣填入 mRS 分數：0 無症狀、1 有症狀但無明顯失能、2 輕度失能、3 中度失能、4 中重度失能、5 重度失能、6 死亡。中風前 mRS 僅能填 0–5；來源空白則不填。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[分數無法使用時填]"
* dataAbsentReason ^definition = "來源為非數值或特殊數字（例如超出 0–6），且定義說明為無法評估或不知道時，不填 valueInteger，改填缺值原因（例如 unknown）。若來源無可支持的缺值原因，則不建立 Observation，只保留登錄表單。"

Invariant: stroke-mrs-pre-stroke-range
Description: "中風前（pre-stroke）mRS 分數須介於 0 至 5。"
Severity: #error
Expression: "extension.where(url = 'http://vgh-stroke-ig.fhir.tw/StructureDefinition/assessment-phase').value.ofType(code).where($this = 'pre-stroke').exists() implies value.ofType(integer).all($this <= 5)"
