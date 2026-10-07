Instance: stroke-encounter-example
InstanceOf: StrokeEncounter
Title: "腦中風住院就醫範例"
Description: "經本院急診入院的腦中風住院範例：記錄住院日期、離院日期與離院情形。"
Usage: #example
* status = #finished
* class = $ActCode#IMP "inpatient encounter"
* subject = Reference(Patient/stroke-patient-example)
* period.start = "2025-01-15"
* period.end = "2025-01-28"
* hospitalization.admitSource = http://terminology.hl7.org/CodeSystem/admit-source#emd "From accident/emergency department"
* hospitalization.dischargeDisposition = StrokeDischargeStatusCS#3 "出院"
* serviceProvider = Reference(Organization/stroke-organization-vghks)

Instance: stroke-encounter-er-example
InstanceOf: StrokeEncounter
Title: "腦中風本院急診就醫範例"
Description: "本院急診範例：急診與住院分開建 Encounter，start 填抵達急診的日期時間。"
Usage: #example
* status = #finished
* class = $ActCode#EMER "emergency"
* subject = Reference(Patient/stroke-patient-example)
* period.start = "2025-01-15T08:30:00+08:00"
* serviceProvider = Reference(Organization/stroke-organization-vghks)

Instance: stroke-encounter-other-er-example
InstanceOf: StrokeEncounter
Title: "腦中風他院急診就醫範例"
Description: "病人先至他院急診的範例：來源只有到院時間、沒有日期，以 StrokeEventTimeOnly 保留時間；院所尚未建檔，只填院所名稱。"
Usage: #example
* status = #finished
* class = $ActCode#EMER "emergency"
* subject = Reference(Patient/stroke-patient-example)
* period.start.extension[eventTimeOnly].valueTime = "07:10:00"
* serviceProvider.display = "他院（院所未建立）"
