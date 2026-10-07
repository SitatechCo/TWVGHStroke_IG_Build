Profile: StrokeProvenance
Parent: $TWCoreProvenance
Id: StrokeProvenance
Title: "腦中風－資料來源追溯"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Provenance Resource，以呈現腦中風登錄資料的匯入來源、登錄經手人員與來源時戳。"
* ^status = #draft
* ^purpose = "每次匯入、每個來源資料版本各建一筆 Provenance。target 列出本次匯入建立或更新的資源，recorded 記 FHIR 資料產生或匯入時間，來源紀錄原有的時戳放 occurredDateTime。"

* target MS
* target ^short = "被追溯的資源。[應參照本次匯入建立或更新的資源]"

* recorded MS
* recorded ^short = "匯入時間。[YYYY-MM-DDThh:mm:ss＋時區，例如 +08:00]"
* recorded ^definition = "FHIR 資料產生或匯入時間，須精確到秒並帶時區。由匯入系統產生，時區依匯入系統的時鐘填寫。"

* occurred[x] MS
* occurred[x] only dateTime
* occurred[x] ^short = "來源時戳。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* occurred[x] ^definition = "來源紀錄的日期時間，例如資料登錄時間。院方確認時戳意義前先不填，原值存入登錄表單（StrokeRegistryResponse）。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並存入 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間與時區（例如 +08:00）。"

* agent MS
* agent ^short = "參與者。[至少一位]"
* agent contains enterer 0..* MS
* agent[enterer] ^short = "登錄經手人員"
* agent[enterer] ^definition = "將資料登錄到來源系統的人員。"
* agent[enterer].type 1..1 MS
* agent[enterer].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#enterer
* agent[enterer].type ^short = "參與者類型。[固定填 enterer]"
* agent[enterer].who MS
* agent[enterer].who only Reference(StrokePractitioner)
* agent[enterer].who ^short = "登錄經手人員。[有人員主檔時參照 StrokePractitioner；只有姓名時只填 display]"
* agent[enterer].who ^definition = "人員已在院所人員主檔核定時，reference 參照 StrokePractitioner，並在 onBehalfOf 填所屬院所（父層規則 provenance-1）。來源只有姓名時只填 display，不建 Practitioner。"
* agent[enterer].onBehalfOf MS
* agent[enterer].onBehalfOf only Reference(StrokeOrganization)
* agent[enterer].onBehalfOf ^short = "所屬院所。[who 參照 StrokePractitioner 時必填，參照 StrokeOrganization]"

* entity MS
* entity ^short = "來源紀錄"
* entity ^definition = "本次匯入所依據的來源紀錄。"
* entity.role MS
* entity.role ^short = "來源角色。[應填入 source]"
* entity.what MS
* entity.what ^short = "來源紀錄。[以 identifier 或 display 指出來源紀錄]"
* entity.what ^definition = "來源紀錄若無 FHIR 資源，以 identifier 填來源紀錄識別碼，或以 display 填來源說明。"
