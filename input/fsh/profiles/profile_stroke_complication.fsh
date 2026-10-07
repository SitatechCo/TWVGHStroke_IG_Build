Profile: StrokeComplication
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeComplication
Title: "腦中風－住院併發症與惡化"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人住院期間的併發症、中風惡化與神經學惡化原因。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄住院期間併發症（肺炎、敗血症、泌尿道感染等）、中風惡化及神經學惡化原因。每個項目建立一筆 Observation，以 code 區分；有發生填 valueBoolean = true，沒有填 false。同一來源、同一病人、同一項目在同一評估時點限建一筆；不同來源待確認病人與就醫事件串接方式後再合併。兩種中風惡化代碼判定標準不同，須分開記錄。來源空白時不建立；無法辨識的來源代碼，原值保留在登錄表單（StrokeRegistryResponse）。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，本 Profile 可不填]"
* extension[assessmentPhase] ^definition = "住院併發症與惡化涵蓋整段住院期間，不屬特定評估時點，可不填；若需註記但無法確認時點，填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeComplicationCodeVS (required)
* code ^short = "併發症或惡化項目。[應填入 StrokeComplicationCodeVS 的代碼]"
* code ^definition = """
本筆 Observation 記錄的項目，一筆只填一項，包括：

- 住院併發症：無住院併發症（no-complication）、肺炎（complication-pneumonia）、敗血症（complication-sepsis）、泌尿道感染（complication-urinary-tract-infection）、急性冠心症（complication-acute-coronary-syndrome）、上消化道出血（complication-upper-gi-bleeding）、癲癇發作（complication-seizure）、腎衰竭（complication-renal-failure）、深部靜脈栓塞（complication-deep-vein-thrombosis）、其他併發症（complication-other）與其名稱（complication-other-name）。
- 中風惡化：判定標準為 NIHSS 增加至少 2 分填 neurologic-deterioration-nihss-2-or-more；判定標準與計算區間未確認填 neurologic-deterioration-criteria-unspecified。兩者定義不同，分開記錄。
- 神經學惡化原因：腦疝脫（deterioration-cause-herniation）、36 小時內出血性梗塞（deterioration-cause-hemorrhagic-infarct-36h）、血腫擴大（deterioration-cause-hematoma-expansion）、血管痙攣（deterioration-cause-vasospasm）、再出血（deterioration-cause-rebleeding）、內科問題（deterioration-cause-medical-problem）。
"""
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 complication-pneumonia]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "發生併發症或惡化的住院就醫事件。可確認就醫事件時填寫。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "記錄日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "記錄或確認日期，至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。來源無日期時不填。"

* value[x] MS
* value[x] only boolean or string
* value[x] ^short = "觀察值。[依 code 填入 valueBoolean 或 valueString]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

**valueBoolean（有／沒有）**：來源 1 填 true、0 填 false；其他代碼原值保留在登錄表單（StrokeRegistryResponse）。適用：肺炎（complication-pneumonia）、敗血症（complication-sepsis）、泌尿道感染（complication-urinary-tract-infection）、急性冠心症（complication-acute-coronary-syndrome）、上消化道出血（complication-upper-gi-bleeding）、癲癇發作（complication-seizure）、腎衰竭（complication-renal-failure）、深部靜脈栓塞（complication-deep-vein-thrombosis）、其他併發症（complication-other）、兩種中風惡化（neurologic-deterioration-nihss-2-or-more、neurologic-deterioration-criteria-unspecified），以及六項神經學惡化原因（deterioration-cause-herniation、deterioration-cause-hemorrhagic-infarct-36h、deterioration-cause-hematoma-expansion、deterioration-cause-vasospasm、deterioration-cause-rebleeding、deterioration-cause-medical-problem）。

**valueBoolean（勾選註記）**：無住院併發症（no-complication）。來源有勾選填 true，未勾選不建立。

**valueString**：其他住院併發症名稱（complication-other-name），原樣填入來源文字。
"""
* valueBoolean ^short = "是否發生。[true＝有，false＝沒有]"
* valueString ^short = "其他併發症名稱。[原樣填入來源文字]"
* valueString ^definition = "原樣填入來源文字，不列入醫事機構名稱、病人與醫師姓名等資訊。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[本 Profile 不需填寫]"
* dataAbsentReason ^definition = "本 Profile 沒有「不確定」選項。來源空白時不建立 Observation。"
