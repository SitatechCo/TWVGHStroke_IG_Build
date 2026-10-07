Profile: StrokeOccupation
Parent: $TWCoreObservationOccupation
Id: StrokeOccupation
Title: "腦中風－職業"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人的職業類別。職業類別以本 IG 的職業類別代碼記錄。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人的職業類別。一筆 Observation 代表單一來源在一次個管事件（評估時點）所記的職業類別。每個來源、病人與個管事件各建一筆，只對同一事件的重複資料去重。不同事件各自保留紀錄（例如前次在職、本次退休），以留存職業歷程。來源若無職業代碼或無法辨識，不建立本 Resource，原始值保留在 StrokeRegistryResponse。"

* status MS
* status ^short = "結果狀態。[通常填 final；無法確認時填 unknown]"
* status ^definition = "職業紀錄的狀態。來源可確認資料已完成填 final，無法確認填 unknown。"

* category 1..*
* category[twcore] 1..1 MS
* category[twcore] ^short = "社會史類別。[固定為 social-history]"
* category[twcore] ^definition = "填 http://terminology.hl7.org/CodeSystem/observation-category 的 social-history。"

* code ^short = "職業史。[固定為 LOINC 11341-5]"
* code ^definition = "沿用 TW Core 的固定代碼 LOINC 11341-5（History of Occupation）。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"
* subject ^definition = "此筆職業資料所屬的病人。"
* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "登錄職業資料所屬的就醫事件，通常為本次中風的急診或住院，用以區分不同個管事件的職業紀錄。"

* effective[x] ^short = "從事此職業的期間。[來源未記載時省略]"
* effective[x] ^definition = "病人從事此職業的期間填 effectivePeriod，日期格式為 YYYY-MM-DD；來源未記載時省略此元素。"

* valueCodeableConcept ^short = "職業類別。[應填入 StrokeOccupationCategoryVS 的代碼]"
* valueCodeableConcept ^definition = "填本 IG 職業類別代碼：OCP00 無、OCP01 軍、OCP02 公、OCP03 教、OCP04 工、OCP05 農、OCP06 商、OCP07 服務業、OCP08 學生、OCP09 退休、OCP99 其他。OCP99 代表不屬於上述類別。代碼無法辨識時不建立本 Observation；此分類與 TW Core 職業代碼沒有一對一對照。"
* valueCodeableConcept.coding contains occupationCategory 1..1 MS
* valueCodeableConcept.coding[occupationCategory] from StrokeOccupationCategoryVS (required)
* valueCodeableConcept.coding[occupationCategory] ^short = "本 IG 職業類別代碼。[OCP00–OCP09、OCP99]"
* valueCodeableConcept.coding[occupationCategory] ^definition = "保留來源的職業類別代碼與名稱，例如 OCP09（退休）。"
* valueCodeableConcept.coding[occupationCategory].system 1..1 MS
* valueCodeableConcept.coding[occupationCategory].system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/occupation-category"
* valueCodeableConcept.coding[occupationCategory].system ^short = "代碼系統。[固定為 StrokeOccupationCategoryCS]"
* valueCodeableConcept.coding[occupationCategory].code 1..1 MS
* valueCodeableConcept.coding[occupationCategory].code ^short = "職業類別代碼。[例如 OCP09]"
* valueCodeableConcept.coding[occupationCategory].display MS
* valueCodeableConcept.coding[occupationCategory].display ^short = "職業類別名稱。[例如 退休]"
* valueCodeableConcept.coding[LiaRocOccupation] ^short = "壽險公會職業代碼。[院方核定對照後才填]"
* valueCodeableConcept.coding[LiaRocOccupation] ^definition = "臺灣壽險公會傷害保險個人職業分類代碼。本 IG 職業類別與此分類沒有一對一對照，院方核定對照前不填。"
* valueCodeableConcept.coding[MolOccupation] ^short = "勞動部職業代碼。[院方核定對照後才填]"
* valueCodeableConcept.coding[MolOccupation] ^definition = "臺灣勞動部職業標準分類代碼。本 IG 職業類別與此分類沒有一對一對照，院方核定對照前不填。"
* valueCodeableConcept.text MS
* valueCodeableConcept.text ^short = "職業類別文字。[可填職業類別名稱]"
