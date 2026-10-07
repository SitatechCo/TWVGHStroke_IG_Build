Profile: StrokeProcedure
Parent: $TWCoreProcedure
Id: StrokeProcedure
Title: "腦中風－醫療處置"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Procedure Resource，以呈現腦中風病人接受的 EVT 主處置與子術式、動脈穿刺、腦部手術及住院期間處置。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每個處置各建一筆，以 code 區分處置種類。每次 EVT 建一筆主處置（code 為 evt）；動脈穿刺、支架取栓、抽吸取栓、置放支架、球囊血管成形術與動脈內藥物治療等子術式各建一筆，以 partOf 參照主處置。腦部手術與住院期間處置（例如留置鼻胃管、吞嚥篩檢、中風衛教）也各建一筆。來源明確記錄已執行或未執行才建立；來源空白不建立。"

* status MS
* status ^short = "執行狀態。[應填入 completed／not-done]"
* status ^definition = "來源明確記錄已執行填 completed，明確記錄未執行填 not-done。此規則僅用於記錄處置是否執行的項目。來源空白時不建立本資源。"

* code MS
* code ^short = "處置項目"
* code ^definition = "以 strokeProcedure Slice 填本 IG 處置代碼。有對應的 SNOMED CT 代碼時，另於父層 sct-procedures Slice 填入：evt 與 ia-thrombectomy 填 439541007，urinary-catheter-insertion 填 446583004，rehabilitation 填 2517002，mechanical-ventilation 填 40617009，nasogastric-tube-insertion 填 87750000，dysphagia-screening 填 431765005，stroke-education 填 720849008，decompressive-craniectomy 填 1288015005，external-ventricular-drainage 填 230869001，ventriculoperitoneal-shunt 填 47020004。其餘處置目前沒有精確對應的 SNOMED CT 代碼，只填本 IG 代碼。"
* code.coding MS
* code.coding contains strokeProcedure 1..1 MS
* code.coding[strokeProcedure] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-procedure"
* code.coding[strokeProcedure] from StrokeProcedureVS (required)
* code.coding[strokeProcedure] ^short = "本 IG 處置代碼。[應填入 StrokeProcedureVS 的代碼]"
* code.coding[strokeProcedure] ^definition = "每筆必填一個代碼。EVT 主處置填 evt。EVT 子術式填 evt-puncture（動脈穿刺）、stent-retriever-thrombectomy（支架取栓）、aspiration-thrombectomy（抽吸取栓）、stent-placement（置放支架）、balloon-angioplasty（球囊血管成形術）或 intra-arterial-drug-therapy（動脈內藥物治療）。腦部手術填 decompressive-craniectomy、hematoma-evacuation、external-ventricular-drainage、ventriculoperitoneal-shunt 或 other-surgery。住院期間處置填 ia-thrombectomy、urinary-catheter-insertion、rehabilitation、mechanical-ventilation、nasogastric-tube-insertion、dysphagia-screening、smoking-cessation-counseling、stroke-education 或 surgical-treatment。"
* code.coding[strokeProcedure].system 1..1 MS
* code.coding[strokeProcedure].code 1..1 MS
* code.text MS
* code.text ^short = "處置名稱。[其他手術填入術式名稱]"
* code.text ^definition = "code 為 other-surgery 時，填來源記錄的術式名稱。執行狀態以 status 記錄。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"

* performed[x] only dateTime or Period
* performed[x] MS
* performed[x] ^short = "執行日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* performed[x] ^definition = "填實際執行時間，動脈穿刺填穿刺時間。首次再通、最終再通與再灌流時間記錄在 StrokeProcedureResult。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在該元素，並存入 StrokeRegistryResponse 的原始值題目；確認後將同次處置的日期與時間合併為 performedDateTime，並帶時區（例如 +08:00）。只有年月填 YYYY-MM。有開始與結束時間可填 performedPeriod，start 與 end 依相同規則填寫。只有時間沒有日期時，performedDateTime 不填值，改在其 extension 放 StrokeEventTimeOnly。沒有執行時間不填。"
* performedDateTime.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* performedDateTime.extension[eventTimeOnly] ^short = "僅有執行時間（無日期）。[hh:mm:ss]"

* partOf only Reference(StrokeProcedure)
* partOf MS
* partOf ^short = "所屬主處置。[EVT 子術式參照 EVT 主處置]"
* partOf ^definition = "EVT 子術式參照同次 EVT 的主處置（code 為 evt）。能確認屬於同一次 EVT 才填。"

* bodySite MS
* bodySite obeys stroke-procedure-1
* bodySite ^short = "穿刺部位。[動脈穿刺填入本 IG 穿刺部位代碼與對應的 SNOMED CT 部位代碼]"
* bodySite ^definition = "只用於動脈穿刺（code 為 evt-puncture）。在 punctureSite Slice 填本 IG 穿刺部位代碼，並依下列對照另加一個 SNOMED CT coding（system 為 http://snomed.info/sct）：1（腹股溝）填 26893007（Inguinal region structure）；2（手腕）填 8205005（Wrist region structure）；3（手肘）填 127949000（Elbow region structure）。4（其他）沒有對應的 SNOMED CT 代碼，只在 text 填部位說明。"
* bodySite.coding MS
* bodySite.coding ^slicing.discriminator.type = #pattern
* bodySite.coding ^slicing.discriminator.path = "$this"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding ^slicing.description = "依代碼系統區分 Slice"
* bodySite.coding contains punctureSite 0..1 MS
* bodySite.coding[punctureSite] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/puncture-site"
* bodySite.coding[punctureSite] from StrokePunctureSiteVS (required)
* bodySite.coding[punctureSite] ^short = "本 IG 穿刺部位代碼。[應填入 1／2／3／4]"
* bodySite.coding[punctureSite] ^definition = "填來源穿刺部位代碼：1 腹股溝、2 手腕、3 手肘、4 其他。代碼 1 到 3 必須同時另加 SNOMED CT coding（stroke-procedure-1）：1 填 26893007，2 填 8205005，3 填 127949000。代碼 4 沒有對應的 SNOMED CT 代碼，只在 text 補充部位說明。"
* bodySite.coding[punctureSite].system 1..1 MS
* bodySite.coding[punctureSite].code 1..1 MS
* bodySite.text MS
* bodySite.text ^short = "穿刺部位文字。[可填部位名稱]"
* bodySite.text ^definition = "可填穿刺部位名稱，例如「腹股溝」。代碼為 4（其他）時填部位說明；來源沒有說明時填「其他」。"

Invariant: stroke-procedure-1
Description: "穿刺部位代碼為 1、2、3 時，必須同時填對應的 SNOMED CT 部位代碼：1 為 26893007，2 為 8205005，3 為 127949000。"
Severity: #error
Expression: "(coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/puncture-site' and code = '1').exists() implies coding.where(system = 'http://snomed.info/sct' and code = '26893007').exists()) and (coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/puncture-site' and code = '2').exists() implies coding.where(system = 'http://snomed.info/sct' and code = '8205005').exists()) and (coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/puncture-site' and code = '3').exists() implies coding.where(system = 'http://snomed.info/sct' and code = '127949000').exists())"
