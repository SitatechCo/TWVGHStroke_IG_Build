Instance: stroke-heart-rate-example
InstanceOf: StrokeHeartRate
Title: "腦中風心率範例"
Description: "病人到院測得心率 88 /min 的範例。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#8867-4 "Heart rate"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:35:00+08:00"
* valueQuantity = 88 '/min' "/min"
