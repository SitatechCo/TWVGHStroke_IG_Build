Profile: StrokePatient
Parent: $TWCorePatient
Id: StrokePatient
Title: "腦中風－病人基本資料"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Patient Resource，以呈現腦中風病人的基本資料，包含病歷號、性別、出生年月與死亡日期。"
* ^status = #draft
* ^purpose = "記錄腦中風登錄病人的識別與基本資料。每間院所的每個病歷號各建立一筆 Patient。跨院串接同一病人須經院方核定。Patient.id 由匯入系統產生。"

* identifier ^short = "病人識別碼。[至少填入病歷號]"
* identifier[medicalRecord] 1..1 MS
* identifier[medicalRecord] ^short = "病歷號。[填院內病歷號]"
* identifier[medicalRecord] ^definition = "病人在院所的病歷號，必填，且只放在此處。"
* identifier[medicalRecord].use MS
* identifier[medicalRecord].use ^short = "識別碼用途。[固定填 official]"
* identifier[medicalRecord].type MS
* identifier[medicalRecord].type ^short = "識別碼類型。[固定填 v2-0203 的 MR]"
* identifier[medicalRecord].system 1..1 MS
* identifier[medicalRecord].system ^short = "病歷號系統。[填院所核發病歷號的系統網址]"
* identifier[medicalRecord].system ^definition = "核發病歷號的院所命名系統網址，同一院所固定使用同一個網址。範例使用 http://www.vghks.gov.tw/patient-id。"
* identifier[medicalRecord].value 1..1 MS
* identifier[medicalRecord].value ^short = "病歷號。[填院內病歷號，保留原樣]"
* identifier[medicalRecord].value ^definition = "病歷號依來源原樣填入。"
* identifier[medicalRecord].assigner MS
* identifier[medicalRecord].assigner only Reference(StrokeOrganization)
* identifier[medicalRecord].assigner ^short = "核發病歷號的院所。[應參照 StrokeOrganization]"

* gender MS
* gender ^short = "性別。[填 male、female 或 unknown]"
* gender ^definition = "男性填 male，女性填 female，無法判斷填 unknown。來源未提供性別時，gender 不填值，改在 gender 加上 data-absent-reason 擴充，valueCode 填 unknown。"

* birthDate MS
* birthDate obeys stroke-patient-1
* birthDate ^short = "出生年月。[YYYY-MM，西元年月，不填日]"
* birthDate ^definition = "填西元出生年月，格式 YYYY-MM，例如 1950-01。只知道出生年填 YYYY。來源未提供時，birthDate 不填值，改在 birthDate 加上 data-absent-reason 擴充，valueCode 填 unknown。"

* deceased[x] MS
* deceased[x] ^short = "死亡日期。[YYYY-MM-DD，西元年月日]"
* deceased[x] ^definition = "有死亡日期填 deceasedDateTime，格式 YYYY-MM-DD，可為住院期間死亡或追蹤得知的死亡日期。不同來源的死亡日期不一致時，人工核對後再填。只知道已死亡但無日期填 deceasedBoolean = true。未死亡或不知道不填。"

* managingOrganization MS
* managingOrganization only Reference(StrokeOrganization)
* managingOrganization ^short = "管理病人資料的院所。[應參照 StrokeOrganization]"

Invariant: stroke-patient-1
Description: "出生日期只填到年月（YYYY-MM）或年（YYYY）。"
Severity: #error
Expression: "hasValue() implies toString().matches('^[0-9]{4}(-[0-9]{2})?$')"
