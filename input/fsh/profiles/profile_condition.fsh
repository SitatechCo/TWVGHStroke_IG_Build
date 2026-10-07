Profile: StrokeCondition
Parent: $TWCoreCondition
Id: StrokeCondition
Title: "腦中風－中風診斷"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Condition Resource，以呈現腦中風病人的中風診斷，診斷碼採用 ICD-10-CM。"
* ^status = #draft
* ^purpose = "每個中風診斷建一筆 Condition。診斷內容、臨床狀態與分類都能由診斷來源確認才建立；任一項無法確認時，原值改存登錄表單（StrokeRegistryResponse）。"

* clinicalStatus MS
* clinicalStatus ^short = "臨床狀態。[依診斷來源填寫]"
* clinicalStatus ^definition = "依診斷來源記錄的病況狀態填 condition-clinical 代碼，例如 active、resolved。來源未記錄狀態時不建 Condition。"

* verificationStatus MS
* verificationStatus ^short = "確認狀態。[來源有明確紀錄才填]"
* verificationStatus ^definition = "診斷來源有明確記錄確認狀態才填。"

* category MS
* category ^short = "診斷分類。[依診斷來源填寫，例如 encounter-diagnosis]"
* category ^definition = "依診斷來源填 condition-category 代碼：就醫診斷填 encounter-diagnosis，問題清單填 problem-list-item。來源未記錄分類時不建 Condition。"

* code 1..1 MS
* code obeys stroke-condition-1
* code ^short = "中風診斷。[應填入 ICD-10-CM 診斷碼]"
* code ^definition = "必填。來源的 ICD-10 診斷碼原碼放 code.coding。確認來源採用 ICD-10-CM 或 ICD-10 及其版本才填 coding；版本未確認或代碼無法辨識時，只填 code.text（診斷文字）。"
* code.coding MS
* code.coding contains icd10cm 0..1 MS
* code.coding[icd10cm] ^patternCoding.system = "http://hl7.org/fhir/sid/icd-10-cm"
* code.coding[icd10cm] ^short = "ICD-10-CM 診斷碼。[system 為 http://hl7.org/fhir/sid/icd-10-cm]"
* code.coding[icd10cm] ^definition = "ICD-10-CM 診斷碼要含小數點，例如 I63.9。若採用臺灣版 ICD-10-CM，可同時填入父層 icd10-cm-2023 Slice。"
* code.coding[icd10cm].system 1..1 MS
* code.coding[icd10cm].code 1..1 MS
* code.coding[icd10cm].code ^short = "診斷碼。[例如 I63.9]"
* code.coding[icd10cm].display MS
* code.text MS
* code.text ^short = "診斷文字。[應填入診斷名稱]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "診斷所屬就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "診斷所屬的就醫事件確認後才填。"

Invariant: stroke-condition-1
Description: "診斷須有代碼或診斷文字。"
Severity: #error
Expression: "coding.exists() or text.exists()"
