Instance: stroke-hypertension-history-example
InstanceOf: StrokeRiskFactor
Usage: #example
Title: "腦中風危險因子範例－高血壓病史"
Description: "病人有高血壓病史，valueBoolean 填 true。"
* extension[assessmentPhase].valueCode = #admission
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#hypertension-history "高血壓病史"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = true

Instance: stroke-diabetes-history-unknown-example
InstanceOf: StrokeRiskFactor
Usage: #example
Title: "腦中風危險因子範例－糖尿病病史不確定"
Description: "糖尿病病史登錄為不確定，不填 valueBoolean，改填 dataAbsentReason = unknown。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#diabetes-history "糖尿病病史"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* dataAbsentReason = $DataAbsentReason#unknown "Unknown"

Instance: stroke-family-history-stroke-example
InstanceOf: StrokeRiskFactor
Usage: #example
Title: "腦中風危險因子範例－中風家族史（陰性）"
Description: "家族中無人發生腦中風或短暫性腦缺血。陰性以 valueBoolean = false 保存，不建立 Condition。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#family-history-stroke-or-tia "中風或短暫性腦缺血家族史"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueBoolean = false

Instance: stroke-cigarettes-per-day-example
InstanceOf: StrokeRiskFactor
Usage: #example
Title: "腦中風危險因子範例－每日吸菸量"
Description: "病人平均每天吸菸 20 支，單位以 UCUM {cigarette}/d 表示。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#cigarettes-per-day "每日吸菸量"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueQuantity = 20 '{cigarette}/d' "{cigarette}/d"

Instance: stroke-cancer-name-example
InstanceOf: StrokeRiskFactor
Usage: #example
Title: "腦中風危險因子範例－癌症名稱"
Description: "癌症病史的癌症名稱，直接以 valueString 原樣填入文字。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#cancer-name "癌症名稱"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueString = "大腸癌"
