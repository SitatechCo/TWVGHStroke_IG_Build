Profile: StrokeBodyHeight
Parent: $TWCoreObservationBodyHeight
Id: StrokeBodyHeight
Title: "腦中風－身高"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人到院時測得的身高。代碼沿用 TW Core 生命徵象 Profile 的規定，單位限用 cm。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人到院時測得的身高。一筆 Observation 代表一次測量。同一來源、同一病人、同一測量時間（依來源記錄的日期與時間判定，包含時區確認前只保存在原始值題目或 StrokeEventTimeOnly 的時間）只建立一筆；不同來源各自建立。若沒有實際測量時間、單位未確認，或數值意義待確認，不建立本 Resource，原始值保留在 StrokeRegistryResponse。"

* status MS
* status ^short = "結果狀態。[通常填 final；無法確認時填 unknown]"
* status ^definition = "測量結果的狀態。來源可確認測量已完成時填 final；無法確認時填 unknown。"

* category[VSCat] ^short = "生命徵象類別。[固定為 vital-signs]"

* code ^short = "身高。[固定為 LOINC 8302-2]"
* code ^definition = "沿用 TW Core 固定代碼 LOINC 8302-2（Body height）。code.coding 只能有這一個代碼。"

* subject only Reference(StrokePatient)
* subject MS
* subject ^short = "病人。[應參照 StrokePatient]"
* subject ^definition = "接受測量的病人。"
* encounter only Reference(StrokeEncounter)
* encounter MS
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "測量所屬的就醫事件，通常是本次中風的急診或住院。"

* effective[x] MS
* effective[x] ^short = "測量時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "實際測量身高的日期與時間，通常填 effectiveDateTime，至少要填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並保存在 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間並帶時區（例如 +08:00）。沒有測量時間，或只有時間沒有日期時，不建立本 Observation。"

* valueQuantity ^short = "身高數值。[單位 cm]"
* valueQuantity ^definition = "身高，單位為公分。system 固定為 http://unitsofmeasure.org，code 固定為 cm。來源單位不是公分且換算方式未確認時，不建立本 Observation。來源值為 999.9 或 0 時，意義確認前不建立本 Observation。"
* valueQuantity.value ^short = "身高數值。[例如 165.5]"
* valueQuantity.unit ^short = "單位顯示文字。[填 cm]"
* valueQuantity.code = #cm
* valueQuantity.code ^short = "UCUM 單位代碼。[固定為 cm]"

* dataAbsentReason ^short = "缺值原因。[來源有記載缺值原因才填]"
* dataAbsentReason ^definition = "沒有數值且來源明確記載缺值原因才填。若來源只是空白，不建立本 Observation。"
