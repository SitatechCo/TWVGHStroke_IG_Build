Profile: StrokeBodyTemperature
Parent: $TWCoreObservationBodyTemperature
Id: StrokeBodyTemperature
Title: "腦中風－體溫"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人到院時測得的體溫。代碼沿用 TW Core 生命徵象 Profile 的規定，單位限用 Cel。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人到院時測得的體溫。一筆 Observation 代表一次測量。同一來源、同一病人、同一測量時間（依來源記錄的日期與時間判定，包含時區確認前只保存在原始值題目或 StrokeEventTimeOnly 的時間）只建立一筆；不同來源各自建立。若沒有實際測量時間、單位未確認，或數值意義待確認，不建立本 Resource，原始值保留在 StrokeRegistryResponse。"

* status MS
* status ^short = "結果狀態。[通常填 final；無法確認時填 unknown]"
* status ^definition = "測量結果的狀態。來源可確認測量已完成時填 final；無法確認時填 unknown。"

* category[VSCat] ^short = "生命徵象類別。[固定為 vital-signs]"

* code ^short = "體溫。[固定為 LOINC 8310-5]"
* code ^definition = "沿用 TW Core 固定代碼 LOINC 8310-5（Body temperature）。code.coding 只能有這一個代碼。"

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
* effective[x] ^definition = "實際測量體溫的日期與時間，通常填 effectiveDateTime，至少要填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並保存在 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間並帶時區（例如 +08:00）。沒有測量時間，或只有時間沒有日期時，不建立本 Observation。"

* valueQuantity ^short = "體溫數值。[單位 Cel]"
* valueQuantity ^definition = "體溫，單位為攝氏度（°C）。system 固定為 http://unitsofmeasure.org，code 固定為 Cel。來源單位不是攝氏度（°C）且換算方式未確認時，不建立本 Observation。"
* valueQuantity.value ^short = "體溫數值。[例如 36.8]"
* valueQuantity.unit ^short = "單位顯示文字。[填 °C]"
* valueQuantity.code = #Cel
* valueQuantity.code ^short = "UCUM 單位代碼。[固定為 Cel]"

* dataAbsentReason ^short = "缺值原因。[來源有記載缺值原因才填]"
* dataAbsentReason ^definition = "沒有數值且來源明確記載缺值原因才填。若來源只是空白，不建立本 Observation。"
