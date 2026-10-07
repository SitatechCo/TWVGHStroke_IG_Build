CodeSystem: StrokeFollowUpCareStatusCS
Id: follow-up-care-status
Title: "腦中風－追蹤期間醫療狀態代碼"
Description: "此 CodeSystem 定義追蹤期間病人的醫療狀態。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.128655009164575960052076663268721583651"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "繼續回診服藥" "追蹤期間持續回診並服藥。"
* #2 "拒回診" "病人拒絕回診。"
* #3 "死亡" "病人於追蹤期間死亡。"
