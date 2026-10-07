CodeSystem: StrokeDischargeDestinationCS
Id: discharge-destination
Title: "腦中風－離院去向代碼"
Description: "此 CodeSystem 定義病人離院後的去向。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.320627095838081252135981180407328309329"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "回家" "離院後返家。"
* #2 "護理之家" "離院後入住護理之家。"
* #3 "呼吸病房" "離院後轉入呼吸照護病房。"
* #4 "轉院" "離院後轉至其他醫院，醫院名稱另以文字記錄。"
