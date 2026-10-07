Profile: StrokePractitioner
Parent: $TWCorePractitioner
Id: StrokePractitioner
Title: "腦中風－醫事人員"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Practitioner Resource，以呈現參與腦中風照護或登錄的醫事人員與登錄人員。"
* ^status = #draft
* ^purpose = "記錄已在院所人員主檔核定的人員。來源只有姓名時不建立 Practitioner，改在參照處只填 Reference.display，例如 Provenance.agent.who.display。"

* identifier 1..* MS
* identifier ^short = "人員識別碼。[應填入院所人員主檔的識別碼]"
* identifier ^definition = "必填。填院所人員主檔核定的人員識別碼，例如員工編號；type 可填 v2-0203 的 PRN。有醫事人員證書字號時，可另填父層 medicalLicenseNumber Slice。"
* identifier.system ^short = "識別碼系統。[應填入院所人員主檔的系統網址]"
* identifier.value ^short = "人員識別碼。[應填入員工編號或證書字號]"

* name 1..* MS
* name ^short = "姓名。[應填入人員姓名]"
* name ^definition = "人員姓名。至少填 text（全名）或 family（姓）。"
