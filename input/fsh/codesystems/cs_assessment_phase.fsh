CodeSystem: StrokeAssessmentPhaseCS
Id: assessment-phase
Title: "腦中風－評估時點代碼"
Description: "此 CodeSystem 定義 Observation 評估所屬臨床時點，供 StrokeAssessmentPhase Extension 使用。評估時點與來源評估序號分開記錄。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.227189910350223540092542111451448630827"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #admission "入院" "病人入院時評估。"
* #discharge "出院" "病人出院時評估。"
* #pre-needle "施針前" "施打血栓溶解劑或動脈穿刺前評估。"
* #24h "治療後 24 小時" "急性治療後 24 小時評估。"
* #pre-stroke "中風前" "回溯本次中風發生前的狀態，例如中風前 mRS。"
* #3-month "3 個月追蹤" "中風後 3 個月追蹤評估。"
* #unclassified "尚未分類" "已有評估資料但評估時點尚未確認；例如僅有評估序號、序號意義尚未確認時使用。"
