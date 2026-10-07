CodeSystem: StrokeThreeMonthResidenceCS
Id: three-month-residence
Title: "腦中風－3 個月追蹤所在處所代碼"
Description: "此 CodeSystem 定義中風後 3 個月追蹤時病人所在的處所。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.143556868491921831316858040903295831675"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "住家" "追蹤時病人住在家中。"
* #2 "護理之家" "追蹤時病人住在護理之家。"
* #3 "呼吸病房" "追蹤時病人住在呼吸照護病房。"
* #4 "本院住院中" "追蹤時病人仍在本院住院。"
* #5 "轉至其他醫院" "追蹤時病人在其他醫院，醫院名稱另以文字記錄。"
* #6 "失聯" "追蹤時無法聯絡到病人。"
