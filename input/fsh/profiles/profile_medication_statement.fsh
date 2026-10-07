Profile: StrokeMedicationStatement
Parent: $TWCoreMedicationStatement
Id: StrokeMedicationStatement
Title: "腦中風－用藥紀錄"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 MedicationStatement Resource，以呈現腦中風病人在住院前、住院中、離院時及 EVT 後 24 小時內，是否使用特定藥品或藥物類別。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人在特定用藥時窗是否使用某藥品或藥物類別。每個藥品或藥物類別在各時窗（住院前、住院中、離院時、EVT 後 24 小時內）各建立一筆，以 recordingContext 區分。來源記錄有使用與沒有使用都要建立，來源空白時不建立。同時記錄多個 NOAC 品項時，每個品項各建一筆。同一時窗的類別勾選與品項若為同一個藥品，合併為一筆。本資源只表示是否使用，不記錄處方、劑量或製劑。"

* extension contains StrokeMedicationRecordingContext named recordingContext 1..1 MS
* extension[recordingContext] ^short = "用藥紀錄時窗。[填 pre-admission／inpatient／discharge／first-24h]"
* extension[recordingContext] ^definition = "每筆必填。住院前用藥填 pre-admission，住院中用藥填 inpatient，離院時用藥填 discharge，EVT 後 24 小時內用藥填 first-24h。時窗只表示紀錄出自哪個階段。"

* status MS
* status ^short = "用藥狀態。[填 not-taken／unknown；狀態確認後才填 active／completed]"
* status ^definition = "依來源記錄填寫。來源記錄沒有使用填 not-taken；來源記錄有使用填 unknown，並在 note 填「來源記錄有使用」。確認病人仍在使用才填 active，確認已使用完畢才填 completed。來源空白時不建立本資源。"

* category ^short = "用藥類別。[非必填]"
* category ^definition = "用 recordingContext 記錄用藥時窗。"

* medication[x] MS
* medication[x] ^short = "藥品或藥物類別"
* medication[x] ^definition = "一律用 medicationCodeableConcept 記錄。"
* medicationCodeableConcept MS
* medicationCodeableConcept.coding MS
* medicationCodeableConcept.coding contains strokeMedication 1..1 MS
* medicationCodeableConcept.coding[strokeMedication] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-medication"
* medicationCodeableConcept.coding[strokeMedication] from StrokeMedicationVS (required)
* medicationCodeableConcept.coding[strokeMedication] ^short = "本 IG 藥品或藥物類別代碼。[填 StrokeMedicationVS 代碼]"
* medicationCodeableConcept.coding[strokeMedication] ^definition = "每筆必填一個 StrokeMedicationCS 代碼。來源記錄藥物類別時填類別代碼，例如 anticoagulant（抗凝血藥）、antiplatelet（抗血小板藥）、statin；記錄個別藥品時填藥品代碼，例如 aspirin、clopidogrel、warfarin。記錄 NOAC 品項時，只能填 StrokeNoacVS 的 dabigatran、rivaroxaban、apixaban 或 edoxaban；品項不明則填 noac。記錄 EVT 後 24 小時內（recordingContext 為 first-24h）的抗凝血藥物類別時，只能填 StrokeAnticoagulantDetailVS 的 heparin、noac 或 warfarin；若只記錄有無抗凝血治療而沒有類別，填 anticoagulant。類別與品項合併為一筆時，填最明確的代碼。若已知健保或食藥署藥品代碼，可另依父層 Slice 填入。使用旗標與品項互相矛盾時（例如 NOAC 勾選為 0 卻記有品項），不建立 MedicationStatement，只保留原值。"
* medicationCodeableConcept.coding[strokeMedication].system 1..1 MS
* medicationCodeableConcept.coding[strokeMedication].code 1..1 MS
* medicationCodeableConcept.text MS
* medicationCodeableConcept.text ^short = "藥品名稱文字"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"

* context only Reference(StrokeEncounter)
* context MS
* context ^short = "就醫事件。[應參照 StrokeEncounter]"
* context ^definition = "記錄這筆用藥對應的就醫事件。住院前用藥屬於本次就醫記錄的用藥史，同樣參照本次就醫。"

* effective[x] MS
* effective[x] ^short = "實際用藥日期或期間。[有實際用藥時間才填；填 YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "只填來源明確記錄的用藥時間或期間，沒有實際時間就不填。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並存入 StrokeRegistryResponse 的原始值題目；確認時區後填完整日期時間與時區（例如 +08:00）。期間的 start 與 end 依相同規則填寫。"

* note MS
* note ^short = "備註。[status 為 unknown 時填「來源記錄有使用」]"
* note ^definition = "status 為 unknown 時必填，text 填「來源記錄有使用」，代表來源只記錄曾使用，目前狀態尚未確認。"

* dosage ^short = "劑量。[有實際劑量紀錄才填]"
* dosage ^definition = "本 IG 來源只記錄是否使用，不含劑量。"

* obeys stroke-medstmt-1 and stroke-medstmt-2

Invariant: stroke-medstmt-1
Description: "status 為 unknown 時，必須在 note 說明來源記錄有使用。"
Severity: #error
Expression: "status = 'unknown' implies note.exists()"

Invariant: stroke-medstmt-2
Description: "藥品一律以 medicationCodeableConcept 記錄。"
Severity: #error
Expression: "medication is CodeableConcept"
