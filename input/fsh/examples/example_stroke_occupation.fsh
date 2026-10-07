Instance: stroke-occupation-example
InstanceOf: StrokeOccupation
Title: "腦中風職業範例"
Description: "病人本次個管事件職業類別填「退休」，以 encounter 區分不同事件紀錄，只填本 IG 職業類別代碼。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#social-history "Social History"
* code = $LOINC#11341-5 "History of Occupation"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueCodeableConcept.coding[occupationCategory] = StrokeOccupationCategoryCS#OCP09 "退休"
* valueCodeableConcept.text = "退休"
