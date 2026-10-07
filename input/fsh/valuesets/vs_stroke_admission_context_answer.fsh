ValueSet: StrokeAdmissionContextAnswerVS
Id: stroke-admission-context-answer
Title: "腦中風－就醫背景答案值集"
Description: "此 ValueSet 合併 StrokeAdmissionContext 各項目的答案代碼，綁定於該 Profile 的 valueCodeableConcept（required）。就醫來源（admission-source）用 StrokeAdmissionSourceCS；到院方式（arrival-mode）用 StrokeArrivalModeCS；教育程度（education-level）用 StrokeEducationLevelCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.204797754965570360267333214284659150758"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeAdmissionSourceCS
* include codes from system StrokeArrivalModeCS
* include codes from system StrokeEducationLevelCS
