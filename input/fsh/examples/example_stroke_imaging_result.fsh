Instance: stroke-imaging-aspects-example
InstanceOf: StrokeImagingResult
Title: "腦中風 ASPECTS 分數範例"
Description: "EVT 前影像 ASPECTS 分數填 8。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#aspects-score "ASPECTS 分數"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueInteger = 8

Instance: stroke-imaging-core-volume-example
InstanceOf: StrokeImagingResult
Title: "腦中風灌流核心梗塞體積範例"
Description: "CT 灌流影像分析核心梗塞體積填 12 mL；已確認檢查識別鍵，以 derivedFrom 參照同次 CTP 檢查。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#perfusion-core-volume "灌流核心梗塞體積"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueQuantity = $UCUM#mL "mL"
* valueQuantity.value = 12
* derivedFrom = Reference(ImagingStudy/stroke-imagingstudy-ctp-example)

Instance: stroke-imaging-mismatch-ratio-unavailable-example
InstanceOf: StrokeImagingResult
Title: "腦中風 mismatch 比值無法計算範例"
Description: "來源 mismatch 比值為 9999 代表無法計算，不填 valueQuantity，改填 dataAbsentReason = unknown。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#perfusion-mismatch-ratio "灌流 mismatch 比值"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* dataAbsentReason = $DataAbsentReason#unknown "Unknown"
* dataAbsentReason.text = "來源 9999：無法計算"

Instance: stroke-imaging-cta-affected-side-example
InstanceOf: StrokeImagingResult
Title: "腦中風 CTA 影響側範例"
Description: "CTA 判讀影響側為左腦。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#cta-affected-side "CTA 影響側"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeAffectedSideCS#L "左腦"
* valueCodeableConcept.text = "左腦"
