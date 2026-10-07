Instance: stroke-evt-final-tici-example
InstanceOf: StrokeEvtOutcome
Usage: #example
Title: "腦中風 EVT 術後結果範例－最終 TICI 分級"
Description: "EVT 結束時再灌流程度為 TICI 2b 級，valueCodeableConcept 填 StrokeTiciCS 的 2b，並以 partOf 參照 EVT 主處置；最終 TICI 為 EVT 當下結果，effective 填 EVT 日期。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#final-tici-grade "最終 TICI 分級"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15"
* valueCodeableConcept = StrokeTiciCS#2b "TICI 2b 級"

Instance: stroke-evt-post-bp-target-example
InstanceOf: StrokeEvtOutcome
Usage: #example
Title: "腦中風 EVT 術後結果範例－術後血壓控制目標"
Description: "EVT 後血壓控制目標為低於 160 mmHg，valueCodeableConcept 填 StrokePostEvtBpTargetCS 的代碼 2；來源沒有訂定目標的時間，因此省略 effective，以 partOf 關聯 EVT 主處置。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#post-evt-bp-target "EVT 後血壓控制目標"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueCodeableConcept = StrokePostEvtBpTargetCS#2 "低於 160 mmHg"

Instance: stroke-evt-no-complication-example
InstanceOf: StrokeEvtOutcome
Usage: #example
Title: "腦中風 EVT 術後結果範例－無 EVT 相關併發症"
Description: "來源勾選「無 EVT 相關併發症」，valueBoolean 填 true，未勾選則不建立；來源沒有評估時間，因此省略 effective。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#no-evt-complication "無 EVT 相關併發症"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* valueBoolean = true

Instance: stroke-evt-follow-up-imaging-ich-example
InstanceOf: StrokeEvtOutcome
Usage: #example
Title: "腦中風 EVT 術後結果範例－追蹤影像顯示顱內出血"
Description: "EVT 隔日追蹤 CT 顯示顱內出血，valueBoolean 填 true，effective 填該次追蹤 CT 檢查時間。"
* partOf = Reference(Procedure/stroke-procedure-evt-example)
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = StrokeObservationCS#follow-up-imaging-ich "追蹤影像顯示顱內出血"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-16T09:30:00+08:00"
* valueBoolean = true
