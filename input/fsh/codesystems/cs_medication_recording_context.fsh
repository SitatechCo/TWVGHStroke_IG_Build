CodeSystem: StrokeMedicationRecordingContextCS
Id: medication-recording-context
Title: "腦中風－用藥紀錄時窗代碼"
Description: "此 CodeSystem 定義用藥紀錄所屬時窗，供 StrokeMedicationRecordingContext Extension 使用，說明紀錄出自哪個階段。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.91110999266378417217415688924269959330"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #pre-admission "住院前" "住院前用藥紀錄。"
* #inpatient "住院中" "住院期間用藥紀錄。"
* #discharge "離院時" "離院時用藥紀錄。"
* #first-24h "24 小時內" "EVT 後 24 小時內用藥紀錄。"
