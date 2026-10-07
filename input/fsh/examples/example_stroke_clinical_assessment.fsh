Instance: stroke-toast-classification-example
InstanceOf: StrokeClinicalAssessment
Usage: #example
Title: "腦中風分類評估範例－TOAST 分類"
Description: "缺血性中風 TOAST 分類為心因性栓塞，填代碼 3。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#toast-classification "TOAST 分類"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeToastCS#3 "心因性栓塞"

Instance: stroke-ecg-atrial-fibrillation-example
InstanceOf: StrokeClinicalAssessment
Usage: #example
Title: "腦中風分類評估範例－心電圖心房顫動"
Description: "本次心電圖顯示心房顫動，valueBoolean 填 true。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#ecg-atrial-fibrillation "心電圖心房顫動"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true

Instance: stroke-pre-stroke-independent-example
InstanceOf: StrokeClinicalAssessment
Usage: #example
Title: "腦中風分類評估範例－中風前可獨立生活"
Description: "病人本次中風前可獨立生活，評估時點填中風前（pre-stroke）。"
* extension[assessmentPhase].valueCode = #pre-stroke
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#pre-stroke-independent "中風前可獨立生活"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true
