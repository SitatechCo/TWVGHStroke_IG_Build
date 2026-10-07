Profile: StrokeClinicalAssessment
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeClinicalAssessment
Title: "腦中風－中風分類評估"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現本次中風的分類評估結果，包括中風類型、TOAST 分類、ICH 分數、Hunt and Hess 分級、心電圖心房顫動與中風前可否獨立生活。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄本次中風類型與病因分類、出血性中風嚴重度分級、心電圖心房顫動與中風前功能狀態。每個項目各建一筆 Observation，以 code 區分。同一來源、病人與項目在同一評估時點只建一筆。ICH 分數與 Hunt and Hess 分級若有評估日期，填入同筆 effectiveDateTime。正式診斷碼另用 StrokeCondition。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，應填入 StrokeAssessmentPhaseVS 的代碼]"
* extension[assessmentPhase] ^definition = "項目所屬的臨床時點。中風前可獨立生活（pre-stroke-independent）填 pre-stroke；其餘項目可確認時點填該時點，無法確認填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeClinicalAssessmentCodeVS (required)
* code ^short = "評估項目。[應填入 StrokeClinicalAssessmentCodeVS 的代碼]"
* code ^definition = "記錄評估項目，每筆 Observation 限填一項。涵蓋中風類型（stroke-type-*）、TIA／ICH／SAH 次分類、TOAST 分類及其補充項目、ICH 分數（ich-score）、Hunt and Hess 分級（hunt-hess-grade）、心電圖心房顫動（ecg-atrial-fibrillation）與中風前可獨立生活（pre-stroke-independent）。"
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 toast-classification]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "此評估所屬的就醫事件。可確認就醫事件時填寫。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "評估日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "評估日期與時間，主要用於 ICH 分數與 Hunt and Hess 分級。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後將同次評估的日期與時間合併為單一值並帶時區（例如 +08:00）。僅有日期時填 YYYY-MM-DD；僅有年月或僅有時間時不填，亦不使用 StrokeEventTimeOnly。"

* value[x] MS
* value[x] only CodeableConcept or boolean or string
* value[x] ^short = "評估結果。[依 code 填入 valueCodeableConcept、valueBoolean 或 valueString]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

- valueCodeableConcept：TOAST 分類（toast-classification）填 StrokeToastCS 代碼。
- valueBoolean：來源 1 填 true，0 填 false；其餘代碼原值保留在登錄表單（StrokeRegistryResponse）。適用：中風類型為短暫性腦缺血（stroke-type-tia）、腦出血（stroke-type-ich）、蜘蛛網膜下腔出血（stroke-type-sah）；TOAST 大動脈粥狀硬化位於顱外（toast-laa-extracranial）、顱內（toast-laa-intracranial）；心電圖心房顫動（ecg-atrial-fibrillation，true＝有心房顫動，false＝不是心房顫動）；中風前可獨立生活（pre-stroke-independent）。
- valueString：原樣填入來源內容。適用：中風類型為腦梗塞（stroke-type-infarction）、TIA／ICH／SAH 次分類（stroke-subtype-tia-ich-sah）、TOAST 其他特定病因說明（toast-specific-etiology）、ICH 分數（ich-score）、Hunt and Hess 分級（hunt-hess-grade）。
"""
* valueCodeableConcept from StrokeClinicalAssessmentAnswerVS (required)
* valueCodeableConcept ^short = "TOAST 分類代碼。[應填入 StrokeClinicalAssessmentAnswerVS 的代碼]"
* valueCodeableConcept ^definition = "TOAST 分類：1＝大動脈粥狀硬化、3＝心因性栓塞、4＝其他確定病因、5＝病因不明、svo＝小血管阻塞。來源為分類文字時，依上述對照轉碼。"
* valueBoolean ^short = "是否符合此項目。[true＝是，false＝否]"
* valueString ^short = "文字結果。[原樣填入來源內容]"
* valueString ^definition = "原樣填入來源內容，例如 ICH 分數或 Hunt and Hess 分級原始值。不列入醫事機構名稱、病人與醫師姓名。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "本 Profile 沒有「不確定」選項。來源空白時不建立 Observation；TOAST 病因不明請填代碼 5。"
