CodeSystem: StrokePunctureSiteCS
Id: puncture-site
Title: "腦中風－穿刺部位代碼"
Description: "此 CodeSystem 定義 EVT 動脈穿刺部位。代碼僅表示穿刺部位；填寫代碼 1 到 3 時，須一併填入對應的 SNOMED CT 部位代碼。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.25981348866490277515118200448918585268"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "腹股溝" "經腹股溝穿刺動脈，對應 SNOMED CT 26893007（Inguinal region structure）。"
* #2 "手腕" "經手腕穿刺動脈，對應 SNOMED CT 8205005（Wrist region structure）。"
* #3 "手肘" "經手肘穿刺動脈，對應 SNOMED CT 127949000（Elbow region structure）。"
* #4 "其他" "非上述穿刺部位。此項無對應的 SNOMED CT 代碼，將部位說明填入 bodySite.text。"
