CodeSystem: StrokeDischargeStatusCS
Id: discharge-status
Title: "腦中風－離院情形代碼"
Description: "此 CodeSystem 定義本次住院的離院情形，用於 Encounter.hospitalization.dischargeDisposition。代碼 LEV05（轉急性後期照護）無對應數字代碼，需獨立保留。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.91501743260936541235243133889917172508"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "病危自動出院" "病情危急，病人或家屬要求自動出院。"
* #2 "死亡" "本次住院期間死亡。"
* #3 "出院" "一般出院。"
* #LEV05 "轉急性後期照護（PAC）" "出院後轉入急性後期照護（PAC）。"
