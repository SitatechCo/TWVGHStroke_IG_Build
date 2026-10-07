Extension: StrokeAssessmentSequence
Id: assessment-sequence
Title: "腦中風－評估序號"
Description: "此 Extension 保留來源記錄的評估序號，例如同一病人的第幾次 NIHSS 或 mRS 評估。臨床時點另以 StrokeAssessmentPhase 記錄。"
Context: Observation
* ^status = #draft
* ^experimental = false
* . ^short = "來源評估序號"
* . ^definition = "來源記錄的評估次數序號。評估時點另以 StrokeAssessmentPhase 記錄。"
* extension 0..0
* value[x] 1..1 MS
* value[x] only positiveInt
* value[x] ^short = "評估序號。[應填入 1 以上的整數]"
* value[x] ^definition = "依來源原樣填入評估序號；來源空白時不填本 Extension。mRS 序號 1 至 9 只保留序號；若評估時點沒有其他依據，StrokeAssessmentPhase 填 unclassified。"
