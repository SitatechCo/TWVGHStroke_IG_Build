CodeSystem: StrokeEducationLevelCS
Id: education-level
Title: "腦中風－教育程度代碼"
Description: "此 CodeSystem 定義病人的最高教育程度。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.226554054763285108602047364215237932714"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #EDU00 "無" "未受正式學校教育。"
* #EDU01 "小學" "最高學歷為小學。"
* #EDU02 "國中" "最高學歷為國中。"
* #EDU03 "高中職" "最高學歷為高中或高職。"
* #EDU04 "大專" "最高學歷為大學或專科。"
* #EDU05 "研究所" "最高學歷為研究所。"
* #EDU99 "不詳" "教育程度不詳。"
