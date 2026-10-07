CodeSystem: StrokeIchSymptomCS
Id: ich-symptom
Title: "腦中風－顱內出血症狀分類代碼"
Description: "此 CodeSystem 定義追蹤影像發現顱內出血（ICH）時的症狀分類。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.308265392689663366890047616184341800661"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "有症狀顱內出血" "追蹤影像顯示顱內出血，且 36 小時內 NIHSS 增加 4 分。"
* #2 "無症狀顱內出血" "追蹤影像顯示顱內出血，但不符合有症狀條件。"
