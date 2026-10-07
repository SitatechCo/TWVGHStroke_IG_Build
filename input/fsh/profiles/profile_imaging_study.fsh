Profile: StrokeImagingStudy
Parent: $TWCoreImagingStudy
Id: StrokeImagingStudy
Title: "腦中風－影像檢查"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 ImagingStudy Resource，以呈現腦中風病人的首次 CT/MRI、EVT 前 CT、CTA、MRI、追蹤 CT/MR，以及 RAPID 影像分析所用的掃描。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每次影像檢查建立一筆，記錄檢查種類與開始時間。首次 CT/MRI、EVT 前 CT、EVT 前 CTA、EVT 前 MRI、追蹤 CT、追蹤 MR 各自建立；只有確認是同一次檢查時，才把日期與時間合在同一筆。來源時間的時區確認前，started 只填日期，時間原值保存在登錄表單（StrokeRegistryResponse）。影像判讀結果（例如 ASPECTS、灌流體積）另以 StrokeImagingResult 記錄。"

* identifier MS
* identifier ^short = "檢查識別碼。[有 DICOM Study Instance UID 或已核定的檢查單號時才填]"
* identifier ^definition = "有 DICOM Study Instance UID 時，system 填 urn:dicom:uid，value 填 urn:oid: 加上 UID。院方確認 RAPID 影像申請序號為檢查單號（accession number）後才填入，type 填 ACSN；確認前存入登錄表單。"

* status MS
* status ^short = "檢查狀態。[已完成檢查填 available]"
* status ^definition = "來源記錄已完成檢查填 available。無法確認檢查狀態時填 unknown。"

* modality MS
* modality ^short = "檢查儀器類別。[CT 填 CT，MRI 填 MR]"
* modality ^definition = "填 DICOM 代碼（system 為 http://dicom.nema.org/resources/ontology/DCM）。CT、CTA、CT 灌流與非增強 CT 都填 CT；MRI 填 MR。檢查技術（CTP、CTA、NCCT）填在 procedureCode。首次 CT/MRI 無法確認是哪一種時不填。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"

* started MS
* started ^short = "檢查開始日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* started ^definition = "時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在該元素上，並存入 StrokeRegistryResponse 的原始值題目；確認後把同一次檢查的日期與時間合併成一個 dateTime 並帶時區（例如 +08:00）。只有年月填 YYYY-MM。只有時間沒有日期時 started 不填值，改在 extension 放 StrokeEventTimeOnly。日期與時間都沒有時不填。"
* started.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* started.extension[eventTimeOnly] ^short = "僅有檢查時間（無日期）。[hh:mm:ss]"

* basedOn only Reference(StrokeServiceRequest)
* basedOn MS
* basedOn ^short = "檢查醫令。[應參照 StrokeServiceRequest]"
* basedOn ^definition = "院方核定醫令識別方式後，參照該次檢查醫令。核定前不填。"

* procedureCode MS
* procedureCode ^short = "檢查項目與掃描類型"
* procedureCode ^definition = "以 rapidScanType Slice 填掃描類型。已知正式檢查項目代碼（RadLex 或 ICD-10-PCS）時，另在父層 Slice 填入。"
* procedureCode.coding MS
* procedureCode.coding contains rapidScanType 0..1 MS
* procedureCode.coding[rapidScanType] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/rapid-scan-type"
* procedureCode.coding[rapidScanType] from StrokeRapidScanTypeVS (required)
* procedureCode.coding[rapidScanType] ^short = "掃描類型。[填 CTP／CTA／NCCT]"
* procedureCode.coding[rapidScanType] ^definition = "可填 CTP（CT 灌流）、CTA（CT 血管攝影）、NCCT（非增強 CT）。記錄 RAPID 影像分析掃描時填。其他檢查若能確定是其中一種也可填，例如 EVT 前 CTA 填 CTA。無法確定時不填。"
* procedureCode.coding[rapidScanType].system 1..1 MS
* procedureCode.coding[rapidScanType].code 1..1 MS
* procedureCode.text MS
* procedureCode.text ^short = "檢查名稱"

* description MS
* description ^short = "檢查說明。[填檢查時點與種類，例如「EVT 前 CTA」]"
* description ^definition = "填檢查時點與種類，例如「首次 CT/MRI」「EVT 前 CT」「EVT 前 CTA」「EVT 前 MRI」「追蹤 CT」「追蹤 MR」，用來區分同一病人的多次檢查。"

* series MS
* series ^short = "影像系列。[有 DICOM Series Instance UID 時才填]"
* series ^definition = "取得 DICOM Series Instance UID 時才建立 series。"
* series.uid ^short = "DICOM Series Instance UID。[填影像系列的 UID]"
