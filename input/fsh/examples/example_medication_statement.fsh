Instance: stroke-medstatement-aspirin-inpatient-example
InstanceOf: StrokeMedicationStatement
Title: "腦中風住院中用藥範例（Aspirin）"
Description: "來源記錄住院期間有使用 aspirin。目前狀態未確認，status 填 unknown，並在 note 註明來源記錄有使用。"
Usage: #example
* extension[recordingContext].valueCode = #inpatient
* status = #unknown
* medicationCodeableConcept.coding[strokeMedication] = StrokeMedicationCS#aspirin "Aspirin"
* subject = Reference(Patient/stroke-patient-example)
* context = Reference(Encounter/stroke-encounter-example)
* note.text = "來源記錄有使用"

Instance: stroke-medstatement-statin-pre-admission-example
InstanceOf: StrokeMedicationStatement
Title: "腦中風住院前用藥範例（未使用 statin）"
Description: "來源記錄住院前未使用 statin 類降血脂藥，status 填 not-taken。"
Usage: #example
* extension[recordingContext].valueCode = #pre-admission
* status = #not-taken
* medicationCodeableConcept.coding[strokeMedication] = StrokeMedicationCS#statin "statin 類降血脂藥"
* subject = Reference(Patient/stroke-patient-example)
* context = Reference(Encounter/stroke-encounter-example)

Instance: stroke-medstatement-apixaban-discharge-example
InstanceOf: StrokeMedicationStatement
Title: "腦中風離院時用藥範例（Apixaban）"
Description: "來源記錄離院時使用 NOAC，品項為 apixaban。類別與品項合併為一筆，填最明確的 apixaban。"
Usage: #example
* extension[recordingContext].valueCode = #discharge
* status = #unknown
* medicationCodeableConcept.coding[strokeMedication] = StrokeMedicationCS#apixaban "Apixaban"
* subject = Reference(Patient/stroke-patient-example)
* context = Reference(Encounter/stroke-encounter-example)
* note.text = "來源記錄有使用"
