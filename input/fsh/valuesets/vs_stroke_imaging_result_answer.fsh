ValueSet: StrokeImagingResultAnswerVS
Id: stroke-imaging-result-answer
Title: "腦中風－影像判讀結果答案值集"
Description: "此 ValueSet 整合 StrokeImagingResult 各項目的答案代碼，綁定至該 Profile 的 valueCodeableConcept（required）。ASPECTS 影響側（aspects-affected-side）與 CTA 影響側（cta-affected-side）填 StrokeAffectedSideCS；多期 CTA 側枝循環分級（mcta-collateral-grade）填 StrokeMctaCollateralCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.15536784228180195729473865230747294272"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeAffectedSideCS
* include codes from system StrokeMctaCollateralCS
