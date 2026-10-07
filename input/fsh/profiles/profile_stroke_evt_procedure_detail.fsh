Profile: StrokeEvtProcedureDetail
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeEvtProcedureDetail
Title: "腦中風－EVT 處置細節"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現動脈內血栓移除術（EVT）的處置細節，包括 EVT 前灌流影像註記、血管解剖與狹窄程度、目標血管、麻醉與鎮靜、取栓技術與救援策略。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄 EVT 過程中無法以 Procedure 表達的細節。EVT 主處置與各子處置（動脈穿刺、支架取栓、抽吸取栓、置放支架等）記錄在 StrokeProcedure；本 Profile 以 partOf 參照 EVT 主處置。每個項目建立一筆 Observation，以 code 區分；同一來源、同一病人、同一項目在同一次 EVT 限建一筆。來源空白時不建立；無法辨識的來源代碼，原值保留在登錄表單（StrokeRegistryResponse）。灌流影像檢查本身記錄在 StrokeImagingStudy；鎮靜藥物名稱與劑量記錄在 StrokeMedicationAdministration。"
* obeys stroke-evt-aspiration-rescue and stroke-evt-stent-retriever-rescue

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，本 Profile 可不填]"
* extension[assessmentPhase] ^definition = "EVT 處置細節屬該次 EVT，不屬特定評估時點，可不填；若需註記但無法確認時點，填 unclassified。"

* partOf MS
* partOf only Reference(StrokeProcedure)
* partOf ^short = "所屬 EVT 處置。[應參照 StrokeProcedure 的 EVT 主處置]"
* partOf ^definition = "填入 EVT 主處置參照，即 code 為 evt 的 StrokeProcedure（例如 Procedure/stroke-procedure-evt-example）。尚未建立 EVT 主處置時可不填。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeEvtProcedureDetailCodeVS (required)
* code ^short = "EVT 處置細節項目。[應填入 StrokeEvtProcedureDetailCodeVS 的代碼]"
* code ^definition = """
本筆 Observation 記錄的項目，一筆只填一項，包括：

- EVT 前灌流影像：未執行灌流影像（no-perfusion-imaging）、執行 CT 灌流影像（ct-perfusion-performed）、執行 MR 灌流影像（mr-perfusion-performed）、以 RAPID 軟體分析（perfusion-analysis-rapid）、以其他軟體分析（perfusion-analysis-other-software）。
- 血管解剖與狹窄：主動脈弓分型（aortic-arch-type）；右、左總頸動脈（right-cca-stenosis、left-cca-stenosis），右、左內頸動脈（right-ica-stenosis、left-ica-stenosis），右、左椎動脈（right-vertebral-artery-stenosis、left-vertebral-artery-stenosis）的狹窄程度。
- 目標血管（target-vessel-*）：頸段內頸動脈（cervical-ica）、內頸動脈末端（ica-terminus）、中大腦動脈 M1／M2／M3 段（m1、m2、m3）、前大腦動脈（aca）、後大腦動脈（pca）、椎動脈（vertebral-artery）各有未分側別、右側（-right）、左側（-left）三個代碼；基底動脈只有 target-vessel-basilar-artery。未分側別與左右側代碼分開記錄。
- 麻醉與鎮靜：全身麻醉（general-anesthesia）、鎮靜（procedural-sedation）。
- EVT 技術與救援：未使用 EVT 治療技術（no-evt-treatment-technique）、球囊導引導管（balloon-guide-catheter）、抽吸取栓策略（aspiration-strategy）與補充選項（aspiration-strategy-supplement）、支架取栓次數（stent-retriever-pass-count）、抽吸失敗後救援策略（aspiration-rescue-strategy）與其他救援方式（aspiration-rescue-other）、支架取栓後救援治療（stent-retriever-rescue-performed）、支架取栓後救援策略（stent-retriever-rescue-strategy）與其他救援方式（stent-retriever-rescue-other）。
"""
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 target-vessel-m1-right]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "填入執行 EVT 的就醫事件。能確認就醫事件時填寫。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "EVT 日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "填入此項目所屬 EVT 的執行日期，可與 partOf 參照的 EVT 主處置相同。至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。若只有時間沒有日期則不填。"

* value[x] MS
* value[x] only boolean or CodeableConcept or string
* value[x] ^short = "觀察值。[依 code 填入 valueBoolean、valueCodeableConcept 或 valueString]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

**valueBoolean（有／沒有）**：來源 1 填 true，0 填 false；其他代碼原值保存在登錄表單（StrokeRegistryResponse）。適用：執行 CT 灌流影像（ct-perfusion-performed）、執行 MR 灌流影像（mr-perfusion-performed）、以 RAPID 軟體分析（perfusion-analysis-rapid）、以其他軟體分析（perfusion-analysis-other-software）、全部目標血管項目（target-vessel-*）、全身麻醉（general-anesthesia）、鎮靜（procedural-sedation）、球囊導引導管（balloon-guide-catheter）、支架取栓後救援治療（stent-retriever-rescue-performed）。

