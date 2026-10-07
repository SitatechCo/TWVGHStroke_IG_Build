Instance: stroke-procedure-evt-example
InstanceOf: StrokeProcedure
Title: "腦中風 EVT 主處置範例"
Description: "已完成的動脈內血栓移除術（EVT）主處置。動脈穿刺與支架取栓等子術式，以 partOf 參照本處置。"
Usage: #example
* status = #completed
* code.coding[strokeProcedure] = StrokeProcedureCS#evt "動脈內血栓移除術（EVT）"
* code.coding[sct-procedures] = $SNOMEDCT#439541007 "Percutaneous thrombectomy of cerebral artery using fluoroscopic guidance with contrast"
* code.text = "動脈內血栓移除術"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* performedPeriod.start = "2025-01-15T11:00:00+08:00"
* performedPeriod.end = "2025-01-15T12:10:00+08:00"

Instance: stroke-procedure-evt-puncture-example
InstanceOf: StrokeProcedure
Title: "腦中風 EVT 動脈穿刺範例"
Description: "EVT 經腹股溝動脈穿刺紀錄：記錄穿刺時間與部位，並以 partOf 參照 EVT 主處置。穿刺部位同時填本 IG 代碼 1 與 SNOMED CT 26893007。"
Usage: #example
* status = #completed
* code.coding[strokeProcedure] = StrokeProcedureCS#evt-puncture "EVT 動脈穿刺"
* code.text = "EVT 動脈穿刺"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* performedDateTime = "2025-01-15T11:05:00+08:00"
* bodySite.coding[punctureSite] = StrokePunctureSiteCS#1 "腹股溝"
* bodySite.coding[1] = $SNOMEDCT#26893007 "Inguinal region structure"
* bodySite.text = "腹股溝"
* partOf = Reference(stroke-procedure-evt-example)

Instance: stroke-procedure-stent-retriever-example
InstanceOf: StrokeProcedure
Title: "腦中風 EVT 支架取栓範例"
Description: "EVT 術中使用支架取栓器。來源只有執行時間、沒有日期，以 StrokeEventTimeOnly 保留時間。"
Usage: #example
* status = #completed
* code.coding[strokeProcedure] = StrokeProcedureCS#stent-retriever-thrombectomy "支架取栓"
* code.text = "支架取栓"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* performedDateTime.extension[eventTimeOnly].valueTime = "11:30:00"
* partOf = Reference(stroke-procedure-evt-example)

Instance: stroke-procedure-dysphagia-screening-example
InstanceOf: StrokeProcedure
Title: "腦中風住院吞嚥篩檢範例"
Description: "來源明確記錄住院期間曾執行吞嚥篩檢，但無執行時間，因此不填 performed。"
Usage: #example
* status = #completed
* code.coding[strokeProcedure] = StrokeProcedureCS#dysphagia-screening "吞嚥篩檢"
* code.coding[sct-procedures] = $SNOMEDCT#431765005 "Screening for dysphagia"
* code.text = "吞嚥篩檢"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)

Instance: stroke-procedure-ventilation-not-done-example
InstanceOf: StrokeProcedure
Title: "腦中風住院未使用呼吸器範例"
Description: "來源明確記錄住院期間未使用呼吸器，status 填 not-done。"
Usage: #example
* status = #not-done
* code.coding[strokeProcedure] = StrokeProcedureCS#mechanical-ventilation "使用呼吸器"
* code.coding[sct-procedures] = $SNOMEDCT#40617009 "Artificial ventilation"
* code.text = "使用呼吸器"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
