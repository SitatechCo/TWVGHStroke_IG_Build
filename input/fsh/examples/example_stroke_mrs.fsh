Instance: stroke-mrs-discharge-example
InstanceOf: StrokeMRS
Title: "腦中風離院 mRS 評估範例"
Description: "離院 mRS 評估分數填 3（中度失能）。"
Usage: #example
* extension[assessmentPhase].valueCode = #discharge
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = $LOINC#75859-9 "Modified rankin scale"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-28"
* valueInteger = 3

Instance: stroke-mrs-pre-stroke-example
InstanceOf: StrokeMRS
Title: "腦中風中風前 mRS 範例"
Description: "回溯本次中風前 mRS 分數填 0（無症狀）；中風前 mRS 無評估日期，不填 effective。"
Usage: #example
* extension[assessmentPhase].valueCode = #pre-stroke
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = $LOINC#75859-9 "Modified rankin scale"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueInteger = 0

Instance: stroke-mrs-unclassified-example
InstanceOf: StrokeMRS
Title: "腦中風未分類時點 mRS 範例"
Description: "來源只有評估序號 4 且意義未確認，評估時點填 unclassified，只保留序號。"
Usage: #example
* extension[assessmentPhase].valueCode = #unclassified
* extension[assessmentSequence].valuePositiveInt = 4
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = $LOINC#75859-9 "Modified rankin scale"
* subject = Reference(Patient/stroke-patient-example)
* effectiveDateTime = "2025-04-20"
* valueInteger = 2
