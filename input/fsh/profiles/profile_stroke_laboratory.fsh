Profile: StrokeLaboratory
Parent: $TWCoreObservationLaboratoryResult
Id: StrokeLaboratory
Title: "腦中風－檢驗結果"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人的抽血檢驗結果，例如血液常規、凝血功能、血糖、腎功能、肝功能與血脂。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每個檢驗項目、每次採檢各建立一筆 Observation，以 code 區分項目。有實際採檢時間才建立；沒有採檢時間時，原值只保存在登錄表單（StrokeRegistryResponse）。"

* status MS
* status ^short = "結果狀態。[填 final／amended／unknown 等]"
* status ^definition = "檢驗結果狀態。來源確認為正式報告時填 final；無法確認時填 unknown。"

* category MS
* category ^short = "結果類別。[應包含 laboratory]"
* category ^definition = "依 TW Core 規定，固定包含 observation-category 的 laboratory。"

* code MS
* code ^short = "檢驗項目。[strokeObservation Slice 應填入 StrokeLaboratoryCodeVS 的代碼]"
* code ^definition = "沿用 TW Core 的 code 綁定（laboratory-code-tw，extensible）。每筆都要在 strokeObservation Slice 填一個本 IG 檢驗項目代碼。等院方確認檢體、單位與方法後再加入各項目的 LOINC 代碼；加入時在同一個 code 另放一個 LOINC coding，此 coding 依 TW Core 的 code 綁定檢查。"
* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "依 coding.system 區分本 IG 檢驗項目代碼與標準碼"
* code.coding.system 1..1 MS
* code.coding.code 1..1 MS
* code.coding contains strokeObservation 1..1 MS
* code.coding[strokeObservation] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding[strokeObservation] from StrokeLaboratoryCodeVS (required)
* code.coding[strokeObservation] ^short = "本 IG 檢驗項目代碼。[應填入 StrokeLaboratoryCodeVS 的代碼]"
* code.coding[strokeObservation] ^definition = "必填一個 StrokeObservationCS 的檢驗項目代碼，例如 hemoglobin（血紅素）、pt-inr（INR）。PT 用 prothrombin-time。UA 在確認是尿酸或尿液檢查前，只能用 ua-unspecified。"
* code.coding[strokeObservation].system 1..1 MS
* code.coding[strokeObservation].code 1..1 MS

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "執行此次採檢的就醫事件。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "採檢日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "必填。檢體採集的日期與時間，至少要有完整日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。來源沒有時間時只填日期。有實際採檢時間才建立 Observation。"

* value[x] MS
* value[x] only Quantity
* value[x] ^short = "檢驗數值。[依來源原值填寫]"
* value[x] ^definition = "檢驗結果數值，照來源原值填寫。確認單位後，以 UCUM 填 unit、system 與 code；確認單位前只填 value。"
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "數值。[照來源原值填寫]"
* valueQuantity.unit MS
* valueQuantity.unit ^short = "單位顯示。[確認單位後填寫]"
* valueQuantity.system MS
* valueQuantity.system = $UCUM
* valueQuantity.system ^short = "單位系統。[固定為 http://unitsofmeasure.org]"
* valueQuantity.code MS
* valueQuantity.code ^short = "UCUM 單位代碼。[確認單位後填寫]"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[結果為 NA 等無數值時填 unknown]"
* dataAbsentReason ^definition = "有採檢時間但結果為 NA、NAA 或空白時，不填 valueQuantity，改填 dataAbsentReason = unknown。"
