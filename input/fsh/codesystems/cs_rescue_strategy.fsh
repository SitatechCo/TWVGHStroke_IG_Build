CodeSystem: StrokeRescueStrategyCS
Id: rescue-strategy
Title: "腦中風－取栓救援策略代碼"
Description: "此 CodeSystem 定義第一線取栓未成功時採用的救援治療。抽吸失敗救援用 StrokeAspirationRescueVS，支架取栓失敗救援用 StrokeStentRetrieverRescueVS；各代碼的 definition 均註明原始選項代碼。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.158671394491126787004341140960863085156"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #rescue-sr "支架取栓器救援" "抽吸未成功改用支架取栓器救援，對應抽吸救援原始選項 1。"
* #rescue-aspiration "抽吸救援" "支架取栓未成功改用抽吸救援，對應支架取栓救援原始選項 1。"
* #rescue-angioplasty "血管成形術救援" "以血管成形術救援。抽吸救援與支架取栓救援原始選項皆為 2。"
* #rescue-thrombolysis "血栓溶解救援" "以血栓溶解治療救援。抽吸救援與支架取栓救援原始選項皆為 3。"
* #rescue-other "其他救援方式" "非上述救援方式，詳細內容另以文字記錄。抽吸救援與支架取栓救援原始選項皆為 4。"
