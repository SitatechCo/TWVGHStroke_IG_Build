Extension: StrokeAssessmentPhase
Id: assessment-phase
Title: "腦中風－評估時點"
Description: "此 Extension 記錄 Observation 評估所屬的臨床時點，例如入院、出院、施針前、治療後 24 小時、中風前或 3 個月追蹤。評估時點與來源評估序號分開記錄。"
Context: Observation
* ^status = #draft
* ^experimental = false
* . ^short = "評估時點"
* . ^definition = "評估所屬的臨床時點。同一量表在不同時點各建一筆 Observation，並以本 Extension 區分。"
* extension 0..0
* value[x] 1..1 MS
* value[x] only code
* value[x] ^short = "評估時點代碼。[應填入 StrokeAssessmentPhaseVS 的代碼]"
* value[x] ^definition = "可填 admission（入院）、discharge（出院）、pre-needle（施針前）、24h（治療後 24 小時）、pre-stroke（中風前）、3-month（3 個月追蹤）、unclassified（尚未分類）。時點無法確認時（例如只有意義未確認的評估序號），填 unclassified。"
* valueCode from StrokeAssessmentPhaseVS (required)
