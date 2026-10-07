Instance: stroke-gcs-example
InstanceOf: StrokeGCS
Title: "腦中風昏迷指數範例"
Description: "病人到院 GCS 評估為 E3V4M6 的範例。來源未記載總分，因此不填 valueInteger。"
Usage: #example
* extension[assessmentPhase].valueCode = #admission
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = $LOINC#9269-2 "Glasgow coma score total"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:35:00+08:00"
* component[eye].code = $LOINC#9267-6 "Glasgow coma score eye opening"
* component[eye].valueInteger = 3
* component[verbal].code = $LOINC#9270-0 "Glasgow coma score verbal"
* component[verbal].valueInteger = 4
* component[motor].code = $LOINC#9268-4 "Glasgow coma score motor"
* component[motor].valueInteger = 6
