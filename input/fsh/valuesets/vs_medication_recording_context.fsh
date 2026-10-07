ValueSet: StrokeMedicationRecordingContextVS
Id: medication-recording-context
Title: "腦中風－用藥紀錄時窗值集"
Description: "此 ValueSet 收錄所有用藥紀錄時窗代碼，綁定於 StrokeMedicationRecordingContext Extension 的 valueCode（required）。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.46239358356474272424378675989466263026"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeMedicationRecordingContextCS
