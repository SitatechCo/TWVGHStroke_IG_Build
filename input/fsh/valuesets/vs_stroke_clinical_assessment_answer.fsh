ValueSet: StrokeClinicalAssessmentAnswerVS
Id: stroke-clinical-assessment-answer
Title: "腦中風－中風分類評估答案值集"
Description: "此 ValueSet 列出 StrokeClinicalAssessment 的答案代碼，綁定於該 Profile 的 valueCodeableConcept（required）。TOAST 分類（toast-classification）用 StrokeToastCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.123543173763183604228213001399031160979"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeToastCS
