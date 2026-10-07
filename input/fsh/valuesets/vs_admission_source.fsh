ValueSet: StrokeAdmissionSourceVS
Id: admission-source
Title: "腦中風－就醫來源值集"
Description: "此 ValueSet 收錄所有就醫來源代碼（含數字代碼與英文代碼兩組）。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.58847073333544570744666616901429397309"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeAdmissionSourceCS
