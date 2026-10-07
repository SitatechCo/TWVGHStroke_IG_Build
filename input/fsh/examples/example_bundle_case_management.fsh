Instance: stroke-registry-response-ncva-example
InstanceOf: StrokeRegistryResponse
Title: "腦中風個管系統回覆範例"
Description: "個管系統一個個管事件的回覆，收錄於個管系統個案資料包範例。識別碼為個管流水序號；來源沒有表單狀態，status 填 in-progress；來源沒有登錄日期，authored 以 data-absent-reason 表示。"
Usage: #inline
* identifier.system = "http://www.vghks.gov.tw/stroke-case-management-serial"
* identifier.value = "CM-EXAMPLE-0001"
* status = #in-progress
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* authored.extension[dataAbsentReason].valueCode = #unknown
* item[signDnr].text = "住院期間簽署 DNR"
* item[signDnr].answer.valueBoolean = false
* item[rawNcva].text = "個管系統原始值"
* item[rawNcva].item[0].linkId = "raw.ncva.hisnummark"
* item[rawNcva].item[0].text = "病歷號"
* item[rawNcva].item[0].answer.valueString = "EX00000001"
* item[rawNcva].item[1].linkId = "raw.ncva.cmseqno"
* item[rawNcva].item[1].text = "個管流水序號"
* item[rawNcva].item[1].answer.valueString = "CM-EXAMPLE-0001"

Instance: stroke-bundle-ncva-example
InstanceOf: StrokeCaseManagementBundle
Title: "腦中風個管系統個案資料包範例"
Description: "個管系統一個個管事件的資料包：病人、急診與住院就醫、個管系統回覆、資料來源追溯、診斷、評估、生命徵象、檢驗、用藥與處置放在同一包。各資源以相對參照互相連結，依 entry 的 fullUrl 解析。"
Usage: #example
* identifier.system = "http://www.vghks.gov.tw/stroke-case-management-serial"
* identifier.value = "CM-EXAMPLE-0001"
* type = #collection
* timestamp = "2025-02-01T10:00:00+08:00"

// 病人、院所與就醫事件
* entry[patient].fullUrl = "http://vgh-stroke-ig.fhir.tw/Patient/stroke-patient-example"
* entry[patient].resource = stroke-patient-example
* entry[organization][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Organization/stroke-organization-vghks"
* entry[organization][0].resource = stroke-organization-vghks
* entry[encounter][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Encounter/stroke-encounter-er-example"
* entry[encounter][0].resource = stroke-encounter-er-example
* entry[encounter][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Encounter/stroke-encounter-example"
* entry[encounter][1].resource = stroke-encounter-example

// 登錄表單與資料來源追溯
* entry[registryResponse][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/QuestionnaireResponse/stroke-registry-response-ncva-example"
* entry[registryResponse][0].resource = stroke-registry-response-ncva-example
* entry[provenance][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Provenance/stroke-provenance-example"
* entry[provenance][0].resource = stroke-provenance-example

// 診斷與評估
* entry[condition][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Condition/stroke-condition-example"
* entry[condition][0].resource = stroke-condition-example
* entry[admissionContext][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-arrival-mode-example"
* entry[admissionContext][0].resource = stroke-arrival-mode-example
* entry[admissionContext][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-patient-age-example"
* entry[admissionContext][1].resource = stroke-patient-age-example
* entry[admissionContext][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-education-level-example"
* entry[admissionContext][2].resource = stroke-education-level-example
* entry[onsetTime][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-onset-time-only-example"
* entry[onsetTime][0].resource = stroke-onset-time-only-example
* entry[riskFactor][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-hypertension-history-example"
* entry[riskFactor][0].resource = stroke-hypertension-history-example
* entry[riskFactor][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-diabetes-history-unknown-example"
* entry[riskFactor][1].resource = stroke-diabetes-history-unknown-example
* entry[riskFactor][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-family-history-stroke-example"
* entry[riskFactor][2].resource = stroke-family-history-stroke-example
* entry[riskFactor][3].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-cigarettes-per-day-example"
* entry[riskFactor][3].resource = stroke-cigarettes-per-day-example
* entry[clinicalAssessment][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-toast-classification-example"
* entry[clinicalAssessment][0].resource = stroke-toast-classification-example
* entry[clinicalAssessment][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-ecg-atrial-fibrillation-example"
* entry[clinicalAssessment][1].resource = stroke-ecg-atrial-fibrillation-example
* entry[careProcess][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-icu-admission-example"
* entry[careProcess][0].resource = stroke-icu-admission-example
* entry[complication][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-neurologic-deterioration-example"
* entry[complication][0].resource = stroke-neurologic-deterioration-example
* entry[nihss][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-nihss-admission-example"
* entry[nihss][0].resource = stroke-nihss-admission-example
* entry[nihss][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-nihss-24h-example"
* entry[nihss][1].resource = stroke-nihss-24h-example
* entry[mrs][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-mrs-discharge-example"
* entry[mrs][0].resource = stroke-mrs-discharge-example
* entry[mrs][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-mrs-unclassified-example"
* entry[mrs][1].resource = stroke-mrs-unclassified-example
* entry[gcs][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-gcs-example"
* entry[gcs][0].resource = stroke-gcs-example

// 生命徵象與個人狀況
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
* entry[occupation][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-occupation-example"
* entry[occupation][0].resource = stroke-occupation-example
* entry[smokingStatus][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-smoking-status-example"
* entry[smokingStatus][0].resource = stroke-smoking-status-example

// 檢驗、處置結果、用藥與處置
* entry[laboratory][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-lab-hemoglobin-example"
* entry[laboratory][0].resource = stroke-lab-hemoglobin-example
* entry[laboratory][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-lab-inr-not-available-example"
* entry[laboratory][1].resource = stroke-lab-inr-not-available-example
* entry[procedureResult][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-reperfusion-time-only-example"
* entry[procedureResult][0].resource = stroke-reperfusion-time-only-example
* entry[medicationStatement][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationStatement/stroke-medstatement-statin-pre-admission-example"
* entry[medicationStatement][0].resource = stroke-medstatement-statin-pre-admission-example
* entry[medicationStatement][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationStatement/stroke-medstatement-aspirin-inpatient-example"
* entry[medicationStatement][1].resource = stroke-medstatement-aspirin-inpatient-example
* entry[medicationStatement][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationStatement/stroke-medstatement-apixaban-discharge-example"
* entry[medicationStatement][2].resource = stroke-medstatement-apixaban-discharge-example
* entry[medicationAdministration][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/MedicationAdministration/stroke-medadmin-ivtpa-example"
* entry[medicationAdministration][0].resource = stroke-medadmin-ivtpa-example
* entry[procedure][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Procedure/stroke-procedure-evt-example"
* entry[procedure][0].resource = stroke-procedure-evt-example
* entry[procedure][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Procedure/stroke-procedure-dysphagia-screening-example"
* entry[procedure][1].resource = stroke-procedure-dysphagia-screening-example
* entry[procedure][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Procedure/stroke-procedure-ventilation-not-done-example"
* entry[procedure][2].resource = stroke-procedure-ventilation-not-done-example
