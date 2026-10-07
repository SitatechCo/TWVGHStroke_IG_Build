ValueSet: StrokeRapidScanTypeVS
Id: rapid-scan-type
Title: "腦中風－影像分析掃描類型值集"
Description: "此 ValueSet 收錄所有影像分析掃描類型代碼，用於 ImagingStudy.procedureCode 的本地 coding。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.318008422754067029882054021794454890328"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeRapidScanTypeCS
