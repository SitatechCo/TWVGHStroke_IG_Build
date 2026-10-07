Instance: stroke-organization-vghks
InstanceOf: StrokeOrganization
Title: "腦中風登錄醫院範例"
Description: "登錄醫院範例：高雄榮民總醫院，以本地院所代號 1A0 識別；本地代號不是醫事機構代碼。"
Usage: #example
* identifier[0].use = #usual
* identifier[0].type = $IdType#XX "Organization identifier"
* identifier[0].system = "http://www.vghks.gov.tw/stroke-hospital-code"
* identifier[0].value = "1A0"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "高雄榮民總醫院"
