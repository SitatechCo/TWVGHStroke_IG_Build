Instance: stroke-ivtpa-not-given-reason-example
InstanceOf: StrokeCareProcess
Usage: #example
Title: "腦中風照護流程範例－未施打 IV-tPA 主要原因"
Description: "醒後中風且發作時間不明，未施打 IV-tPA 主要原因填 REA01。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#ivtpa-not-given-main-reason "未施打 IV-tPA 主要原因"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeIvtpaNotGivenReasonCS#REA01 "發作超過 3 小時或發作時間不明"

Instance: stroke-ivtpa-not-given-onset-over-3h-example
InstanceOf: StrokeCareProcess
Usage: #example
Title: "腦中風照護流程範例－未施打 IV-tPA 次要原因"
Description: "未施打 IV-tPA 次要原因之一為發作已超過 3 小時，valueBoolean 填 true。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#ivtpa-not-given-onset-over-3h "未施打 IV-tPA：發作超過 3 小時"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true

Instance: stroke-icu-admission-example
InstanceOf: StrokeCareProcess
Usage: #example
Title: "腦中風照護流程範例－入住加護病房"
Description: "病人住院期間曾入住加護病房，此處只記錄是否入住。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#icu-admission "入住加護病房"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true
