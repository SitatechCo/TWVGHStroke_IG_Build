Instance: stroke-last-known-well-example
InstanceOf: StrokeOnsetTime
Usage: #example
Title: "腦中風發病時間範例－最後正常時間"
Description: "病人前一晚 22:30 就寢前仍正常，日期與時間合併填入 valueDateTime。"
* extension[assessmentPhase].valueCode = #admission
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#last-known-well "最後正常時間"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueDateTime = "2025-01-14T22:30:00+08:00"

Instance: stroke-onset-time-only-example
InstanceOf: StrokeOnsetTime
Usage: #example
Title: "腦中風發病時間範例－只有時間"
Description: "來源只記錄發病時間 06:40 而無日期，valueDateTime 不填值，改以 StrokeEventTimeOnly 保留時間。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#stroke-onset-time "中風發病時間"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueDateTime.extension[eventTimeOnly].valueTime = "06:40:00"

Instance: stroke-wake-up-stroke-example
InstanceOf: StrokeOnsetTime
Usage: #example
Title: "腦中風發病時間範例－醒後中風"
Description: "病人睡醒後才發現中風症狀，醒後中風註記填 true。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#wake-up-stroke "醒後中風"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true
