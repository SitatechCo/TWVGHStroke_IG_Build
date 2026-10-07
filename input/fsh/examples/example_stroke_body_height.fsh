Instance: stroke-body-height-example
InstanceOf: StrokeBodyHeight
Title: "腦中風身高範例"
Description: "病人到院測得身高 165.5 cm 的範例。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#8302-2 "Body height"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:40:00+08:00"
* valueQuantity = 165.5 'cm' "cm"
