Extension: StrokeAssessmentPhase
Id: assessment-phase
Title: "腦中風－評估時點"
Description: "此 Extension 記錄 Observation 評估所屬的臨床時點，例如入院、出院、施針前、治療後 24 小時、中風前或 3 個月追蹤。只在來源本身已標明時點時使用；個管系統的 NIHSS 與 mRS 評估不填。"
Context: Observation
* ^status = #draft
* ^experimental = false
* . ^short = "評估時點"
* . ^definition = "評估所屬的臨床時點。來源已標明時點時，同一量表在不同時點各建一筆 Observation，並以本 Extension 區分；來源沒有時點資訊時不填。"
* extension 0..0
* value[x] 1..1 MS
* value[x] only code
* value[x] ^short = "評估時點代碼。[應填入 StrokeAssessmentPhaseVS 的代碼]"
* value[x] ^definition = "可填 admission（入院）、discharge（出院）、pre-needle（施針前）、24h（治療後 24 小時）、pre-stroke（中風前）、3-month（3 個月追蹤）、unclassified（尚未分類）。來源有時點資訊但無法歸入以上代碼時，填 unclassified。"
* valueCode from StrokeAssessmentPhaseVS (required)
