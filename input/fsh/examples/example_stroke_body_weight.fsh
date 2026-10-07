Instance: stroke-body-weight-example
InstanceOf: StrokeBodyWeight
Title: "腦中風體重範例"
Description: "病人到院測得體重 62.3 kg 的範例。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#29463-7 "Body weight"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:40:00+08:00"
* valueQuantity = 62.3 'kg' "kg"
