Instance: stroke-patient-example
InstanceOf: StrokePatient
Title: "腦中風病人範例"
Description: "腦中風登錄病人範例：以病歷號識別，出生日期只填到年月。"
Usage: #example
* identifier[medicalRecord].use = #official
* identifier[medicalRecord].type = $IdType#MR "Medical record number"
* identifier[medicalRecord].system = "http://www.vghks.gov.tw/patient-id"
* identifier[medicalRecord].value = "EX00000001"
* identifier[medicalRecord].assigner = Reference(Organization/stroke-organization-vghks)
* active = true
* gender = #male
* birthDate = "1950-01"
* managingOrganization = Reference(Organization/stroke-organization-vghks)

Instance: stroke-patient-deceased-example
InstanceOf: StrokePatient
Title: "腦中風病人範例（已死亡、出生年月不明）"
Description: "來源未提供出生年月時，以 data-absent-reason 擴充表示；有死亡日期時填 deceasedDateTime。"
Usage: #example
* identifier[medicalRecord].use = #official
* identifier[medicalRecord].type = $IdType#MR "Medical record number"
* identifier[medicalRecord].system = "http://www.vghks.gov.tw/patient-id"
* identifier[medicalRecord].value = "EX00000002"
* identifier[medicalRecord].assigner = Reference(Organization/stroke-organization-vghks)
* gender = #female
* birthDate.extension[0].url = $DataAbsentReasonExt
* birthDate.extension[0].valueCode = #unknown
* deceasedDateTime = "2025-03-20"
* managingOrganization = Reference(Organization/stroke-organization-vghks)
