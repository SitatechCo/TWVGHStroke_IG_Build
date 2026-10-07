ValueSet: StrokeEvtOutcomeAnswerVS
Id: stroke-evt-outcome-answer
Title: "腦中風－EVT 術後結果答案值集"
Description: "此 ValueSet 合併 StrokeEvtOutcome 各項目的答案代碼，綁定於該 Profile 的 valueCodeableConcept（required）。最終 TICI 分級（final-tici-grade）用 StrokeTiciCS；EVT 後血壓控制目標（post-evt-bp-target）用 StrokePostEvtBpTargetCS；追蹤影像顱內出血症狀分類（follow-up-ich-symptom-type）用 StrokeIchSymptomCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.101121543801805546249024608022819322065"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeTiciCS
* include codes from system StrokePostEvtBpTargetCS
* include codes from system StrokeIchSymptomCS
