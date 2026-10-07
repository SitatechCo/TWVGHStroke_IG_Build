ValueSet: StrokeAspirationRescueVS
Id: aspiration-rescue
Title: "腦中風－抽吸失敗後救援策略值集"
Description: "此 ValueSet 列出抽吸取栓未成功後可選的救援策略。原始選項 1 填 rescue-sr，2 填 rescue-angioplasty，3 填 rescue-thrombolysis，4 填 rescue-other。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.156996395818161374295049548474274325940"
* ^status = #draft
* ^experimental = false
* StrokeRescueStrategyCS#rescue-sr
* StrokeRescueStrategyCS#rescue-angioplasty
* StrokeRescueStrategyCS#rescue-thrombolysis
* StrokeRescueStrategyCS#rescue-other
