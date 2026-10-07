Instance: stroke-evt-target-vessel-example
InstanceOf: StrokeEvtProcedureDetail
Usage: #example
Title: "腦中風 EVT 處置細節範例－目標血管"
Description: "EVT 目標血管包含右側中大腦動脈 M1 段，valueBoolean 填 true，並以 partOf 參照 EVT 主處置。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#target-vessel-m1-right "目標血管：右側中大腦動脈 M1 段"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true

Instance: stroke-evt-aortic-arch-example
InstanceOf: StrokeEvtProcedureDetail
Usage: #example
Title: "腦中風 EVT 處置細節範例－主動脈弓分型"
Description: "主動脈弓為第 II 型，valueCodeableConcept 填 StrokeAorticArchTypeCS 的代碼 2。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#aortic-arch-type "主動脈弓分型"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeAorticArchTypeCS#2 "第 II 型"

Instance: stroke-evt-aspiration-rescue-example
InstanceOf: StrokeEvtProcedureDetail
Usage: #example
Title: "腦中風 EVT 處置細節範例－抽吸失敗後救援策略"
Description: "抽吸取栓未成功改用支架取栓器救援，來源選項 1 轉填 StrokeRescueStrategyCS 的 rescue-sr。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#aspiration-rescue-strategy "抽吸失敗後救援策略"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeRescueStrategyCS#rescue-sr "支架取栓器救援"

Instance: stroke-evt-stent-retriever-pass-count-example
InstanceOf: StrokeEvtProcedureDetail
Usage: #example
Title: "腦中風 EVT 處置細節範例－支架取栓次數"
Description: "支架取栓次數以 valueString 原樣保留來源內容。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#stent-retriever-pass-count "支架取栓次數"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueString = "2"
