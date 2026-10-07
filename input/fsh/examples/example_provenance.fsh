Instance: stroke-provenance-example
InstanceOf: StrokeProvenance
Title: "腦中風資料來源追溯範例"
Description: "腦中風登錄資料匯入追溯範例：登錄經手人員只有姓名，填入 display；來源時戳填 occurredDateTime。"
Usage: #example
* target[0] = Reference(Patient/stroke-patient-example)
* target[1] = Reference(Encounter/stroke-encounter-example)
* target[2] = Reference(Condition/stroke-condition-example)
* recorded = "2025-02-01T10:00:00+08:00"
* occurredDateTime = "2025-01-16T14:30:00+08:00"
* agent[enterer].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#enterer "Enterer"
* agent[enterer].who.display = "李小華"
* agent[ProvenanceAuthor].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author "Author"
* agent[ProvenanceAuthor].who = Reference(Organization/stroke-organization-vghks)
* entity[0].role = #source
* entity[0].what.identifier.system = "http://www.vghks.gov.tw/stroke-registry-record"
* entity[0].what.identifier.value = "EX-REC-0001"
* entity[0].what.display = "腦中風登錄來源紀錄（範例）"
