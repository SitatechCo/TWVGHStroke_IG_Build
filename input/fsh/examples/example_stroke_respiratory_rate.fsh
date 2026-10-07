Instance: stroke-respiratory-rate-example
InstanceOf: StrokeRespiratoryRate
Title: "腦中風呼吸速率範例"
Description: "病人到院測得呼吸速率 18 /min 的範例。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#9279-1 "Respiratory rate"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:35:00+08:00"
* valueQuantity = 18 '/min' "/min"
