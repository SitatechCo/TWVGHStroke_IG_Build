Instance: stroke-registry-response-evt-main-example
InstanceOf: StrokeRegistryResponse
Title: "腦中風 EVT 登錄主表回覆範例（資料包）"
Description: "EVT 登錄主表已結案的回覆，收錄於 EVT 登錄個案資料包範例。登錄經手人員只有姓名，author 只填 display。authored 填完整登錄日期時間，與資料包內其他範例同樣假設來源時區已確認為 +08:00。"
Usage: #inline
* identifier.system = "http://www.vghks.gov.tw/evt-registry-id"
* identifier.value = "EVT-EXAMPLE-0001"
* status = #completed
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* authored = "2025-03-20T14:30:00+08:00"
* author.display = "李小華"
* item[consent].text = "研究同意書簽署狀態"
* item[consent].answer.valueBoolean = true
* item[consentDate].text = "研究同意書簽署日期"
* item[consentDate].answer.valueDate = "2025-01-16"
* item[beforeEvtIvtpa].text = "EVT 前 IV-tPA 施打院所"
* item[beforeEvtIvtpa].answer.valueCoding = StrokePreEvtIvtpaSiteCS#1 "本院施打"
* item[dischargeTransferHospital].text = "離院轉入醫院"
* item[dischargeTransferHospital].answer.valueString = "範例復健醫院"
* item[rawEvt].text = "EVT 登錄原始值"
* item[rawEvt].item[0].linkId = "raw.evt.caseId"
* item[rawEvt].item[0].text = "EVT 登錄個案識別碼"
* item[rawEvt].item[0].answer.valueString = "EVT-EXAMPLE-0001"
* item[rawEvt].item[1].linkId = "raw.evt.administration"
* item[rawEvt].item[1].text = "資料管理"
* item[rawEvt].item[1].item[0].linkId = "raw.evt.administration.registrar"
* item[rawEvt].item[1].item[0].text = "登錄經手人員"
* item[rawEvt].item[1].item[0].answer.valueString = "李小華"
* item[rawEvt].item[1].item[1].linkId = "raw.evt.administration.edit"
* item[rawEvt].item[1].item[1].text = "主表登錄狀態"
* item[rawEvt].item[1].item[1].answer.valueString = "2"
* item[rawEvt].item[1].item[2].linkId = "raw.evt.administration.keyinDate"
* item[rawEvt].item[1].item[2].text = "資料登錄日期時間"
* item[rawEvt].item[1].item[2].answer.valueString = "2025-03-20 14:30:00"

Instance: stroke-registry-response-evt-follow-up-example
InstanceOf: StrokeRegistryResponse
Title: "腦中風 EVT 登錄追蹤表回覆範例（資料包）"
Description: "EVT 登錄追蹤表暫存中的回覆，收錄於 EVT 登錄個案資料包範例。識別碼與主表相同；追蹤表登錄狀態為 1（暫存），status 填 in-progress；authored 以 data-absent-reason 表示。"
Usage: #inline
* identifier.system = "http://www.vghks.gov.tw/evt-registry-id"
* identifier.value = "EVT-EXAMPLE-0001"
* status = #in-progress
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* authored.extension[dataAbsentReason].valueCode = #unknown
* item[rawEvt].text = "EVT 登錄原始值"
* item[rawEvt].item[0].linkId = "raw.evt.caseId"
* item[rawEvt].item[0].text = "EVT 登錄個案識別碼"
* item[rawEvt].item[0].answer.valueString = "EVT-EXAMPLE-0001"
* item[rawEvt].item[1].linkId = "raw.evt.administration"
* item[rawEvt].item[1].text = "資料管理"
* item[rawEvt].item[1].item[0].linkId = "raw.evt.administration.traceEdit"
* item[rawEvt].item[1].item[0].text = "追蹤表登錄狀態"
* item[rawEvt].item[1].item[0].answer.valueString = "1"
* item[rawEvt].item[2].linkId = "raw.evt.followUp3Month"
* item[rawEvt].item[2].text = "中風後 3 個月追蹤"
* item[rawEvt].item[2].item[0].linkId = "raw.evt.followUp3Month.traceThreeDate"
* item[rawEvt].item[2].item[0].text = "中風後 3 個月追蹤日期"
* item[rawEvt].item[2].item[0].answer.valueString = "2025-04-15"
* item[rawEvt].item[2].item[1].linkId = "raw.evt.followUp3Month.traceThreePlace"
* item[rawEvt].item[2].item[1].text = "中風後 3 個月所在處所"
* item[rawEvt].item[2].item[1].answer.valueString = "1"

