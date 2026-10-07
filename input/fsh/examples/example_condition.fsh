Instance: stroke-condition-example
InstanceOf: StrokeCondition
Title: "腦中風診斷範例"
Description: "住院中風診斷範例：以 ICD-10-CM 填寫腦梗塞診斷碼。"
Usage: #example
* clinicalStatus = $ConditionClinical#active "Active"
* category = $ConditionCategory#encounter-diagnosis "Encounter Diagnosis"
* code.coding[icd10cm] = $ICD10CM#I63.9 "Cerebral infarction, unspecified"
* code.text = "腦梗塞"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
