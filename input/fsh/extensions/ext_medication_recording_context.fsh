Extension: StrokeMedicationRecordingContext
Id: medication-recording-context
Title: "腦中風－用藥紀錄時窗"
Description: "此 Extension 記錄 MedicationStatement 所屬的用藥時窗，例如住院前、住院中、離院時或 EVT 後 24 小時內，說明紀錄出自哪個階段。"
Context: MedicationStatement
* ^status = #draft
* ^experimental = false
* . ^short = "用藥紀錄時窗"
* . ^definition = "記錄用藥所屬時窗。藥品代碼不含時窗資訊，同一藥品在不同時窗各建一筆 MedicationStatement。"
* extension 0..0
* value[x] 1..1 MS
* value[x] only code
* value[x] ^short = "用藥時窗代碼。[應填入 pre-admission／inpatient／discharge／first-24h]"
* value[x] ^definition = "可填 pre-admission（住院前）、inpatient（住院中）、discharge（離院時）或 first-24h（EVT 後 24 小時內）。若有實際用藥時間，另填 MedicationStatement.effective[x]。"
* valueCode from StrokeMedicationRecordingContextVS (required)
