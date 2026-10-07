CodeSystem: StrokeStenosisGradeCS
Id: stenosis-grade
Title: "腦中風－血管狹窄程度分組代碼"
Description: "此 CodeSystem 定義總頸動脈、內頸動脈與椎動脈的血管狹窄程度分組。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.132538819805169335778790939150386009311"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "狹窄小於 50%" "血管管徑狹窄小於 50%。"
* #2 "狹窄 50–99%" "血管管徑狹窄 50% 至 99%。"
* #3 "完全阻塞（100%）" "血管完全阻塞。"
