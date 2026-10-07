Profile: StrokeServiceRequest
Parent: $TWCoreServiceRequest
Id: StrokeServiceRequest
Title: "腦中風－影像檢查醫令"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 ServiceRequest Resource，以呈現腦中風病人影像檢查的醫令。"
* ^status = #draft
* ^experimental = false
* ^purpose = "院方核定醫令識別方式與檢查項目代碼後才使用。每張影像檢查醫令建一筆，執行後的影像檢查以 StrokeImagingStudy.basedOn 參照本資源。核定前，RAPID 影像申請序號只保留在登錄表單，不建本資源。"

* identifier 1..* MS
* identifier ^short = "醫令號。[應填入院方核定的醫令識別碼]"
* identifier ^definition = "填醫令系統產生的醫令號，type 填 PLAC（開立端識別碼），system 依院方核定的識別碼命名規則填寫。"
* identifier.value 1..1 MS

* status MS
* status ^short = "醫令狀態。[依實際醫令狀態填寫]"
* status ^definition = "依醫令系統實際狀態填寫，例如已開立未完成填 active，已完成填 completed，已取消填 revoked。"

* intent MS
* intent ^short = "醫令意圖。[依實際醫令填寫，正式醫令填 order]"
* intent ^definition = "依醫令實際性質填寫。醫師正式開立的檢查醫令填 order。"

* code MS
* code ^short = "檢查項目。[應填入院方核定的檢查項目代碼]"
* code ^definition = "填院方核定的檢查項目代碼，text 填檢查名稱。可另以 rapidScanType Slice 填掃描類型。"
* code.coding MS
* code.coding contains rapidScanType 0..1 MS
* code.coding[rapidScanType] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/rapid-scan-type"
* code.coding[rapidScanType] from StrokeRapidScanTypeVS (required)
* code.coding[rapidScanType] ^short = "掃描類型。[應填入 CTP／CTA／NCCT]"
* code.coding[rapidScanType] ^definition = "可填 CTP（CT 灌流）、CTA（CT 血管攝影）、NCCT（非增強 CT），屬檢查技術粗分類。"
* code.coding[rapidScanType].system 1..1 MS
* code.coding[rapidScanType].code 1..1 MS
* code.text MS
* code.text ^short = "檢查名稱"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"

* authoredOn MS
* authoredOn ^short = "醫令開立日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* authoredOn ^definition = "醫令開立日期時間。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並存入 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間與時區（例如 +08:00）。"

* occurrence[x] MS
* occurrence[x] ^short = "預定執行時間。[醫令有記錄時才填；時區規則同 authoredOn]"
* occurrence[x] ^definition = "醫令記錄的預定執行時間。時區規則同 authoredOn：時區確認前只填日期（YYYY-MM-DD）。"
