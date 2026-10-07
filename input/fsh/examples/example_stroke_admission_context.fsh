Instance: stroke-arrival-mode-example
InstanceOf: StrokeAdmissionContext
Usage: #example
Title: "腦中風就醫背景範例－到院方式"
Description: "病人由緊急醫療救護（EMS）送達醫院。"
* extension[assessmentPhase].valueCode = #admission
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#arrival-mode "到院方式"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeArrivalModeCS#1 "緊急醫療救護（EMS）"

Instance: stroke-patient-age-example
InstanceOf: StrokeAdmissionContext
Usage: #example
Title: "腦中風就醫背景範例－病人年齡"
Description: "本次就醫病人年齡為 72 歲，以 UCUM 單位 a 表示。"
* extension[assessmentPhase].valueCode = #admission
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#patient-age "病人年齡"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueQuantity = 72 'a' "歲"

Instance: stroke-education-level-example
InstanceOf: StrokeAdmissionContext
Usage: #example
Title: "腦中風就醫背景範例－教育程度"
Description: "病人最高教育程度為高中職。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#education-level "教育程度"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeEducationLevelCS#EDU03 "高中職"
