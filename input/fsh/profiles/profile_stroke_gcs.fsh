Profile: StrokeGCS
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeGCS
Title: "腦中風－昏迷指數"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現格拉斯哥昏迷指數（GCS）的評估結果。睜眼、語言、動作三項分數以 component 記錄，總分記錄於 valueInteger。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人的 GCS 評估，本 IG 主要用於到院評估。一筆 Observation 代表一次完整評估，睜眼（E）、語言（V）、動作（M）各為一個 component。同一來源、同一病人、同一評估時點只建一筆；不同來源各自建立。三項分數與總分都沒有、且來源未記載缺值原因時，不建立本 Resource，原始值保留在 StrokeRegistryResponse。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[到院評估填 admission]"
* extension[assessmentPhase] ^definition = "本次 GCS 評估的臨床時點。到院評估填 admission；無法確認時點填 unclassified。"

* status MS
* status ^short = "結果狀態。[通常填 final；無法確認時填 unknown]"
* status ^definition = "評估結果狀態。來源確認評估已完成填 final；無法確認填 unknown。"

* category[survey] ^short = "評估類別。[固定為 survey]"

* code = $LOINC#9269-2
* code ^short = "GCS。[固定為 LOINC 9269-2]"
* code ^definition = "固定填 LOINC 9269-2（Glasgow coma score total）。來源沒有總分仍用此代碼，三項分數填入 component。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"
* subject ^definition = "接受評估的病人。"
* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "評估所屬的就醫事件，通常是本次中風的急診或住院。"

* effective[x] ^short = "評估時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "實際評估的日期與時間，通常填 effectiveDateTime，至少要填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並保存在 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間並帶時區（例如 +08:00）。沒有評估日期，或只有時間沒有日期時，省略本元素。"

* value[x] only integer
* value[x] ^short = "GCS 總分。[3–15 的整數]"
* value[x] ^definition = "GCS 總分，填 3 到 15 的整數。只填來源記載的總分；來源沒有總分不填。"
* valueInteger ^minValueInteger = 3
* valueInteger ^maxValueInteger = 15

* dataAbsentReason ^short = "整次評估缺值原因。[來源有記載缺值原因才填]"
* dataAbsentReason ^definition = "沒有總分時用 component 記錄三項分數，不填本元素。三項分數與總分都沒有、且來源明確記載缺值原因才填。"

* component MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "依 component.code 的 LOINC 代碼區分 GCS 三項分數"
* component ^short = "GCS 分項分數"
* component ^definition = "睜眼、語言、動作三項分數各建一個 component。某項沒有有效分數但其他項有時，仍建立該項 component，不填 value，改填 dataAbsentReason。"
* component contains
    eye 0..1 MS and
    verbal 0..1 MS and
    motor 0..1 MS

* component[eye] ^short = "睜眼反應（E）"
* component[eye].code = $LOINC#9267-6
* component[eye].code ^short = "睜眼反應。[固定為 LOINC 9267-6]"
* component[eye].value[x] only integer
* component[eye].value[x] MS
* component[eye].value[x] ^short = "睜眼反應分數。[1–4 的整數]"
* component[eye].value[x] ^definition = "睜眼反應分數，填 1 到 4 的整數。來源為空白、非數值或超出範圍時不填，改填本 component 的 dataAbsentReason。"
* component[eye].valueInteger ^minValueInteger = 1
* component[eye].valueInteger ^maxValueInteger = 4
* component[eye].dataAbsentReason MS
* component[eye].dataAbsentReason ^short = "睜眼反應缺值原因。[來源只知缺值填 unknown]"
* component[eye].dataAbsentReason ^definition = "沒有有效分數時填寫。來源只知缺值、未說明原因填 unknown；來源有定義特殊值意義時，依該意義選擇代碼。"

* component[verbal] ^short = "語言反應（V）"
* component[verbal].code = $LOINC#9270-0
* component[verbal].code ^short = "語言反應。[固定為 LOINC 9270-0]"
* component[verbal].value[x] only integer
* component[verbal].value[x] MS
* component[verbal].value[x] ^short = "語言反應分數。[1–5 的整數]"
* component[verbal].value[x] ^definition = "語言反應分數，填 1 到 5 的整數。來源為空白、非數值或超出範圍時不填，改填本 component 的 dataAbsentReason。"
* component[verbal].valueInteger ^minValueInteger = 1
* component[verbal].valueInteger ^maxValueInteger = 5
* component[verbal].dataAbsentReason MS
* component[verbal].dataAbsentReason ^short = "語言反應缺值原因。[來源只知缺值填 unknown]"
* component[verbal].dataAbsentReason ^definition = "沒有有效分數時填寫。來源只知缺值、未說明原因填 unknown；來源有定義特殊值意義時，依該意義選擇代碼。"

* component[motor] ^short = "動作反應（M）"
* component[motor].code = $LOINC#9268-4
* component[motor].code ^short = "動作反應。[固定為 LOINC 9268-4]"
* component[motor].value[x] only integer
* component[motor].value[x] MS
* component[motor].value[x] ^short = "動作反應分數。[1–6 的整數]"
* component[motor].value[x] ^definition = "動作反應分數，填 1 到 6 的整數。來源為空白、非數值或超出範圍時不填，改填本 component 的 dataAbsentReason。"
* component[motor].valueInteger ^minValueInteger = 1
* component[motor].valueInteger ^maxValueInteger = 6
* component[motor].dataAbsentReason MS
* component[motor].dataAbsentReason ^short = "動作反應缺值原因。[來源只知缺值時填 unknown]"
* component[motor].dataAbsentReason ^definition = "沒有有效分數時填寫。來源只知缺值、未說明原因填 unknown；來源有定義特殊值意義時，依該意義選擇代碼。"
