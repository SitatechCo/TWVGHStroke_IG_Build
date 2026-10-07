CodeSystem: StrokeAdmissionSourceCS
Id: admission-source
Title: "腦中風－就醫來源代碼"
Description: "此 CodeSystem 定義本次就醫或住院的來源類別，包含兩組代碼：數字代碼（1、2、3）區分急診、直入病房與院內中風；英文代碼（A、E、O）區分入院方式。兩組分類維度不同，彼此不完全對等。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.254507636649550223341057314161492128536"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "急診" "經急診就醫，屬數字代碼組。"
* #2 "直入病房" "未經急診直接入住病房，屬數字代碼組。"
* #3 "院內中風" "住院期間在院內發生中風，屬數字代碼組。"
* #A "住院" "入院方式為住院，屬英文代碼組。"
* #E "急診" "入院方式為急診，屬英文代碼組。"
* #O "門診" "入院方式為門診，屬英文代碼組。"
