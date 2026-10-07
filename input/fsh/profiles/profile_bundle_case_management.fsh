Invariant: stroke-cm-bundle-2
Description: "同一包的 fullUrl 全部使用 urn:uuid，或全部與 Patient entry 使用相同的 base 網址，讓包內的相對參照都解析到包內資源。"
Severity: #error
Expression: "entry.fullUrl.all(startsWith('urn:uuid:')) or entry.fullUrl.all(replaceMatches('[A-Za-z]+/[^/]+$', '') = %resource.entry.where(resource is Patient).fullUrl.first().replaceMatches('Patient/[^/]+$', ''))"

Invariant: stroke-cm-bundle-1
Description: "Bundle 內所有資源的 subject 與 patient 都參照本 Bundle 的 Patient entry：參照值等於該 entry 的 fullUrl，或是 fullUrl 結尾的「資源類型/id」。"
Severity: #error
Expression: "(entry.resource.ofType(Observation).subject | entry.resource.ofType(Condition).subject | entry.resource.ofType(Encounter).subject | entry.resource.ofType(QuestionnaireResponse).subject | entry.resource.ofType(MedicationStatement).subject | entry.resource.ofType(MedicationAdministration).subject | entry.resource.ofType(Procedure).subject | entry.resource.ofType(ImagingStudy).subject | entry.resource.ofType(Consent).patient).all(reference = %resource.entry.where(resource is Patient).fullUrl.first() or (reference.startsWith('Patient/') and %resource.entry.where(resource is Patient).fullUrl.first().endsWith('/' + reference)))"

Profile: StrokeCaseManagementBundle
Parent: $TWCoreBundle
Id: StrokeCaseManagementBundle
Title: "腦中風－個管系統個案資料包"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Bundle Resource，以呈現個管系統一個個管事件的完整資料。"
* ^status = #draft
* ^experimental = false
* ^purpose = "一筆代表個管系統的一個個管事件（病歷號＋個管流水序號），收錄該事件轉換產生的所有資源：病人、院所、就醫事件、登錄表單回覆、資料來源追溯，以及診斷、評估、生命徵象、檢驗、用藥、處置與影像檢查。每次匯入一個個管事件的資料時組一包。個管系統、EVT 登錄與 RAPID 各自組包，病人與就醫事件的跨來源對照確認後再合併。"
* obeys stroke-cm-bundle-1 and stroke-cm-bundle-2

* identifier 1..1 MS
* identifier ^short = "個管事件識別碼。[應填入個管流水序號]"
* identifier ^definition = "填入個管流水序號，與本包 StrokeRegistryResponse 的 identifier 相同。個管流水序號搭配病歷號（StrokePatient 的 identifier）識別一個個管事件。"
* identifier.system 1..1 MS
* identifier.system ^short = "識別碼系統。[個管流水序號的系統網址]"
* identifier.system ^definition = "與 StrokeRegistryResponse 的個管流水序號使用同一個系統網址。範例使用 http://www.vghks.gov.tw/stroke-case-management-serial。"
* identifier.value 1..1 MS
* identifier.value ^short = "個管流水序號。[原樣填入，保留前置零]"

* type MS
* type = #collection (exactly)
* type ^short = "Bundle 類型。[固定為 collection]"

* timestamp 1..1 MS
* timestamp ^short = "組包時間。[YYYY-MM-DDThh:mm:ss＋時區，例如 +08:00]"
* timestamp ^definition = "組成本包的時間，精確到秒並帶時區，由組包系統依其時鐘填寫。"

* entry 1..* MS
* entry ^short = "資料包內容。[每個 entry 放一筆資源]"
* entry ^definition = "每個 entry 放一筆本個管事件的資源，只能放下列 Slice 的 Profile。資源之間的參照依各 entry 的 fullUrl 解析。"
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
    organization 0..* MS and
    encounter 0..* MS and
    registryResponse 1..* MS and
    provenance 0..* MS and
    condition 0..* MS and
    admissionContext 0..* MS and
    onsetTime 0..* MS and
    riskFactor 0..* MS and
    clinicalAssessment 0..* MS and
    careProcess 0..* MS and
    complication 0..* MS and
    nihss 0..* MS and
    mrs 0..* MS and
    gcs 0..* MS and
    bodyHeight 0..* MS and
    bodyWeight 0..* MS and
    bodyTemperature 0..* MS and
    heartRate 0..* MS and
    respiratoryRate 0..* MS and
    bloodPressure 0..* MS and
    occupation 0..* MS and
    smokingStatus 0..* MS and
    laboratory 0..* MS and
    procedureResult 0..* MS and
    medicationStatement 0..* MS and
    medicationAdministration 0..* MS and
    procedure 0..* MS and
    imagingStudy 0..* MS

