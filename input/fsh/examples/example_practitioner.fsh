Instance: stroke-practitioner-example
InstanceOf: StrokePractitioner
Title: "腦中風醫事人員範例"
Description: "院所人員主檔已核定的人員範例，以院內人員識別碼識別。"
Usage: #example
* identifier[0].use = #official
* identifier[0].type = $IdType#PRN "Provider number"
* identifier[0].system = "http://www.vghks.gov.tw/staff-id"
* identifier[0].value = "EX-STAFF-0001"
* active = true
* name[0].use = #official
* name[0].text = "王小明"
* name[0].family = "王"
* name[0].given[0] = "小明"
