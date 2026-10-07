Instance: stroke-smoking-status-example
InstanceOf: StrokeSmokingStatus
Title: "腦中風吸菸狀態範例"
Description: "病人戒菸 2 年或以下的範例。SNOMED CT 填 8517006（Ex-smoker），細分代碼填 2 保留來源分組。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#social-history "Social History"
* code = $LOINC#72166-2 "Tobacco smoking status"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept.coding[snomedSmokingStatus] = $SNOMEDCT#8517006 "Ex-smoker"
* valueCodeableConcept.coding[smokingStatusDetail] = StrokeSmokingStatusDetailCS#2 "已戒菸（2 年或以下）"
