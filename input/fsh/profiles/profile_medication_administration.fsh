Profile: StrokeMedicationAdministration
Parent: MedicationAdministration
Id: StrokeMedicationAdministration
Title: "腦中風－給藥紀錄"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 MedicationAdministration Resource，以呈現腦中風病人實際接受的靜脈血栓溶解劑（IV-tPA）、EVT 鎮靜藥物與動脈內治療藥物。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄一次實際給藥，或明確記錄未給藥的事件。IV-tPA、鎮靜藥與動脈內藥物各自建立一筆。給藥狀態、藥品、病人與給藥時間都齊全時才建立；若缺給藥時間、無法確認屬於哪次事件或藥品不明，不建立本資源，改存登錄表單（StrokeRegistryResponse）。同一次給藥的日期、時間與劑量合併在同一筆。來源時間的時區確認前，effectiveDateTime 只填日期，時間原值保存在登錄表單。不同來源的紀錄要先確認是同一次給藥才可合併。"

* status MS
* status ^short = "給藥狀態。[填 completed／not-done／unknown]"
* status ^definition = "來源明確記錄已給藥，填 completed。明確記錄未給藥，填 not-done；未給藥也要有預定給藥時間才建立，沒有時改存登錄表單。有給藥紀錄但無法確認是否完成，填 unknown。來源空白時不建立本資源。"

* medication[x] only CodeableConcept
* medication[x] MS
* medication[x] ^short = "藥品。[IV-tPA 填 iv-tpa-unspecified；其他藥品填藥名]"
* medication[x] ^definition = "只用 CodeableConcept 記錄。IV-tPA 品項未明時，coding 填 StrokeMedicationCS 的 iv-tpa-unspecified。鎮靜藥與動脈內藥物只有藥名時只填 text，原樣保留藥名。coding 與 text 至少填一個。"
* medicationCodeableConcept.coding MS
* medicationCodeableConcept.coding ^slicing.discriminator.type = #pattern
* medicationCodeableConcept.coding ^slicing.discriminator.path = "$this"
* medicationCodeableConcept.coding ^slicing.rules = #open
* medicationCodeableConcept.coding ^slicing.description = "依代碼系統區分 Slice"
* medicationCodeableConcept.coding contains strokeMedication 0..1 MS
* medicationCodeableConcept.coding[strokeMedication] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-medication"
* medicationCodeableConcept.coding[strokeMedication] from StrokeMedicationVS (required)
* medicationCodeableConcept.coding[strokeMedication] ^short = "本 IG 藥品代碼。[IV-tPA 填 iv-tpa-unspecified]"
* medicationCodeableConcept.coding[strokeMedication] ^definition = "填 StrokeMedicationCS 的代碼。IV-tPA 品項未明時填 iv-tpa-unspecified。院方核定藥品主檔後，可另加院內或健保藥品代碼。"
* medicationCodeableConcept.coding[strokeMedication].system 1..1 MS
* medicationCodeableConcept.coding[strokeMedication].code 1..1 MS
* medicationCodeableConcept.text MS
* medicationCodeableConcept.text ^short = "藥品名稱。[只有藥名時填原始藥名]"
* medicationCodeableConcept.text ^definition = "鎮靜藥與動脈內藥物只有名稱時，原樣填入藥名。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"

* context only Reference(StrokeEncounter)
* context MS
* context ^short = "就醫事件。[應參照 StrokeEncounter]"

* effective[x] MS
* effective[x] ^short = "給藥日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "填實際給藥時間；未給藥填預定給藥時間。確認時區前只填日期（YYYY-MM-DD），時間原值用 StrokeEventTimeOnly 擴充附在此元素，並存入 StrokeRegistryResponse 的原始值題目；確認後把同一次給藥的日期與時間合併為 dateTime 並帶時區（例如 +08:00）。只有年月時填 YYYY-MM。只有時間沒有日期時，effectiveDateTime 不填值，改在其 extension 放 StrokeEventTimeOnly。日期與時間都沒有時不建立本資源。"
* effectiveDateTime MS
* effectiveDateTime.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* effectiveDateTime.extension[eventTimeOnly] ^short = "僅有給藥時間（無日期）。[hh:mm:ss]"

* partOf only Reference(StrokeProcedure)
* partOf MS
* partOf ^short = "所屬處置。[EVT 中的給藥參照 StrokeProcedure]"
* partOf ^definition = "EVT 中給予的鎮靜藥，參照該次 EVT 主處置（code 為 evt）。動脈內藥物參照動脈內藥物治療處置（code 為 intra-arterial-drug-therapy）或 EVT 主處置。能確認屬於同一次 EVT 時才填。IV-tPA 不屬於 EVT 處置，不填。"

* note MS
* note ^short = "備註。[無法解析的劑量原文填在此]"
* note ^definition = "劑量無法可靠解析成數值與單位，或該藥劑量單位未經院方核定時，把來源劑量原文填在 note.text，不建立 dosage。"

* dosage MS
* dosage ^short = "劑量。[能解析出劑量時才填]"
* dosage ^definition = "能可靠解析出劑量（dose）或速率（rate），且單位經院方核定時才填。依 mad-1，有 dosage 時 dose 或 rate 至少填一個。無法解析時不建立 dosage，原文改填 note。"
* dosage.text MS
* dosage.text ^short = "劑量原文"
* dosage.text ^definition = "已填 dose 或 rate 時，可在此保留來源劑量原文。"
* dosage.dose MS
* dosage.dose ^short = "給藥劑量。[UCUM 單位；IV-tPA 填 mg]"
* dosage.dose ^definition = "value 填劑量數值，unit 填單位文字，system 固定為 http://unitsofmeasure.org，code 填 UCUM 單位代碼。IV-tPA 以毫克記錄，code 必須填 mg（stroke-medadmin-2）。鎮靜藥與動脈內藥物要在院方已核定該藥的劑量單位，且來源劑量能可靠解析成數值與單位時才填 dose，例如 mg、ug（微克）或 [iU]（國際單位）；否則原文改填 note。"
* dosage.dose.value 1..1 MS
* dosage.dose.unit MS
* dosage.dose.unit ^short = "單位文字。[例如 mg、mcg、IU]"
* dosage.dose.system 1..1 MS
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code 1..1 MS
* dosage.dose.code ^short = "UCUM 單位代碼。[IV-tPA 填 mg]"

* obeys stroke-medadmin-1 and stroke-medadmin-2

Invariant: stroke-medadmin-1
Description: "藥品必須有代碼或名稱文字。"
Severity: #error
Expression: "medication.coding.exists() or medication.text.exists()"

Invariant: stroke-medadmin-2
Description: "IV-tPA（iv-tpa-unspecified）有填 dosage.dose 時，單位必須是 mg。"
Severity: #error
Expression: "medication.coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-medication' and code = 'iv-tpa-unspecified').exists() implies (dosage.dose.empty() or dosage.dose.code = 'mg')"
