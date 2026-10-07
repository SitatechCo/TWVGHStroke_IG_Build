ValueSet: StrokeDischargeStatusVS
Id: discharge-status
Title: "腦中風－離院情形值集"
Description: "此 ValueSet 收錄所有離院情形代碼，以 extensible 綁定於 StrokeEncounter 的 hospitalization.dischargeDisposition。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.25377598950847765207302321279797686707"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeDischargeStatusCS
