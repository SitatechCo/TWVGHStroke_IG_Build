Instance: stroke-blood-pressure-example
InstanceOf: StrokeBloodPressure
Title: "腦中風血壓範例"
Description: "病人到院測得收縮壓 168 mmHg、舒張壓 95 mmHg 的範例。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#85354-9 "Blood pressure panel with all children optional"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:35:00+08:00"
* component[SystolicBP].code = $LOINC#8480-6 "Systolic blood pressure"
* component[SystolicBP].valueQuantity = 168 'mm[Hg]' "mmHg"
* component[DiastolicBP].code = $LOINC#8462-4 "Diastolic blood pressure"
* component[DiastolicBP].valueQuantity = 95 'mm[Hg]' "mmHg"

Instance: stroke-blood-pressure-diastolic-missing-example
InstanceOf: StrokeBloodPressure
Title: "腦中風血壓範例（缺舒張壓）"
Description: "來源只有收縮壓、沒有舒張壓的範例。舒張壓 component 保留代碼，改填 dataAbsentReason = unknown。"
Usage: #example
* status = #final
* category[VSCat] = $ObsCategory#vital-signs "Vital Signs"
* code = $LOINC#85354-9 "Blood pressure panel with all children optional"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T08:35:00+08:00"
* component[SystolicBP].code = $LOINC#8480-6 "Systolic blood pressure"
* component[SystolicBP].valueQuantity = 172 'mm[Hg]' "mmHg"
* component[DiastolicBP].code = $LOINC#8462-4 "Diastolic blood pressure"
* component[DiastolicBP].dataAbsentReason = $DataAbsentReason#unknown "Unknown"
