ValueSet: StrokeCareProcessAnswerVS
Id: stroke-care-process-answer
Title: "腦中風－照護流程紀錄答案值集"
Description: "此 ValueSet 列出 StrokeCareProcess 的答案代碼，綁定於該 Profile 的 valueCodeableConcept（required）。未施打 IV-tPA 主要原因（ivtpa-not-given-main-reason）用 StrokeIvtpaNotGivenReasonCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.172132064894484696284300891616920530596"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeIvtpaNotGivenReasonCS
