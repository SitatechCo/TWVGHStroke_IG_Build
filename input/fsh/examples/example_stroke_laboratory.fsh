Instance: stroke-lab-hemoglobin-example
InstanceOf: StrokeLaboratory
Title: "腦中風血紅素檢驗範例"
Description: "到院採檢血紅素結果：單位待院方確認故只填數值；LOINC 代碼待院方核定，code 只在 strokeObservation Slice 填本 IG 代碼。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#laboratory "Laboratory"
* code.coding[strokeObservation] = StrokeObservationCS#hemoglobin "血紅素（Hb）"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T09:50:00+08:00"
* valueQuantity.value = 13.2

Instance: stroke-lab-inr-not-available-example
InstanceOf: StrokeLaboratory
Title: "腦中風 INR 結果為 NA 範例"
Description: "有採檢時間但 INR 結果為 NA，不填數值，改填 dataAbsentReason = unknown。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#laboratory "Laboratory"
* code.coding[strokeObservation] = StrokeObservationCS#pt-inr "凝血酶原時間國際標準化比值（INR）"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T09:50:00+08:00"
* dataAbsentReason = $DataAbsentReason#unknown "Unknown"
