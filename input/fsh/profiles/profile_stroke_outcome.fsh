Profile: StrokeOutcome
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeOutcome
Title: "腦中風－離院與追蹤結果"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人的離院結果與離院後追蹤結果，包括離院死亡原因、離院去向、中風後 3 個月所在處所、追蹤期間的醫療狀態、死亡原因與再中風。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄離院時與離院後追蹤結果。每個項目建立一筆 Observation，以 code 區分項目。同一來源、同一病人、同一項目在同一評估時點只建立一筆。來源空白時不建立；無法辨識的來源代碼，原值保存在登錄表單（StrokeRegistryResponse）。離院死亡日期與追蹤期間死亡日期記錄在 StrokePatient.deceasedDateTime。中風後 3 個月 mRS 與追蹤日期記錄在 StrokeMRS。轉入醫院、回診醫院、再中風就醫醫院等院所名稱保存在登錄表單（StrokeRegistryResponse）。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，應填入 StrokeAssessmentPhaseVS 的代碼]"
* extension[assessmentPhase] ^definition = "離院項目（discharge-death-cause、discharge-death-cause-other、discharge-destination）填 discharge；中風後 3 個月追蹤項目（three-month-residence、three-month-follow-up-not-completed）填 3-month。追蹤期間醫療狀態、死亡與再中風項目的時點無法確認時填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeOutcomeCodeVS (required)
* code ^short = "離院或追蹤結果項目。[應填入 StrokeOutcomeCodeVS 的代碼]"
* code ^definition = """
本筆 Observation 記錄的項目，一筆只填一項，包括：

- 離院結果：離院死亡原因（discharge-death-cause）與其他死亡原因說明（discharge-death-cause-other）、離院去向（discharge-destination）。
- 中風後 3 個月追蹤：所在處所（three-month-residence）、追蹤未完成（three-month-follow-up-not-completed）。
- 追蹤期間事件：醫療狀態（follow-up-care-status）、拒絕回診說明（follow-up-refusal-reason）、死亡原因（follow-up-death-cause）、因出血性中風死亡（follow-up-death-hemorrhagic-stroke）、因缺血性中風死亡（follow-up-death-ischemic-stroke）、其他死亡原因說明（follow-up-death-cause-other）、再中風（recurrent-stroke）、再發出血性中風（recurrent-hemorrhagic-stroke）、再發缺血性中風（recurrent-ischemic-stroke）、再中風日期（recurrent-stroke-date）。

死亡日期記錄在 StrokePatient.deceasedDateTime。
"""
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 discharge-destination]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "填入此結果所屬的本次中風住院就醫事件。離院項目與追蹤項目皆參照同一次住院。能確認就醫事件時填寫。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "記錄日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "填入此項目的記錄或追蹤日期。離院項目可填離院日期；3 個月追蹤項目可填追蹤日期。至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。若沒有日期則不填。"

* value[x] MS
* value[x] only CodeableConcept or boolean or string or dateTime
* value[x] ^short = "觀察值。[依 code 填入 valueCodeableConcept、valueBoolean、valueString 或 valueDateTime]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

**valueCodeableConcept**：離院死亡原因（discharge-death-cause）、離院去向（discharge-destination）、中風後 3 個月所在處所（three-month-residence）、追蹤期間醫療狀態（follow-up-care-status）、追蹤期間死亡原因（follow-up-death-cause）。可用代碼見 valueCodeableConcept 說明。

**valueBoolean（有／沒有）**：來源 1 填 true，0 填 false；其他代碼原值保存在登錄表單（StrokeRegistryResponse）。適用：3 個月追蹤未完成（three-month-follow-up-not-completed，true＝未完成）、因出血性中風死亡（follow-up-death-hemorrhagic-stroke）、因缺血性中風死亡（follow-up-death-ischemic-stroke）、再發出血性中風（recurrent-hemorrhagic-stroke）、再發缺血性中風（recurrent-ischemic-stroke）。

**valueBoolean（再中風）**：追蹤期間再中風（recurrent-stroke）的來源代碼與其他項目不同：1（沒有）填 false，2（再中風）填 true。

**valueString**：原樣填入來源文字。適用：離院其他死亡原因說明（discharge-death-cause-other）、拒絕回診說明（follow-up-refusal-reason）、追蹤期間其他死亡原因說明（follow-up-death-cause-other）。

**valueDateTime**：再中風日期（recurrent-stroke-date），格式見 valueDateTime 說明。
"""
* valueCodeableConcept from StrokeOutcomeAnswerVS (required)
* valueCodeableConcept ^short = "代碼值。[應填入 StrokeOutcomeAnswerVS 的代碼]"
* valueCodeableConcept ^definition = """
依項目選用對應代碼，並保留來源原碼：

- 死亡原因（discharge-death-cause、follow-up-death-cause）：填 StrokeDeathCauseCS，1＝中風致死、2＝其他。選 2 時，原因說明另建 discharge-death-cause-other 或 follow-up-death-cause-other。
- 離院去向（discharge-destination）：填 StrokeDischargeDestinationCS，1＝回家、2＝護理之家、3＝呼吸病房、4＝轉院。
- 中風後 3 個月所在處所（three-month-residence）：填 StrokeThreeMonthResidenceCS，1＝住家、2＝護理之家、3＝呼吸病房、4＝本院住院中、5＝轉至其他醫院、6＝失聯。
- 追蹤期間醫療狀態（follow-up-care-status）：填 StrokeFollowUpCareStatusCS，1＝繼續回診服藥、2＝拒回診、3＝死亡。
"""
* valueBoolean ^short = "是否成立。[true＝是／有，false＝否／沒有]"
* valueString ^short = "文字說明。[原樣填入來源文字]"
* valueString ^definition = "原樣填入來源文字，不列入醫事機構名稱、病人與醫師姓名等資訊。"
* valueDateTime ^short = "再中風日期。[YYYY-MM-DD，西元年月日]"
* valueDateTime ^definition = """
- 只有日期：填 YYYY-MM-DD。
- 只有年月：填 YYYY-MM。
- 有日期與時間：時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。
- 只有時間、沒有日期：valueDateTime 不填值，改在 valueDateTime 的 extension 填 StrokeEventTimeOnly（hh:mm:ss）。
"""
* valueDateTime.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* valueDateTime.extension[eventTimeOnly] ^short = "僅有時間。[hh:mm:ss，24 小時制；只在沒有日期時使用]"
* valueDateTime.extension[eventTimeOnly] ^definition = "來源只有時間、沒有日期時使用。此時 valueDateTime 不填值，只帶此 Extension；取得完整日期後改填 valueDateTime，並移除此 Extension。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "此 Profile 項目沒有「不確定」選項。來源記錄失聯（three-month-residence 為 6）或追蹤未完成時照原值記錄；來源空白則不建立 Observation。"
