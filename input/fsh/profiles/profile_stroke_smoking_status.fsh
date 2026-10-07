Profile: StrokeSmokingStatus
Parent: $TWCoreObservationSmokingStatus
Id: StrokeSmokingStatus
Title: "腦中風－吸菸狀態"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人目前吸菸或過去吸菸的狀態。結果同時填 SNOMED CT 標準碼與本 IG 的吸菸狀態細分代碼。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人目前吸菸或已戒菸。一筆 Observation 代表單一來源記載的吸菸狀態。同一來源、同一病人、同一調查時間（依來源記錄的日期與時間判定，包含時區確認前只保留在原始值題目或 StrokeEventTimeOnly 的時間）只建一筆，不同來源各自建立。來源若無吸菸狀態、代碼無法辨識或缺少實際調查時間，不建立本 Resource，原始值保留在 StrokeRegistryResponse。每日吸菸量與吸菸年數不記錄在此 Profile。"
* obeys stroke-smoking-status-1 and stroke-smoking-status-2

* status MS
* status ^short = "結果狀態。[通常填 final；無法確認時填 unknown]"
* status ^definition = "吸菸狀態紀錄的狀態。來源可確認資料已完成填 final，無法確認填 unknown。"

* category[twcore] 1..1 MS
* category[twcore] ^short = "社會史類別。[固定為 social-history]"
* category[twcore] ^definition = "填 http://terminology.hl7.org/CodeSystem/observation-category 的 social-history。"

* code = $LOINC#72166-2
* code ^short = "吸菸狀態。[固定為 LOINC 72166-2]"
* code ^definition = "固定填 LOINC 72166-2（Tobacco smoking status）。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"
* subject ^definition = "此吸菸狀態所屬的病人。"
* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "調查吸菸狀態所屬的就醫事件，通常為本次中風的急診或住院。"

* effective[x] ^short = "調查時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "實際詢問或記錄吸菸狀態的日期或日期時間，通常填 effectiveDateTime，至少要填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並保存在 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間並帶時區（例如 +08:00）。沒有調查時間時，不建立本 Observation。"

* valueQuantity 0..0
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^short = "吸菸狀態。[SNOMED CT 代碼加吸菸狀態細分代碼]"
* valueCodeableConcept ^definition = "同時填入兩個 coding：SNOMED CT 標準碼與本 IG 吸菸狀態細分代碼。目前吸菸填 77176002（Smoker）；已戒菸填 8517006（Ex-smoker）。細分代碼依來源代碼原樣保留分組：1 或 Current 為目前吸菸；2 為戒菸 2 年或以下；3 為戒菸 2 年以上；Past 為過去吸菸且戒菸年數不詳。"
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.description = "依 coding.system 區分 SNOMED CT 標準碼與本 IG 吸菸狀態細分代碼"
* valueCodeableConcept.coding contains
    snomedSmokingStatus 1..1 MS and
    smokingStatusDetail 1..1 MS
* valueCodeableConcept.coding[snomedSmokingStatus] ^short = "SNOMED CT 吸菸狀態。[77176002 或 8517006]"
* valueCodeableConcept.coding[snomedSmokingStatus] ^definition = "只能填 77176002（Smoker，目前吸菸）或 8517006（Ex-smoker，已戒菸）。細分代碼為 1 或 Current 填 77176002；細分代碼為 2、3 或 Past 填 8517006。"
* valueCodeableConcept.coding[snomedSmokingStatus].system 1..1 MS
* valueCodeableConcept.coding[snomedSmokingStatus].system = $SNOMEDCT
* valueCodeableConcept.coding[snomedSmokingStatus].code 1..1 MS
* valueCodeableConcept.coding[snomedSmokingStatus].display MS
* valueCodeableConcept.coding[smokingStatusDetail] from StrokeSmokingStatusDetailVS (required)
* valueCodeableConcept.coding[smokingStatusDetail] ^short = "吸菸狀態細分代碼。[填 1、2、3、Current 或 Past]"
* valueCodeableConcept.coding[smokingStatusDetail] ^definition = "保留來源的吸菸狀態分組。來源為 1、2、3 時填數字代碼；只分目前與過去時填 Current 或 Past。"
* valueCodeableConcept.coding[smokingStatusDetail].system 1..1 MS
* valueCodeableConcept.coding[smokingStatusDetail].system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/smoking-status-detail"
* valueCodeableConcept.coding[smokingStatusDetail].code 1..1 MS
* valueCodeableConcept.coding[smokingStatusDetail].display MS

* dataAbsentReason ^short = "缺值原因。[本 Profile 必填 valueCodeableConcept，不使用]"
* dataAbsentReason ^definition = "本 Profile 必填 valueCodeableConcept，不使用此元素。來源沒有吸菸狀態時，不建立 Observation。"

Invariant: stroke-smoking-status-1
Description: "valueCodeableConcept 的 SNOMED CT 代碼限填 77176002（Smoker）或 8517006（Ex-smoker）。"
Severity: #error
Expression: "value.ofType(CodeableConcept).coding.where(system = 'http://snomed.info/sct').all(code = '77176002' or code = '8517006')"

Invariant: stroke-smoking-status-2
Description: "SNOMED CT 代碼須與吸菸狀態細分代碼對應：1 或 Current 搭配 77176002；2、3 或 Past 搭配 8517006。"
Severity: #error
Expression: "(value.ofType(CodeableConcept).coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/smoking-status-detail' and (code = '1' or code = 'Current')).exists() implies value.ofType(CodeableConcept).coding.where(system = 'http://snomed.info/sct' and code = '77176002').exists()) and (value.ofType(CodeableConcept).coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/smoking-status-detail' and (code = '2' or code = '3' or code = 'Past')).exists() implies value.ofType(CodeableConcept).coding.where(system = 'http://snomed.info/sct' and code = '8517006').exists())"
