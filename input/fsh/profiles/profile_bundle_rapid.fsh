Invariant: stroke-rapid-bundle-2
Description: "同一包的 fullUrl 全部使用 urn:uuid，或全部與 Patient entry 使用相同的 base 網址，讓包內的相對參照都解析到包內資源。"
Severity: #error
Expression: "entry.fullUrl.all(startsWith('urn:uuid:')) or entry.fullUrl.all(replaceMatches('[A-Za-z]+/[^/]+$', '') = %resource.entry.where(resource is Patient).fullUrl.first().replaceMatches('Patient/[^/]+$', ''))"

Invariant: stroke-rapid-bundle-1
Description: "Bundle 內所有資源的 subject 與 patient 都參照本 Bundle 的 Patient entry：參照值等於該 entry 的 fullUrl，或是 fullUrl 結尾的「資源類型/id」。"
Severity: #error
Expression: "(entry.resource.ofType(Observation).subject | entry.resource.ofType(Condition).subject | entry.resource.ofType(Encounter).subject | entry.resource.ofType(QuestionnaireResponse).subject | entry.resource.ofType(MedicationStatement).subject | entry.resource.ofType(MedicationAdministration).subject | entry.resource.ofType(Procedure).subject | entry.resource.ofType(ImagingStudy).subject | entry.resource.ofType(Consent).patient).all(reference = %resource.entry.where(resource is Patient).fullUrl.first() or (reference.startsWith('Patient/') and %resource.entry.where(resource is Patient).fullUrl.first().endsWith('/' + reference)))"

Profile: StrokeRapidBundle
Parent: $TWCoreBundle
Id: StrokeRapidBundle
Title: "腦中風－RAPID 影像分析資料包"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Bundle Resource，以呈現一次 RAPID 影像分析掃描的完整資料。"
* ^status = #draft
* ^experimental = false
* ^purpose = "一筆代表一次 RAPID 掃描（病歷號＋申請序號＋掃描類型＋醫院代號），收錄病人、醫院、登錄表單回覆、資料來源追溯、影像檢查與影像判讀結果。每次匯入一筆 RAPID 分析資料時組一包。個管系統、EVT 登錄與 RAPID 各自組包，病人與就醫事件的跨來源對照確認後再合併。"
* obeys stroke-rapid-bundle-1 and stroke-rapid-bundle-2

* identifier 1..1 MS
* identifier ^short = "RAPID 掃描紀錄鍵。[應填入醫院代號|病歷號|申請序號|掃描類型]"
* identifier ^definition = "RAPID 掃描紀錄的識別碼，由 RAPID 的主鍵組成：醫院代號、病歷號、申請序號與掃描類型，以「|」串接，例如 1A0|EX00000001|REQ-EXAMPLE-0001|CTP。四個值都原樣填入，保留前置零。以 token 搜尋時，value 內每個「|」前須加一個反斜線，寫成 `\\|`。"
* identifier.system 1..1 MS
* identifier.system ^short = "識別碼系統。[RAPID 掃描紀錄鍵的系統網址]"
* identifier.system ^definition = "RAPID 掃描紀錄鍵固定使用一個系統網址。範例使用 http://www.vghks.gov.tw/rapid-record-key。"
* identifier.value 1..1 MS
* identifier.value ^short = "掃描紀錄鍵。[醫院代號|病歷號|申請序號|掃描類型]"

* type MS
* type = #collection (exactly)
* type ^short = "Bundle 類型。[固定為 collection]"

* timestamp 1..1 MS
* timestamp ^short = "組包時間。[YYYY-MM-DDThh:mm:ss＋時區，例如 +08:00]"
* timestamp ^definition = "組成本包的時間，精確到秒並帶時區，由組包系統依其時鐘填寫。"

* entry 1..* MS
* entry ^short = "資料包內容。[每個 entry 放一筆資源]"
* entry ^definition = "每個 entry 放一筆本次掃描的資源，只能放下列 Slice 的 Profile。資源之間的參照依各 entry 的 fullUrl 解析。"
* entry.fullUrl 1..1 MS
* entry.fullUrl ^short = "資源完整網址。[base 網址加上「資源類型/id」，或 urn:uuid]"
* entry.fullUrl ^definition = "填 RESTful 網址時，結尾的「資源類型/id」須與 resource 的類型及 id 相同；填 urn:uuid 時，其他資源以同一個 urn:uuid 參照本資源。同一包的 fullUrl 全部使用 urn:uuid，或全部與 Patient entry 使用相同的 base 網址，讓包內的相對參照都解析到包內資源。"
* entry.resource 1..1 MS
* entry.resource ^short = "資源。[應填入下列 Slice 的 Profile]"
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.ordered = false
* entry ^slicing.description = "依 resource 符合的 Profile 區分"
* entry contains
    patient 1..1 MS and
    organization 0..1 MS and
    registryResponse 1..1 MS and
    provenance 0..1 MS and
    imagingStudy 0..1 MS and
    imagingResult 0..* MS

* entry[patient] ^short = "病人。[應填入 StrokePatient，每包一筆]"
* entry[patient] ^definition = "本次掃描的病人。包內其他資源的 subject 都參照這一筆。"
* entry[patient].resource only StrokePatient
* entry[organization] ^short = "醫院。[應填入 StrokeOrganization]"
* entry[organization] ^definition = "以 RAPID 醫院代號識別的院所。"
* entry[organization].resource only StrokeOrganization
* entry[registryResponse] ^short = "登錄表單回覆。[應填入 StrokeRegistryResponse，每包一筆]"
* entry[registryResponse] ^definition = "本次掃描的 RAPID 回覆，以原始值群組保存來源原值。"
// SUSHI 無法解析 QuestionnaireResponse-twcore 上層的 SDC Profile，因此先限定 QuestionnaireResponse，再以 type.profile 指定 StrokeRegistryResponse。
* entry[registryResponse].resource only QuestionnaireResponse
* entry[registryResponse].resource ^type[0].profile[0] = Canonical(StrokeRegistryResponse)
* entry[provenance] ^short = "資料來源追溯。[應填入 StrokeProvenance]"
* entry[provenance] ^definition = "本次匯入的追溯紀錄，target 參照本包的資源。"
* entry[provenance].resource only StrokeProvenance
* entry[imagingStudy] ^short = "影像檢查。[應填入 StrokeImagingStudy]"
* entry[imagingStudy] ^definition = "本次分析的掃描，procedureCode 的 rapidScanType Slice 填掃描類型。"
* entry[imagingStudy].resource only StrokeImagingStudy
* entry[imagingResult] ^short = "影像判讀結果。[應填入 StrokeImagingResult]"
* entry[imagingResult] ^definition = "本次分析的各項結果，例如 ASPECTS、灌流體積與 mismatch 比值，每個項目一筆。有影像檢查 entry 時，derivedFrom 參照該筆。"
* entry[imagingResult].resource only StrokeImagingResult
