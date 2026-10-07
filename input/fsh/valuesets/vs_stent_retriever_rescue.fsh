ValueSet: StrokeStentRetrieverRescueVS
Id: stent-retriever-rescue
Title: "腦中風－支架取栓後救援策略值集"
Description: "此 ValueSet 列出支架取栓後可選的救援策略。原始選項 1 填 rescue-aspiration，2 填 rescue-angioplasty，3 填 rescue-thrombolysis，4 填 rescue-other。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.29042234395556899180321296295575820965"
* ^status = #draft
* ^experimental = false
* StrokeRescueStrategyCS#rescue-aspiration
* StrokeRescueStrategyCS#rescue-angioplasty
* StrokeRescueStrategyCS#rescue-thrombolysis
* StrokeRescueStrategyCS#rescue-other
