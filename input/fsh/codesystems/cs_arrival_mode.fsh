CodeSystem: StrokeArrivalModeCS
Id: arrival-mode
Title: "腦中風－到院方式代碼"
Description: "此 CodeSystem 定義病人到院方式。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.76927040884637631998583775101168323660"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "緊急醫療救護（EMS）" "由緊急醫療救護系統（EMS）送達醫院。"
* #2 "自行到院" "病人自行或由親友送達醫院。"
* #3 "轉院" "由其他醫院轉送到院。"
* #NONE "無" "來源記錄為無到院方式。"
