ValueSet: StrokePunctureSiteVS
Id: puncture-site
Title: "腦中風－穿刺部位值集"
Description: "此 ValueSet 收錄所有穿刺部位代碼，用於 StrokeProcedure.bodySite 的 punctureSite Slice。代碼 1 到 3 須同時填對應的 SNOMED CT 部位代碼。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.67078854640804732362752035636160710458"
* ^status = #draft
* ^experimental = false
* include codes from system StrokePunctureSiteCS