Instance: stroke-bundle-evt-example
InstanceOf: StrokeEvtRegistryBundle
Title: "腦中風 EVT 登錄個案資料包範例"
Description: "EVT 登錄一位個案的資料包：病人、急診與住院就醫、主表與追蹤表回覆、研究同意、EVT 主處置與子術式、EVT 處置細節與術後結果、影像檢查與判讀結果、評估、生命徵象、檢驗、用藥，以及離院與 3 個月追蹤結果放在同一包。各資源以相對參照互相連結，依 entry 的 fullUrl 解析。"
Usage: #example
* identifier.system = "http://www.vghks.gov.tw/evt-registry-id"
* identifier.value = "EVT-EXAMPLE-0001"
* type = #collection
* timestamp = "2025-04-20T10:00:00+08:00"

// 病人、院所與就醫事件
* entry[patient].fullUrl = "http://vgh-stroke-ig.fhir.tw/Patient/stroke-patient-example"
* entry[patient].resource = stroke-patient-example
* entry[organization][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Organization/stroke-organization-vghks"
* entry[organization][0].resource = stroke-organization-vghks
* entry[encounter][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Encounter/stroke-encounter-other-er-example"
* entry[encounter][0].resource = stroke-encounter-other-er-example
* entry[encounter][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Encounter/stroke-encounter-er-example"
* entry[encounter][1].resource = stroke-encounter-er-example
* entry[encounter][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Encounter/stroke-encounter-example"
* entry[encounter][2].resource = stroke-encounter-example

// 登錄表單與研究同意
* entry[registryResponse][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/QuestionnaireResponse/stroke-registry-response-evt-main-example"
* entry[registryResponse][0].resource = stroke-registry-response-evt-main-example
* entry[registryResponse][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/QuestionnaireResponse/stroke-registry-response-evt-follow-up-example"
* entry[registryResponse][1].resource = stroke-registry-response-evt-follow-up-example
* entry[consent][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Consent/stroke-consent-example"
* entry[consent][0].resource = stroke-consent-example

// 到院前後評估
* entry[admissionContext][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-arrival-mode-example"
* entry[admissionContext][0].resource = stroke-arrival-mode-example
* entry[onsetTime][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-last-known-well-example"
* entry[onsetTime][0].resource = stroke-last-known-well-example
* entry[onsetTime][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-onset-time-only-example"
* entry[onsetTime][1].resource = stroke-onset-time-only-example
* entry[onsetTime][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-wake-up-stroke-example"
* entry[onsetTime][2].resource = stroke-wake-up-stroke-example
* entry[riskFactor][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-hypertension-history-example"
* entry[riskFactor][0].resource = stroke-hypertension-history-example
* entry[riskFactor][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-diabetes-history-unknown-example"
* entry[riskFactor][1].resource = stroke-diabetes-history-unknown-example
* entry[riskFactor][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-cigarettes-per-day-example"
* entry[riskFactor][2].resource = stroke-cigarettes-per-day-example
* entry[riskFactor][3].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-cancer-name-example"
* entry[riskFactor][3].resource = stroke-cancer-name-example
* entry[clinicalAssessment][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-toast-classification-example"
* entry[clinicalAssessment][0].resource = stroke-toast-classification-example
* entry[clinicalAssessment][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-pre-stroke-independent-example"
* entry[clinicalAssessment][1].resource = stroke-pre-stroke-independent-example
* entry[nihss][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-nihss-admission-example"
* entry[nihss][0].resource = stroke-nihss-admission-example
* entry[nihss][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-nihss-24h-example"
* entry[nihss][1].resource = stroke-nihss-24h-example
* entry[mrs][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-mrs-pre-stroke-example"
* entry[mrs][0].resource = stroke-mrs-pre-stroke-example
* entry[mrs][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-mrs-discharge-example"
* entry[mrs][1].resource = stroke-mrs-discharge-example
* entry[gcs][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-gcs-example"
* entry[gcs][0].resource = stroke-gcs-example

// 生命徵象、吸菸與檢驗
* entry[bodyHeight][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-body-height-example"
* entry[bodyHeight][0].resource = stroke-body-height-example
* entry[bodyWeight][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-body-weight-example"
* entry[bodyWeight][0].resource = stroke-body-weight-example
* entry[bodyTemperature][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-body-temperature-example"
* entry[bodyTemperature][0].resource = stroke-body-temperature-example
* entry[heartRate][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-heart-rate-example"
* entry[heartRate][0].resource = stroke-heart-rate-example
* entry[respiratoryRate][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-respiratory-rate-example"
* entry[respiratoryRate][0].resource = stroke-respiratory-rate-example
* entry[bloodPressure][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-blood-pressure-example"
* entry[bloodPressure][0].resource = stroke-blood-pressure-example
* entry[smokingStatus][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-smoking-status-example"
* entry[smokingStatus][0].resource = stroke-smoking-status-example
* entry[laboratory][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-lab-hemoglobin-example"
* entry[laboratory][0].resource = stroke-lab-hemoglobin-example
* entry[laboratory][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-lab-inr-not-available-example"
* entry[laboratory][1].resource = stroke-lab-inr-not-available-example

// 用藥
* entry[medicationStatement][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationStatement/stroke-medstatement-statin-pre-admission-example"
* entry[medicationStatement][0].resource = stroke-medstatement-statin-pre-admission-example
* entry[medicationAdministration][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationAdministration/stroke-medadmin-ivtpa-example"
* entry[medicationAdministration][0].resource = stroke-medadmin-ivtpa-example
* entry[medicationAdministration][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationAdministration/stroke-medadmin-sedation-example"
* entry[medicationAdministration][1].resource = stroke-medadmin-sedation-example
* entry[medicationAdministration][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationAdministration/stroke-medadmin-intra-arterial-example"
* entry[medicationAdministration][2].resource = stroke-medadmin-intra-arterial-example

// 影像檢查與判讀結果
* entry[imagingStudy][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/ImagingStudy/stroke-imagingstudy-ctp-example"
* entry[imagingStudy][0].resource = stroke-imagingstudy-ctp-example
* entry[imagingStudy][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/ImagingStudy/stroke-imagingstudy-follow-up-mr-example"
* entry[imagingStudy][1].resource = stroke-imagingstudy-follow-up-mr-example
* entry[imagingResult][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-imaging-aspects-example"
* entry[imagingResult][0].resource = stroke-imaging-aspects-example
* entry[imagingResult][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-imaging-core-volume-example"
* entry[imagingResult][1].resource = stroke-imaging-core-volume-example

// EVT 處置、細節與結果
* entry[procedure][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Procedure/stroke-procedure-evt-example"
* entry[procedure][0].resource = stroke-procedure-evt-example
* entry[procedure][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Procedure/stroke-procedure-evt-puncture-example"
* entry[procedure][1].resource = stroke-procedure-evt-puncture-example
* entry[procedure][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Procedure/stroke-procedure-stent-retriever-example"
* entry[procedure][2].resource = stroke-procedure-stent-retriever-example
* entry[evtProcedureDetail][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-target-vessel-example"
* entry[evtProcedureDetail][0].resource = stroke-evt-target-vessel-example
* entry[evtProcedureDetail][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-aortic-arch-example"
* entry[evtProcedureDetail][1].resource = stroke-evt-aortic-arch-example
* entry[evtProcedureDetail][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-aspiration-rescue-example"
* entry[evtProcedureDetail][2].resource = stroke-evt-aspiration-rescue-example
* entry[evtProcedureDetail][3].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-stent-retriever-pass-count-example"
* entry[evtProcedureDetail][3].resource = stroke-evt-stent-retriever-pass-count-example
* entry[procedureResult][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-first-recanalization-example"
* entry[procedureResult][0].resource = stroke-first-recanalization-example
* entry[evtOutcome][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-final-tici-example"
* entry[evtOutcome][0].resource = stroke-evt-final-tici-example
* entry[evtOutcome][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-post-bp-target-example"
* entry[evtOutcome][1].resource = stroke-evt-post-bp-target-example
* entry[evtOutcome][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-no-complication-example"
* entry[evtOutcome][2].resource = stroke-evt-no-complication-example
* entry[evtOutcome][3].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-evt-follow-up-imaging-ich-example"
* entry[evtOutcome][3].resource = stroke-evt-follow-up-imaging-ich-example

// 住院併發症、離院與追蹤結果
* entry[complication][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-complication-pneumonia-example"
* entry[complication][0].resource = stroke-complication-pneumonia-example
* entry[complication][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-complication-other-name-example"
* entry[complication][1].resource = stroke-complication-other-name-example
* entry[complication][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-neurologic-deterioration-example"
* entry[complication][2].resource = stroke-neurologic-deterioration-example
* entry[outcome][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-discharge-destination-example"
* entry[outcome][0].resource = stroke-discharge-destination-example
* entry[outcome][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-three-month-residence-example"
* entry[outcome][1].resource = stroke-three-month-residence-example
* entry[outcome][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-recurrent-stroke-example"
* entry[outcome][2].resource = stroke-recurrent-stroke-example
* entry[outcome][3].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-recurrent-stroke-date-example"
* entry[outcome][3].resource = stroke-recurrent-stroke-date-example
