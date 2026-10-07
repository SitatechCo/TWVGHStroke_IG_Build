CodeSystem: StrokeAspirationStrategyCS
Id: aspiration-strategy
Title: "腦中風－抽吸取栓策略代碼"
Description: "此 CodeSystem 定義抽吸取栓策略。代碼 1 至 3 為策略類別；代碼 4 為補充選項，與代碼 1 至 3 分開記錄。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.138471023745947078534167752297566659012"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "只用抽吸導管" "僅使用抽吸導管取栓（Aspiration catheter only）。"
* #2 "Solumbra（支架取栓器合併抽吸）" "同時使用支架取栓器與抽吸導管取栓（Solumbra 技術）。"
* #3 "混合使用" "混合使用不同取栓方式。"
* #4 "先抽吸再救援" "先抽吸取栓，再接續救援治療；此選項與代碼 1 至 3 分開記錄。"
