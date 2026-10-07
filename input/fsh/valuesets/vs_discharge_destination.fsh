ValueSet: StrokeDischargeDestinationVS
Id: discharge-destination
Title: "腦中風－離院去向值集"
Description: "此 ValueSet 收錄所有離院去向代碼。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.285235765191475603274898822920452890339"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeDischargeDestinationCS
