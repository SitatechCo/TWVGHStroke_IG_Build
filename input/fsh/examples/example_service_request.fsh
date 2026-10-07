Instance: stroke-servicerequest-ctp-example
InstanceOf: StrokeServiceRequest
Title: "腦中風 CT 灌流檢查醫令範例"
Description: "院方核定醫令識別方式與檢查項目代碼後的醫令範例。已完成的腦部 CT 灌流檢查醫令，填醫令號與院內檢查項目代碼，另以 rapidScanType 填掃描類型 CTP。"
Usage: #example
* identifier.type = $IdType#PLAC "Placer Identifier"
* identifier.system = "http://www.vghks.gov.tw/order-id"
* identifier.value = "ORD-EXAMPLE-0001"
* status = #completed
* intent = #order
* code.coding[rapidScanType] = StrokeRapidScanTypeCS#CTP "CT 灌流"
* code.coding[1].system = "http://www.vghks.gov.tw/exam-item-code"
* code.coding[1].code = #CT-EXAMPLE-001
* code.coding[1].display = "腦部 CT 灌流攝影（虛構項目代碼）"
* code.text = "腦部 CT 灌流攝影"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* authoredOn = "2025-01-15T09:40:00+08:00"
