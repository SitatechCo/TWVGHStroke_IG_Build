Instance: stroke-body-temperature-example
InstanceOf: StrokeBodyTemperature
Title: "腦中風體溫範例"
Description: "病人到院測得體溫 36.8 °C 的範例。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#8310-5 "Body temperature"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:35:00+08:00"
* valueQuantity = 36.8 'Cel' "°C"
