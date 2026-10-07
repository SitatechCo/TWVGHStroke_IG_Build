Profile: StrokeProcedureResult
Parent: $TWCoreObservationClinicalResult
Id: StrokeProcedureResult
Title: "腦中風－處置時點結果"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現血管內取栓治療（EVT）過程中的首次血管再通、最終血管再通與再灌流時間。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每個時點各建一筆 Observation，以 code 區分：首次血管再通、最終血管再通與再灌流各一筆，三者定義不同。時間記錄在 valueDateTime；EVT 主處置的執行時間依 StrokeProcedure 的 performed 填寫。"

* status MS
* status ^short = "結果狀態。[填 final／amended／unknown 等]"
* status ^definition = "結果狀態。來源確認為正式紀錄填 final，無法確認填 unknown。"

* category MS
* category ^short = "結果類別。[應包含 procedure]"
* category[twcore] 1..1 MS
* category[twcore] = $ObsCategory#procedure
* category[twcore] ^short = "處置類別。[固定為 procedure]"
* category[twcore] ^definition = "必填，固定填 observation-category 的 procedure。"

* code MS
* code ^short = "時點項目。[strokeObservation Slice 應填入 StrokeProcedureResultCodeVS 的代碼]"
* code ^definition = "沿用 TW Core 的 code 綁定（observation-codes，extensible）。每筆都要在 strokeObservation Slice 填一個本 IG 時點項目代碼。院方核定標準碼（LOINC）後，在同一個 code 另放一個 coding，此 coding 依 TW Core 的 code 綁定檢查。"
* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "依 coding.system 區分本 IG 時點項目代碼與標準碼"
* code.coding.system 1..1 MS
* code.coding.code 1..1 MS
* code.coding contains strokeObservation 1..1 MS
* code.coding[strokeObservation] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding[strokeObservation] from StrokeProcedureResultCodeVS (required)
* code.coding[strokeObservation] ^short = "本 IG 時點項目代碼。[應填入 StrokeProcedureResultCodeVS 的代碼]"
* code.coding[strokeObservation] ^definition = "必填一個 StrokeObservationCS 的代碼。可填 first-recanalization-time（首次血管再通時間）、final-recanalization-time（最終血管再通時間）、reperfusion-time（再灌流時間）。"
* code.coding[strokeObservation].system 1..1 MS
* code.coding[strokeObservation].code 1..1 MS

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "執行此次處置的就醫事件。"

* partOf 0..1 MS
* partOf only Reference(StrokeProcedure)
* partOf ^short = "所屬 EVT 處置。[應參照 StrokeProcedure]"
* partOf ^definition = "此時點所屬的 EVT 主處置。確認屬於同一次 EVT 時填寫。"

* value[x] MS
* value[x] only dateTime
* value[x] ^short = "時點日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* value[x] ^definition = "再通或再灌流發生的日期與時間。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後把同一事件的日期與時間合併成一個值，填到秒（來源只到分時秒填 00）並帶時區（例如 +08:00）。只有日期時填 YYYY-MM-DD；只有年月時填 YYYY-MM。只有時間、沒有日期時，valueDateTime 不填值，改在其 extension 放 StrokeEventTimeOnly 保留時間。日期與時間皆空白時，不建立 Observation。"
* value[x].extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* value[x].extension[eventTimeOnly] ^short = "僅有時間。[只有時間、沒有日期時填寫]"
* value[x].extension[eventTimeOnly] ^definition = "來源只有時間、沒有日期時，在 valueDateTime 的 extension 填入此時間（hh:mm:ss）。取得完整日期後，改填 valueDateTime 並移除本 extension。"

* dataAbsentReason ^short = "缺值原因。[不需填寫]"
* dataAbsentReason ^definition = "日期與時間皆空白時不建立 Observation，因此不需填寫。"
