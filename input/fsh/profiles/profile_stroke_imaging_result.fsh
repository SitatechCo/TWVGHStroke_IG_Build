Profile: StrokeImagingResult
Parent: $TWCoreObservationClinicalResult
Id: StrokeImagingResult
Title: "腦中風－影像判讀結果"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風影像的判讀與灌流分析結果，例如 ASPECTS、灌流體積、mismatch、Tmax、低灌流強度比值（HIR）、影響側與多期 CTA 側枝循環。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每個影像判讀項目各建一筆 Observation，以 code 區分。同一指標若同時來自 EVT 登錄資料與 RAPID 灌流分析，確認檢查配對前各自建一筆。影響側獨立建一筆 Observation；只有在已配對成功的 ASPECTS 或 CTA 結果改用 bodySite.text 記錄時才不另建，兩種寫法擇一。"

* status MS
* status ^short = "結果狀態。[填 final／amended／unknown 等]"
* status ^definition = "判讀結果狀態。來源確認為正式結果填 final，無法確認填 unknown。"

* category MS
* category ^short = "結果類別。[應包含 imaging]"
* category[twcore] 1..1 MS
* category[twcore] = $ObsCategory#imaging
* category[twcore] ^short = "影像類別。[固定為 imaging]"
* category[twcore] ^definition = "必填，固定填 observation-category 的 imaging。"

* code MS
* code ^short = "判讀項目。[strokeObservation Slice 應填入 StrokeImagingResultCodeVS 的代碼]"
* code ^definition = "沿用 TW Core 的 code 綁定（observation-codes，extensible）。每筆都要在 strokeObservation Slice 填一個本 IG 判讀項目代碼。院方核定標準碼（LOINC）後，在同一個 code 另放一個 coding，此 coding 依 TW Core 的 code 綁定檢查。"
* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "依 coding.system 區分本 IG 判讀項目代碼與標準碼"
* code.coding.system 1..1 MS
* code.coding.code 1..1 MS
* code.coding contains strokeObservation 1..1 MS
* code.coding[strokeObservation] ^patternCoding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding[strokeObservation] from StrokeImagingResultCodeVS (required)
* code.coding[strokeObservation] ^short = "本 IG 判讀項目代碼。[應填入 StrokeImagingResultCodeVS 的代碼]"
* code.coding[strokeObservation] ^definition = "必填一個 StrokeObservationCS 代碼。可填：aspects-score（ASPECTS 分數）、perfusion-core-volume（灌流核心梗塞體積）、perfusion-mismatch-volume（灌流 mismatch 體積）、perfusion-mismatch-ratio（灌流 mismatch 比值）、tmax-over-6s-volume（Tmax > 6 秒體積）、hypoperfusion-intensity-ratio（低灌流強度比值）、aspects-affected-side（ASPECTS 影響側）、cta-affected-side（CTA 影響側）、mcta-collateral-grade（多期 CTA 側枝循環分級）。"
* code.coding[strokeObservation].system 1..1 MS
* code.coding[strokeObservation].code 1..1 MS

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "執行此次影像檢查的就醫事件。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "影像檢查日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "產生此結果的影像檢查日期，至少填完整日期。來源只有日期時只填日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。若使用最近一次掃描序列日期，須先確認結果取自該序列。只有年月、無日期或無法確認配對時不填，原值改存登錄表單（StrokeRegistryResponse）。"

* value[x] MS
* value[x] only integer or Quantity or CodeableConcept
* valueInteger ^minValueInteger = 0
* valueInteger ^maxValueInteger = 10
* value[x] ^short = "判讀結果。[依項目填整數、數量或代碼]"
* value[x] ^definition = "依 code 填入對應型別：aspects-score 填 valueInteger（0–10）；perfusion-core-volume、perfusion-mismatch-volume、tmax-over-6s-volume 填 valueQuantity（單位 mL）；perfusion-mismatch-ratio、hypoperfusion-intensity-ratio 填 valueQuantity（單位 1，無單位比值）；aspects-affected-side、cta-affected-side、mcta-collateral-grade 填 valueCodeableConcept。數值照影像分析軟體輸出填寫，來源值為 0 就照填 0。"
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "數值。[照來源原值填寫]"
* valueQuantity.unit MS
* valueQuantity.unit ^short = "單位顯示。[mL 或 1]"
* valueQuantity.system MS
* valueQuantity.system = $UCUM
* valueQuantity.system ^short = "單位系統。[固定為 http://unitsofmeasure.org]"
* valueQuantity.code MS
* valueQuantity.code ^short = "UCUM 單位代碼。[體積填 mL；比值填 1]"
* valueCodeableConcept from StrokeImagingResultAnswerVS (required)
* valueCodeableConcept ^short = "判讀結果代碼。[應填入 StrokeImagingResultAnswerVS 的代碼]"
* valueCodeableConcept ^definition = "aspects-affected-side 與 cta-affected-side 用 StrokeAffectedSideCS：L＝左腦、R＝右腦，text 可填「左腦」或「右腦」。mcta-collateral-grade 用 StrokeMctaCollateralCS：1＝0–2 分、2＝3–4 分、3＝5 分。值域外的來源值不建立 Observation，原值保留在登錄表單。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[無法計算填 unknown]"
* dataAbsentReason ^definition = "mismatch 比值來源為 9999 代表無法計算：不填 valueQuantity，改填 dataAbsentReason = unknown，text 填「來源 9999：無法計算」；比值空白也填 unknown。ASPECTS 若為非數值或特殊數字且來源定義為無法評估，不填 valueInteger，改填缺值原因。其他項目空白則不建立 Observation。"

* derivedFrom MS
* derivedFrom only Reference(StrokeImagingStudy)
* derivedFrom ^short = "來源影像檢查。[應參照 StrokeImagingStudy]"
* derivedFrom ^definition = "產生此結果的影像檢查。確認檢查識別鍵且能對應到同一次檢查時才填。"
