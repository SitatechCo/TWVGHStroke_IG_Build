Profile: StrokeBloodPressure
Parent: $TWCoreObservationBloodPressure
Id: StrokeBloodPressure
Title: "腦中風－血壓"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人到院時測得的血壓。代碼與單位沿用 TW Core 生命徵象 Profile 的規定，收縮壓與舒張壓放在同一筆 Observation 的兩個 component。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄病人到院時測得的收縮壓與舒張壓。一筆 Observation 代表一次血壓測量。同一來源、同一病人、同一測量時間（依來源記錄的日期與時間判定，包含時區確認前只保存在原始值題目或 StrokeEventTimeOnly 的時間）只建立一筆；不同來源各自建立。若收縮壓與舒張壓都沒有數值、沒有實際測量時間，或單位未確認，不建立本 Resource，原始值保留在 StrokeRegistryResponse。"

* status MS
* status ^short = "結果狀態。[通常填 final；無法確認時填 unknown]"
* status ^definition = "測量結果的狀態。來源可確認測量已完成時填 final；無法確認時填 unknown。"

* category[VSCat] ^short = "生命徵象類別。[固定為 vital-signs]"

* code ^short = "血壓組合。[固定為 LOINC 85354-9]"
* code ^definition = "沿用 TW Core 固定代碼 LOINC 85354-9（Blood pressure panel with all children optional）。code.coding 只能有這一個代碼。"

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
* effective[x] ^definition = "實際測量血壓的日期與時間，通常填 effectiveDateTime，至少要填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並保存在 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間並帶時區（例如 +08:00）。沒有測量時間，或只有時間沒有日期時，不建立本 Observation。"

* dataAbsentReason ^short = "整筆缺值原因。[通常不填]"
* dataAbsentReason ^definition = "收縮壓或舒張壓缺值時，記在各自 component 的 dataAbsentReason。兩者皆無時不建立本 Observation，因此通常不需填本元素。"

* component ^short = "收縮壓與舒張壓"
* component ^definition = "收縮壓與舒張壓兩個 component 都必須存在。每個 component 都要有 code，並擇一填寫 valueQuantity 或 dataAbsentReason。"

* component[SystolicBP] ^short = "收縮壓"
* component[SystolicBP].code ^short = "收縮壓。[固定為 LOINC 8480-6]"
* component[SystolicBP].valueQuantity ^short = "收縮壓數值。[單位 mm[Hg]]"
* component[SystolicBP].valueQuantity ^definition = "收縮壓，單位為毫米汞柱。system 固定為 http://unitsofmeasure.org，code 固定為 mm[Hg]。來源空白時改填本 component 的 dataAbsentReason。"
* component[SystolicBP].valueQuantity.value ^short = "收縮壓數值。[例如 168]"
* component[SystolicBP].valueQuantity.unit ^short = "單位顯示文字。[填 mmHg]"
* component[SystolicBP].valueQuantity.code ^short = "UCUM 單位代碼。[固定為 mm[Hg]]"
* component[SystolicBP].dataAbsentReason ^short = "收縮壓缺值原因。[只有舒張壓時填 unknown]"
* component[SystolicBP].dataAbsentReason ^definition = "只有舒張壓、沒有收縮壓時，仍保留本 component 的 code，不填 valueQuantity，改填 dataAbsentReason。來源只知缺值且未說明原因時填 unknown。"

* component[DiastolicBP] ^short = "舒張壓"
* component[DiastolicBP].code ^short = "舒張壓。[固定為 LOINC 8462-4]"
* component[DiastolicBP].valueQuantity ^short = "舒張壓數值。[單位 mm[Hg]]"
* component[DiastolicBP].valueQuantity ^definition = "舒張壓，單位為毫米汞柱。system 固定為 http://unitsofmeasure.org，code 固定為 mm[Hg]。來源空白時改填本 component 的 dataAbsentReason。"
* component[DiastolicBP].valueQuantity.value ^short = "舒張壓數值。[例如 95]"
* component[DiastolicBP].valueQuantity.unit ^short = "單位顯示文字。[填 mmHg]"
* component[DiastolicBP].valueQuantity.code ^short = "UCUM 單位代碼。[固定為 mm[Hg]]"
* component[DiastolicBP].dataAbsentReason ^short = "舒張壓缺值原因。[只有收縮壓時填 unknown]"
* component[DiastolicBP].dataAbsentReason ^definition = "只有收縮壓、沒有舒張壓時，仍保留本 component 的 code，不填 valueQuantity，改填 dataAbsentReason。來源只知缺值且未說明原因時填 unknown。"
