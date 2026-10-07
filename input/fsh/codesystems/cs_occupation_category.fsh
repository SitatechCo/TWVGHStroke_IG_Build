CodeSystem: StrokeOccupationCategoryCS
Id: occupation-category
Title: "腦中風－職業類別代碼"
Description: "此 CodeSystem 定義病人的職業類別。此分類較粗，無法明確對應 TW Core 職業代碼時只填此代碼。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.160860787661354010278761370918961771496"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #OCP00 "無" "目前無職業。"
* #OCP01 "軍" "軍人。"
* #OCP02 "公" "公務人員。"
* #OCP03 "教" "教育人員。"
* #OCP04 "工" "工業或勞動工作者。"
* #OCP05 "農" "農業工作者。"
* #OCP06 "商" "從事商業工作。"
* #OCP07 "服務業" "從事服務業。"
* #OCP08 "學生" "在學學生。"
* #OCP09 "退休" "已退休。"
* #OCP99 "其他" "非上述類別的職業。"
