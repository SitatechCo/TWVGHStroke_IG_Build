Instance: stroke-discharge-destination-example
InstanceOf: StrokeOutcome
Usage: #example
Title: "腦中風離院與追蹤結果範例－離院去向"
Description: "病人離院後轉至其他醫院，valueCodeableConcept 填 StrokeDischargeDestinationCS 的代碼 4，評估時點填 discharge；轉入醫院名稱只保留在登錄表單。"
* extension[assessmentPhase].valueCode = #discharge
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#discharge-destination "離院去向"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-28"
* valueCodeableConcept = StrokeDischargeDestinationCS#4 "轉院"

Instance: stroke-three-month-residence-example
InstanceOf: StrokeOutcome
Usage: #example
Title: "腦中風離院與追蹤結果範例－3 個月所在處所"
Description: "中風後 3 個月追蹤病人住在家中，valueCodeableConcept 填 StrokeThreeMonthResidenceCS 的代碼 1，評估時點填 3-month。"
* extension[assessmentPhase].valueCode = #3-month
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#three-month-residence "中風後 3 個月所在處所"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-04-15"
* valueCodeableConcept = StrokeThreeMonthResidenceCS#1 "住家"

Instance: stroke-recurrent-stroke-example
InstanceOf: StrokeOutcome
Usage: #example
Title: "腦中風離院與追蹤結果範例－追蹤期間再中風"
Description: "追蹤期間病人再次中風，來源代碼 2（再中風）轉為 valueBoolean = true；評估時點無法確認則填 unclassified。"
* extension[assessmentPhase].valueCode = #unclassified
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#recurrent-stroke "追蹤期間再中風"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueBoolean = true

Instance: stroke-recurrent-stroke-date-example
InstanceOf: StrokeOutcome
Usage: #example
Title: "腦中風離院與追蹤結果範例－再中風日期"
Description: "追蹤期間再次中風的日期：來源只有日期，valueDateTime 填 YYYY-MM-DD。"
* extension[assessmentPhase].valueCode = #unclassified
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#recurrent-stroke-date "再中風日期"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueDateTime = "2025-04-02"
