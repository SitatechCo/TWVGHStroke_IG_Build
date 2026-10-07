ValueSet: StrokeAssessmentPhaseVS
Id: assessment-phase
Title: "腦中風－評估時點值集"
Description: "此 ValueSet 收錄所有評估時點代碼，綁定於 StrokeAssessmentPhase Extension 的 valueCode（required）。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.175496328610322876166947105385121169493"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeAssessmentPhaseCS
