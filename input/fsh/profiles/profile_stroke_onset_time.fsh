Profile: StrokeOnsetTime
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeOnsetTime
Title: "腦中風－發病時間"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現本次中風的發病時間資訊，包括中風發病時間、最後正常時間、發病時間不確定註記與醒後中風註記。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄本次中風發病時間與相關註記，用來計算發病至到院、發病至治療等時間間隔。每個項目建一筆 Observation，以 code 區分項目。同一事件的日期與時間合併填為 valueDateTime（時區確認前只填日期，見 valueDateTime 說明）。只有時間沒有日期時，以 StrokeEventTimeOnly 保留時間。來源空白時不建立。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，應填入 StrokeAssessmentPhaseVS 的代碼]"
* extension[assessmentPhase] ^definition = "此項目所屬的臨床時點。發病時間屬於入院資料，可填 admission；無法確認時填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeOnsetTimeCodeVS (required)
* code ^short = "觀察項目。[應填入 StrokeOnsetTimeCodeVS 的代碼]"
* code ^definition = "這筆 Observation 記錄的項目，一筆只填一項。可填 stroke-onset-time（中風發病時間）、last-known-well（最後正常時間）、onset-time-uncertain（發病時間不確定）、wake-up-stroke（醒後中風）。"
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 last-known-well]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "此項目所屬的就醫事件，能確認時再填。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "記錄日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "此項目的記錄日期；發病時間請填在 valueDateTime。至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。只有時間沒有日期時不填。"

* value[x] MS
* value[x] only dateTime or boolean
* value[x] ^short = "觀察值。[依 code 填入 valueDateTime 或 valueBoolean]"
* value[x] ^definition = """
依 code 填入對應型別：

- valueDateTime：中風發病時間（stroke-onset-time）、最後正常時間（last-known-well）。同一事件的日期與時間合併填寫，格式見 valueDateTime 說明。
- valueBoolean：發病時間不確定（onset-time-uncertain，true＝不確定）、醒後中風（wake-up-stroke，true＝是）。來源 1 填 true，0 填 false。

來源空白時不建立 Observation。
"""
* valueDateTime ^short = "發病或最後正常日期時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* valueDateTime ^definition = """
- 有日期與時間：時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00），來源只到分時，秒填 00。
- 只有日期：填 YYYY-MM-DD。
- 只有年月：填 YYYY-MM。
- 只有時間、沒有日期：valueDateTime 不填值，改在 valueDateTime 的 extension 填 StrokeEventTimeOnly（hh:mm:ss）。
"""
* valueDateTime.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* valueDateTime.extension[eventTimeOnly] ^short = "僅有時間。[hh:mm:ss，24 小時制；只在沒有日期時使用]"
* valueDateTime.extension[eventTimeOnly] ^definition = "來源只有時間、無日期時使用。此時 valueDateTime 不填值，只放此 Extension；取得完整日期時間後，改填 valueDateTime 並移除此 Extension。"
* valueBoolean ^short = "註記值。[true 或 false]"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "來源註記發病時間不確定時，另建一筆 onset-time-uncertain = true；若日期與時間皆無，不建立該筆 Observation。"