* entry[patient] ^short = "病人。[應填入 StrokePatient，每包一筆]"
* entry[patient] ^definition = "本個管事件的病人。包內其他資源的 subject 與 patient 都參照這一筆。"
* entry[patient].resource only StrokePatient
* entry[organization] ^short = "醫療院所。[應填入 StrokeOrganization]"
* entry[organization] ^definition = "包內資源參照的院所，例如病歷號的核發院所。"
* entry[organization].resource only StrokeOrganization
* entry[encounter] ^short = "就醫事件。[應填入 StrokeEncounter]"
* entry[encounter] ^definition = "本個管事件的急診與住院就醫，各建一筆。"
* entry[encounter].resource only StrokeEncounter
* entry[registryResponse] ^short = "登錄表單回覆。[應填入 StrokeRegistryResponse]"
* entry[registryResponse] ^definition = "本個管事件的個管系統回覆，identifier 與 Bundle 的 identifier 相同。"
// SUSHI 無法解析 QuestionnaireResponse-twcore 上層的 SDC Profile，因此先限定 QuestionnaireResponse，再以 type.profile 指定 StrokeRegistryResponse。
* entry[registryResponse].resource only QuestionnaireResponse
* entry[registryResponse].resource ^type[0].profile[0] = Canonical(StrokeRegistryResponse)
* entry[provenance] ^short = "資料來源追溯。[應填入 StrokeProvenance]"
* entry[provenance] ^definition = "本次匯入的追溯紀錄，target 參照本包的資源。"
* entry[provenance].resource only StrokeProvenance
* entry[condition] ^short = "中風診斷。[應填入 StrokeCondition]"
* entry[condition].resource only StrokeCondition
* entry[admissionContext] ^short = "就醫背景。[應填入 StrokeAdmissionContext]"
* entry[admissionContext].resource only StrokeAdmissionContext
* entry[onsetTime] ^short = "發病時間。[應填入 StrokeOnsetTime]"
* entry[onsetTime].resource only StrokeOnsetTime
* entry[riskFactor] ^short = "危險因子與病史。[應填入 StrokeRiskFactor]"
* entry[riskFactor].resource only StrokeRiskFactor
* entry[clinicalAssessment] ^short = "中風分類評估。[應填入 StrokeClinicalAssessment]"
* entry[clinicalAssessment].resource only StrokeClinicalAssessment
* entry[careProcess] ^short = "照護流程紀錄。[應填入 StrokeCareProcess]"
* entry[careProcess].resource only StrokeCareProcess
* entry[complication] ^short = "住院併發症與惡化。[應填入 StrokeComplication]"
* entry[complication].resource only StrokeComplication
* entry[nihss] ^short = "NIHSS 評估。[應填入 StrokeNIHSS]"
* entry[nihss].resource only StrokeNIHSS
* entry[mrs] ^short = "mRS 評估。[應填入 StrokeMRS]"
* entry[mrs].resource only StrokeMRS
* entry[gcs] ^short = "昏迷指數。[應填入 StrokeGCS]"
* entry[gcs].resource only StrokeGCS
* entry[bodyHeight] ^short = "身高。[應填入 StrokeBodyHeight]"
* entry[bodyHeight].resource only StrokeBodyHeight
* entry[bodyWeight] ^short = "體重。[應填入 StrokeBodyWeight]"
* entry[bodyWeight].resource only StrokeBodyWeight
* entry[bodyTemperature] ^short = "體溫。[應填入 StrokeBodyTemperature]"
* entry[bodyTemperature].resource only StrokeBodyTemperature
* entry[heartRate] ^short = "心率。[應填入 StrokeHeartRate]"
* entry[heartRate].resource only StrokeHeartRate
* entry[respiratoryRate] ^short = "呼吸速率。[應填入 StrokeRespiratoryRate]"
* entry[respiratoryRate].resource only StrokeRespiratoryRate
* entry[bloodPressure] ^short = "血壓。[應填入 StrokeBloodPressure]"
* entry[bloodPressure].resource only StrokeBloodPressure
* entry[occupation] ^short = "職業。[應填入 StrokeOccupation]"
* entry[occupation].resource only StrokeOccupation
* entry[smokingStatus] ^short = "吸菸狀態。[應填入 StrokeSmokingStatus]"
* entry[smokingStatus].resource only StrokeSmokingStatus
* entry[laboratory] ^short = "檢驗結果。[應填入 StrokeLaboratory]"
* entry[laboratory].resource only StrokeLaboratory
* entry[procedureResult] ^short = "處置時點結果。[應填入 StrokeProcedureResult]"
* entry[procedureResult].resource only StrokeProcedureResult
* entry[medicationStatement] ^short = "用藥紀錄。[應填入 StrokeMedicationStatement]"
* entry[medicationStatement].resource only StrokeMedicationStatement
* entry[medicationAdministration] ^short = "給藥紀錄。[應填入 StrokeMedicationAdministration]"
* entry[medicationAdministration].resource only StrokeMedicationAdministration
* entry[procedure] ^short = "醫療處置。[應填入 StrokeProcedure]"
* entry[procedure].resource only StrokeProcedure
* entry[imagingStudy] ^short = "影像檢查。[應填入 StrokeImagingStudy]"
* entry[imagingStudy].resource only StrokeImagingStudy
