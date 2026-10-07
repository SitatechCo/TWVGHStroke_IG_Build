Instance: stroke-rapid-imagingstudy-example
InstanceOf: StrokeImagingStudy
Title: "腦中風 RAPID 掃描範例（資料包）"
Description: "一次 RAPID 分析的 CT 灌流掃描，收錄於 RAPID 影像分析資料包範例。掃描類型 CTP 填在 procedureCode 的 rapidScanType Slice；沒有 DICOM UID 與檢查時間，因此不填 identifier、started 與 series。"
Usage: #inline
* status = #available
* modality = $DICOM#CT "Computed Tomography"
* subject = Reference(Patient/stroke-patient-example)
* procedureCode.coding[rapidScanType] = StrokeRapidScanTypeCS#CTP "CT 灌流"
* procedureCode.text = "CT 灌流攝影"
* description = "RAPID 影像分析（CTP）"

Instance: stroke-rapid-aspects-example
InstanceOf: StrokeImagingResult
Title: "腦中風 RAPID ASPECTS 分數範例（資料包）"
Description: "RAPID 分析的 ASPECTS 分數為 8，以 derivedFrom 參照同包的 RAPID 掃描。"
Usage: #inline
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#aspects-score "ASPECTS 分數"
* subject = Reference(Patient/stroke-patient-example)
* valueInteger = 8
* derivedFrom = Reference(ImagingStudy/stroke-rapid-imagingstudy-example)

Instance: stroke-rapid-core-volume-example
InstanceOf: StrokeImagingResult
Title: "腦中風 RAPID 灌流核心梗塞體積範例（資料包）"
Description: "RAPID 分析的核心梗塞體積（CBF 低於 30% 的區域）為 0 mL，來源值為 0 照填 0。"
Usage: #inline
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#perfusion-core-volume "灌流核心梗塞體積"
* subject = Reference(Patient/stroke-patient-example)
* valueQuantity = $UCUM#mL "mL"
* valueQuantity.value = 0
* derivedFrom = Reference(ImagingStudy/stroke-rapid-imagingstudy-example)

Instance: stroke-rapid-tmax-volume-example
InstanceOf: StrokeImagingResult
Title: "腦中風 RAPID Tmax > 6 秒體積範例（資料包）"
Description: "RAPID 分析的 Tmax > 6 秒低灌流體積為 85 mL。"
Usage: #inline
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#tmax-over-6s-volume "Tmax > 6 秒體積"
* subject = Reference(Patient/stroke-patient-example)
* valueQuantity = $UCUM#mL "mL"
* valueQuantity.value = 85
* derivedFrom = Reference(ImagingStudy/stroke-rapid-imagingstudy-example)

Instance: stroke-rapid-mismatch-ratio-example
InstanceOf: StrokeImagingResult
Title: "腦中風 RAPID mismatch 比值無法計算範例（資料包）"
Description: "核心梗塞體積為 0，RAPID 輸出 mismatch 比值 9999 表示無法計算，不填 valueQuantity，改填 dataAbsentReason = unknown。"
Usage: #inline
* status = #final
* category[twcore] = $ObsCategory#imaging "Imaging"
* code.coding[strokeObservation] = StrokeObservationCS#perfusion-mismatch-ratio "灌流 mismatch 比值"
* subject = Reference(Patient/stroke-patient-example)
* dataAbsentReason = $DataAbsentReason#unknown "Unknown"
* dataAbsentReason.text = "來源 9999：無法計算"
* derivedFrom = Reference(ImagingStudy/stroke-rapid-imagingstudy-example)

Instance: stroke-rapid-provenance-example
InstanceOf: StrokeProvenance
Title: "腦中風 RAPID 資料來源追溯範例（資料包）"
Description: "一次匯入 RAPID 分析資料的追溯紀錄，收錄於 RAPID 影像分析資料包範例。target 列出本次匯入建立的資源，recorded 填匯入時間，author 為登錄醫院。"
Usage: #inline
* target[0] = Reference(QuestionnaireResponse/stroke-registry-response-rapid-example)
* target[1] = Reference(ImagingStudy/stroke-rapid-imagingstudy-example)
* target[2] = Reference(Observation/stroke-rapid-aspects-example)
* target[3] = Reference(Observation/stroke-rapid-core-volume-example)
* target[4] = Reference(Observation/stroke-rapid-tmax-volume-example)
* target[5] = Reference(Observation/stroke-rapid-mismatch-ratio-example)
* recorded = "2025-01-15T10:30:00+08:00"
* agent[ProvenanceAuthor].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author "Author"
* agent[ProvenanceAuthor].who = Reference(Organization/stroke-organization-vghks)
* entity[0].role = #source
* entity[0].what.display = "RAPID 影像分析紀錄（範例）"

Instance: stroke-bundle-rapid-example
InstanceOf: StrokeRapidBundle
Title: "腦中風 RAPID 影像分析資料包範例"
Description: "一次 RAPID CT 灌流分析的資料包：病人、醫院、RAPID 回覆、資料來源追溯、掃描與各項判讀結果放在同一包。判讀結果以 derivedFrom 參照同包的掃描，資源之間的相對參照依 entry 的 fullUrl 解析。"
Usage: #example
* identifier.system = "http://www.vghks.gov.tw/rapid-record-key"
* identifier.value = "1A0|EX00000001|REQ-EXAMPLE-0001|CTP"
* type = #collection
* timestamp = "2025-01-15T10:30:00+08:00"
* entry[patient].fullUrl = "http://vgh-stroke-ig.fhir.tw/Patient/stroke-patient-example"
* entry[patient].resource = stroke-patient-example
* entry[organization].fullUrl = "http://vgh-stroke-ig.fhir.tw/Organization/stroke-organization-vghks"
* entry[organization].resource = stroke-organization-vghks
* entry[registryResponse].fullUrl = "http://vgh-stroke-ig.fhir.tw/QuestionnaireResponse/stroke-registry-response-rapid-example"
* entry[registryResponse].resource = stroke-registry-response-rapid-example
* entry[provenance].fullUrl = "http://vgh-stroke-ig.fhir.tw/Provenance/stroke-rapid-provenance-example"
* entry[provenance].resource = stroke-rapid-provenance-example
* entry[imagingStudy].fullUrl = "http://vgh-stroke-ig.fhir.tw/ImagingStudy/stroke-rapid-imagingstudy-example"
* entry[imagingStudy].resource = stroke-rapid-imagingstudy-example
* entry[imagingResult][0].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-rapid-aspects-example"
* entry[imagingResult][0].resource = stroke-rapid-aspects-example
* entry[imagingResult][1].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-rapid-core-volume-example"
* entry[imagingResult][1].resource = stroke-rapid-core-volume-example
* entry[imagingResult][2].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-rapid-tmax-volume-example"
* entry[imagingResult][2].resource = stroke-rapid-tmax-volume-example
* entry[imagingResult][3].fullUrl = "http://vgh-stroke-ig.fhir.tw/Observation/stroke-rapid-mismatch-ratio-example"
* entry[imagingResult][3].resource = stroke-rapid-mismatch-ratio-example
