ValueSet: StrokeEvtProcedureDetailAnswerVS
Id: stroke-evt-procedure-detail-answer
Title: "腦中風－EVT 處置細節答案值集"
Description: "此 ValueSet 整合 StrokeEvtProcedureDetail 各項目的答案代碼，綁定至該 Profile 的 valueCodeableConcept（required）。主動脈弓分型（aortic-arch-type）填 StrokeAorticArchTypeCS；各血管狹窄程度（right-cca-stenosis、left-cca-stenosis、right-ica-stenosis、left-ica-stenosis、right-vertebral-artery-stenosis、left-vertebral-artery-stenosis）填 StrokeStenosisGradeCS；抽吸取栓策略（aspiration-strategy，代碼 1 至 3）與補充選項（aspiration-strategy-supplement，代碼 4）填 StrokeAspirationStrategyCS；抽吸失敗後救援策略（aspiration-rescue-strategy，限 StrokeAspirationRescueVS 的代碼）與支架取栓後救援策略（stent-retriever-rescue-strategy，限 StrokeStentRetrieverRescueVS 的代碼）填 StrokeRescueStrategyCS；兩者代碼限制由 StrokeEvtProcedureDetail 的 Invariant 檢查。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.44999852043401334926409052700533166808"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeAorticArchTypeCS
* include codes from system StrokeStenosisGradeCS
* include codes from system StrokeAspirationStrategyCS
* include codes from system StrokeRescueStrategyCS
