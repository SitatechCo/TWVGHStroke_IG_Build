Profile: StrokeOrganization
Parent: $TWCoreOrganization
Id: StrokeOrganization
Title: "腦中風－醫療院所"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Organization Resource，以呈現登錄資料所屬的醫療院所，包含院所名稱與本地院所代號。"
* ^status = #draft
* ^purpose = "記錄登錄醫院。每間院所建立一筆，供 Patient.managingOrganization 與 Encounter.serviceProvider 等元素參照。取得健保醫事機構代碼前，不宣告 TW Core 醫院 Profile。"

* identifier MS
* identifier ^short = "院所識別碼。[填本地院所代號]"
* identifier ^definition = "填入來源資料使用的本地院所代號（例如 1A0），並放在本地院所代號系統下。名稱與識別碼至少填一項（符合 FHIR 規則 org-1）。"
* identifier.system 1..1 MS
* identifier.system ^short = "院所代號系統。[填本地院所代號的系統網址]"
* identifier.system ^definition = "本地院所代號所屬的命名系統網址，同一來源固定使用同一網址。"
* identifier.value 1..1 MS
* identifier.value ^short = "院所代號。[填本地院所代號，例如 1A0]"

* name MS
* name ^short = "院所名稱。[填院所全名]"
* name ^definition = "填寫院所的正式全名，例如高雄榮民總醫院。名稱與代號對照以院所主檔為準。"
