CodeSystem: StrokeIvtpaNotGivenReasonCS
Id: ivtpa-not-given-reason
Title: "腦中風－未施打 IV-tPA 原因代碼"
Description: "此 CodeSystem 定義未施打靜脈血栓溶解劑（IV-tPA）的主要原因。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.147865281249298363947745874857762848177"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #REA01 "發作超過 3 小時或發作時間不明" "施打前缺血性中風發作已超過 3 小時，或無法確定發作時間。"
* #REA02 "發作至到院 2 小時內但不符條件" "發作至到院在 2 小時內，但不符合施打條件。"
* #REA03 "發作至到院 2–3 小時但不符條件" "發作至到院介於 2 至 3 小時，但不符合施打條件。"
