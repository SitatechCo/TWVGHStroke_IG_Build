ValueSet: StrokeOutcomeAnswerVS
Id: stroke-outcome-answer
Title: "腦中風－離院與追蹤結果答案值集"
Description: "此 ValueSet 整合 StrokeOutcome 各項目的答案代碼，綁定至該 Profile 的 valueCodeableConcept（required）。離院死亡原因（discharge-death-cause）與追蹤期間死亡原因（follow-up-death-cause）填 StrokeDeathCauseCS；離院去向（discharge-destination）填 StrokeDischargeDestinationCS；中風後 3 個月所在處所（three-month-residence）填 StrokeThreeMonthResidenceCS；追蹤期間醫療狀態（follow-up-care-status）填 StrokeFollowUpCareStatusCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.129234900890972384327868917632612048768"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeDeathCauseCS
* include codes from system StrokeDischargeDestinationCS
* include codes from system StrokeThreeMonthResidenceCS
* include codes from system StrokeFollowUpCareStatusCS
