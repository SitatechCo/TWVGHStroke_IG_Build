Instance: stroke-complication-pneumonia-example
InstanceOf: StrokeComplication
Usage: #example
Title: "腦中風住院併發症範例－肺炎"
Description: "病人住院期間發生肺炎，valueBoolean 填 true；來源未記錄確認日期，不填 effective[x]。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#complication-pneumonia "住院併發症：肺炎"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueBoolean = true

Instance: stroke-complication-other-name-example
InstanceOf: StrokeComplication
Usage: #example
Title: "腦中風住院併發症範例－其他併發症名稱"
Description: "其他住院併發症名稱以 valueString 原樣保留來源文字；另立一筆 complication-other = true 的 Observation 表示發生其他併發症。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#complication-other-name "其他住院併發症名稱"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueString = "壓力性損傷"

Instance: stroke-neurologic-deterioration-example
InstanceOf: StrokeComplication
Usage: #example
Title: "腦中風住院併發症範例－中風惡化（NIHSS 增加至少 2 分）"
Description: "依 NIHSS 增加至少 2 分標準，病人住院期間無中風惡化，valueBoolean 填 false。"
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#neurologic-deterioration-nihss-2-or-more "中風惡化（NIHSS 增加至少 2 分）"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueBoolean = false
