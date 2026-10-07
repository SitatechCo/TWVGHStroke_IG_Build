CodeSystem: StrokeDeathCauseCS
Id: death-cause
Title: "腦中風－死亡原因類別代碼"
Description: "此 CodeSystem 定義死因類別，離院死亡與追蹤期間死亡共用本代碼。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.280638082832968701178878098908895412159"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "中風致死" "死亡主因為中風。"
* #2 "其他" "死亡主因非中風，詳細原因另以文字記錄。"
