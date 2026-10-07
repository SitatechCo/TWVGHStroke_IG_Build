Instance: stroke-first-recanalization-example
InstanceOf: StrokeProcedureResult
Title: "腦中風首次血管再通時間範例"
Description: "EVT 目標血管首次再通的日期與時間，以 partOf 參照同次 EVT 主處置。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#procedure "Procedure"
* code.coding[strokeObservation] = StrokeObservationCS#first-recanalization-time "首次血管再通時間"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* valueDateTime = "2025-01-15T11:42:00+08:00"

Instance: stroke-reperfusion-time-only-example
InstanceOf: StrokeProcedureResult
Title: "腦中風再灌流時間（僅有時間）範例"
Description: "來源只有再灌流時間而無日期，valueDateTime 不填值，改以 StrokeEventTimeOnly 保留時間。"
Usage: #example
* status = #final
* category[twcore] = $ObsCategory#procedure "Procedure"
* code.coding[strokeObservation] = StrokeObservationCS#reperfusion-time "再灌流時間"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueDateTime.extension[eventTimeOnly].valueTime = "11:50:00"