**valueBoolean（勾選註記）**：未執行灌流影像（no-perfusion-imaging）、未使用 EVT 治療技術（no-evt-treatment-technique）。來源有勾選填 true，未勾選則不建立。

**valueCodeableConcept**：主動脈弓分型（aortic-arch-type）、六項血管狹窄程度（*-stenosis）、抽吸取栓策略（aspiration-strategy）與補充選項（aspiration-strategy-supplement）、抽吸失敗後救援策略（aspiration-rescue-strategy）、支架取栓後救援策略（stent-retriever-rescue-strategy）。可用代碼見 valueCodeableConcept 說明。

**valueString**：原樣填入來源文字。適用：支架取栓次數（stent-retriever-pass-count）、抽吸失敗後其他救援方式（aspiration-rescue-other）、支架取栓後其他救援方式（stent-retriever-rescue-other）。
"""
* valueBoolean ^short = "是否成立。[true＝有／是，false＝沒有／否]"
* valueCodeableConcept from StrokeEvtProcedureDetailAnswerVS (required)
* valueCodeableConcept ^short = "代碼值。[應填入 StrokeEvtProcedureDetailAnswerVS 的代碼]"
* valueCodeableConcept ^definition = """
依項目選用對應代碼：

- 主動脈弓分型（aortic-arch-type）：填 StrokeAorticArchTypeCS，1＝第 I 型、2＝第 II 型、3＝第 III 型。
- 血管狹窄程度（right-cca-stenosis、left-cca-stenosis、right-ica-stenosis、left-ica-stenosis、right-vertebral-artery-stenosis、left-vertebral-artery-stenosis）：填 StrokeStenosisGradeCS，1＝狹窄小於 50%、2＝狹窄 50–99%、3＝完全阻塞（100%）。
- 抽吸取栓策略（aspiration-strategy）：填 StrokeAspirationStrategyCS，1＝只用抽吸導管、2＝Solumbra（支架取栓器合併抽吸）、3＝混合使用。
- 抽吸取栓策略補充選項（aspiration-strategy-supplement）：填 StrokeAspirationStrategyCS 的 4＝先抽吸再救援。此項與 aspiration-strategy 分開記錄。
- 抽吸失敗後救援策略（aspiration-rescue-strategy）：限用 StrokeAspirationRescueVS 代碼（由 Invariant stroke-evt-aspiration-rescue 檢查）。來源 1 填 rescue-sr、2 填 rescue-angioplasty、3 填 rescue-thrombolysis、4 填 rescue-other。
- 支架取栓後救援策略（stent-retriever-rescue-strategy）：限用 StrokeStentRetrieverRescueVS 代碼（由 Invariant stroke-evt-stent-retriever-rescue 檢查）。來源 1 填 rescue-aspiration、2 填 rescue-angioplasty、3 填 rescue-thrombolysis、4 填 rescue-other。

救援策略選 rescue-other 時，說明文字另建 aspiration-rescue-other 或 stent-retriever-rescue-other 記錄。
"""
* valueString ^short = "文字內容。[原樣填入來源文字]"
* valueString ^definition = "原樣填入來源文字。支架取栓次數即使是數字也以文字保存。不列入醫事機構名稱、病人及醫師姓名等資訊。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "本 Profile 沒有「不確定」選項。來源空白時不建立 Observation。"

Invariant: stroke-evt-aspiration-rescue
Description: "code 為 aspiration-rescue-strategy 時，valueCodeableConcept 必須有 StrokeRescueStrategyCS 的 coding，且限填 StrokeAspirationRescueVS 代碼：rescue-sr、rescue-angioplasty、rescue-thrombolysis、rescue-other。"
Severity: #error
Expression: "(code.coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation' and code = 'aspiration-rescue-strategy').exists() and value.exists()) implies (value.ofType(CodeableConcept).coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/rescue-strategy').exists() and value.ofType(CodeableConcept).coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/rescue-strategy').all(code = 'rescue-sr' or code = 'rescue-angioplasty' or code = 'rescue-thrombolysis' or code = 'rescue-other'))"

Invariant: stroke-evt-stent-retriever-rescue
Description: "code 為 stent-retriever-rescue-strategy 時，valueCodeableConcept 必須有 StrokeRescueStrategyCS 的 coding，且限填 StrokeStentRetrieverRescueVS 代碼：rescue-aspiration、rescue-angioplasty、rescue-thrombolysis、rescue-other。"
Severity: #error
Expression: "(code.coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation' and code = 'stent-retriever-rescue-strategy').exists() and value.exists()) implies (value.ofType(CodeableConcept).coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/rescue-strategy').exists() and value.ofType(CodeableConcept).coding.where(system = 'http://vgh-stroke-ig.fhir.tw/CodeSystem/rescue-strategy').all(code = 'rescue-aspiration' or code = 'rescue-angioplasty' or code = 'rescue-thrombolysis' or code = 'rescue-other'))"
