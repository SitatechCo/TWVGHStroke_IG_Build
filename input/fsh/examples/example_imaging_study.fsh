Instance: stroke-imagingstudy-ctp-example
InstanceOf: StrokeImagingStudy
Title: "腦中風 CT 灌流檢查範例"
Description: "EVT 前 CT 灌流檢查（CTP），供 RAPID 影像分析使用。沒有 DICOM UID，因此不填 identifier，也不建 series。"
Usage: #example
* status = #available
* modality = $DICOM#CT "Computed Tomography"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* started = "2025-01-15T09:55:00+08:00"
* procedureCode.coding[rapidScanType] = StrokeRapidScanTypeCS#CTP "CT 灌流"
* procedureCode.text = "CT 灌流攝影"
* description = "EVT 前 CT 灌流（RAPID 影像分析）"

Instance: stroke-imagingstudy-follow-up-mr-example
InstanceOf: StrokeImagingStudy
Title: "腦中風追蹤 MR 檢查範例"
Description: "EVT 後追蹤 MR 檢查。來源只有檢查時間、沒有日期，以 StrokeEventTimeOnly 保留時間。"
Usage: #example
* status = #available
* modality = $DICOM#MR "Magnetic Resonance"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* started.extension[eventTimeOnly].valueTime = "08:30:00"
* procedureCode.text = "腦部 MR"
* description = "追蹤 MR"
