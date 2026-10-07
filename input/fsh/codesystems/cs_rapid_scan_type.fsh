CodeSystem: StrokeRapidScanTypeCS
Id: rapid-scan-type
Title: "腦中風－影像分析掃描類型代碼"
Description: "此 CodeSystem 定義自動化影像分析使用的掃描類型，屬檢查技術粗分類。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.191721920020596201930582038293712144480"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #CTP "CT 灌流" "電腦斷層灌流攝影（CT perfusion）。"
* #CTA "CT 血管攝影" "電腦斷層血管攝影（CT angiography）。"
* #NCCT "非增強 CT" "未注射顯影劑的電腦斷層（Non-contrast CT）。"
