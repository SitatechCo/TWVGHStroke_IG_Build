Profile: StrokeRiskFactor
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeRiskFactor
Title: "腦中風－危險因子與病史"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現腦中風病人的危險因子與病史，包括高血壓、糖尿病、既往中風、心臟病史、家族病史、吸菸量與吸菸年數。"
* ^status = #draft
* ^experimental = false
* ^purpose = "記錄登錄表單的危險因子、心臟病史與家族病史。每個項目各建一筆 Observation，以 code 區分。有病史填 valueBoolean = true，無病史填 false；陰性結果不另建 Condition。來源不確定時不填值，改填 dataAbsentReason。同一來源、病人與項目在同一評估時點只建一筆。目前或過去吸菸狀態另用 StrokeSmokingStatus。"

* extension contains StrokeAssessmentPhase named assessmentPhase 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[選填，應填入 StrokeAssessmentPhaseVS 的代碼]"
* extension[assessmentPhase] ^definition = "項目所屬的臨床時點。入院時登錄的病史可填 admission；時點無法確認時填 unclassified。"

* status MS
* status ^short = "結果狀態。[應填入 final、amended 或 unknown]"
* status ^definition = "依資料確認狀態填寫：已確認填 final；更正後填 amended；無法掌握填 unknown。"

* category[survey] ^short = "類別：調查評估。[固定填入 survey]"

* code MS
* code from StrokeRiskFactorCodeVS (required)
* code ^short = "危險因子或病史項目。[應填入 StrokeRiskFactorCodeVS 的代碼]"
* code ^definition = """
記錄危險因子或病史項目，每筆 Observation 限填一項。涵蓋個人病史（如 hypertension-history）、心臟病史（如 atrial-fibrillation-history）、家族病史（family-history-*）與吸菸量（cigarettes-per-day、smoking-duration）。

急性心肌梗塞依登錄定義分兩個代碼：限本次中風前 4 週內發生填 acute-mi-within-4-weeks；未限定期間填 acute-mi-history。兩者定義不同，分開記錄。
"""
* code.coding 1..1 MS
* code.coding.system 1..1 MS
* code.coding.system = "http://vgh-stroke-ig.fhir.tw/CodeSystem/stroke-observation"
* code.coding.system ^short = "代碼系統。[固定填入 StrokeObservationCS 的 URL]"
* code.coding.code 1..1 MS
* code.coding.code ^short = "項目代碼。[例如 hypertension-history]"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "登錄此病史的就醫事件。可確認就醫事件時填寫。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "登錄日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "項目的登錄或評估日期，至少填到日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素上，並保存在 StrokeRegistryResponse 的原始值題目；時區確認後填完整日期時間與時區（例如 +08:00）。只有時間、無日期時不填。"

* value[x] MS
* value[x] only boolean or Quantity or string
* value[x] ^short = "觀察值。[依 code 填入 valueBoolean、valueQuantity 或 valueString]"
* value[x] ^definition = """
依 code 填入對應型別。來源空白時不建立 Observation。

**valueBoolean（可為不確定）**：來源 1（有）填 true，0（沒有）填 false；2（不確定、不知道）不填值，改填 dataAbsentReason = unknown。適用：高血壓病史（hypertension-history）、糖尿病病史（diabetes-history）、既往腦中風病史（prior-stroke-history）、既往短暫性腦缺血病史（prior-tia-history）、心臟病病史（heart-disease-history）、慢性腎臟病病史（chronic-kidney-disease-history）、周邊動脈疾病病史（peripheral-artery-disease-history）、血脂異常病史（dyslipidemia-history）、吸菸史（smoking-history）、飲酒史（alcohol-use-history）、癌症病史（cancer-history）、其他危險因子（other-risk-factor），以及家族病史：高血壓（family-history-hypertension）、糖尿病（family-history-diabetes）、缺血性心臟病（family-history-ischemic-heart-disease）、中風或短暫性腦缺血（family-history-stroke-or-tia）。

**valueBoolean（只有是／否）**：來源 1 填 true，0 填 false；其餘代碼原值保留在登錄表單（StrokeRegistryResponse）。適用：高血壓為本次新診斷（hypertension-newly-diagnosed）、糖尿病為本次新診斷（diabetes-newly-diagnosed）、既往腦梗塞病史（prior-cerebral-infarction-history）、既往腦出血病史（prior-cerebral-hemorrhage-history）、透析治療（dialysis-treatment）、高三酸甘油脂血症病史（hypertriglyceridemia-history）、高膽固醇血症病史（hypercholesterolemia-history）、紅血球增多症病史（polycythemia-history）、尿毒症病史（uremia-history）、心房顫動病史（atrial-fibrillation-history）、心房顫動為本次新診斷（atrial-fibrillation-newly-diagnosed）、缺血性心臟病病史（ischemic-heart-disease-history）、4 週內急性心肌梗塞（acute-mi-within-4-weeks）、急性心肌梗塞病史（acute-mi-history）、心瓣膜疾病病史（valvular-heart-disease-history）、心衰竭病史（heart-failure-history）、瓣膜置換病史（valve-replacement-history）、機械瓣膜（mechanical-heart-valve）、人工瓣膜（prosthetic-heart-valve）、心內膜炎病史（endocarditis-history）、心臟黏液瘤病史（cardiac-myxoma-history）、風濕性心臟病病史（rheumatic-heart-disease-history）、開放性卵圓孔（patent-foramen-ovale）。

**valueBoolean（勾選註記）**：無心臟病（no-heart-disease）。來源有勾選填 true，未勾選不建立。

**valueQuantity**：每日吸菸量（cigarettes-per-day），單位 {cigarette}/d（支／天）；吸菸年數（smoking-duration），單位 a（年）。

**valueString**：原樣填入來源文字。適用：癌症名稱（cancer-name）、其他危險因子名稱（other-risk-factor-name）、心瓣膜疾病名稱（valvular-heart-disease-name）、其他心臟病（other-heart-disease）、其他心臟病名稱（other-heart-disease-name）。
"""
* valueBoolean ^short = "有無此病史或危險因子。[true＝有，false＝沒有]"
* valueQuantity.value 1..1 MS
* valueQuantity.value ^short = "數值。[例如 20]"
* valueQuantity.unit MS
* valueQuantity.unit ^short = "單位顯示文字。[每日吸菸量填 {cigarette}/d；吸菸年數可填 年]"
* valueQuantity.unit ^definition = "單位的顯示文字。每日吸菸量的 UCUM 代碼含註記 {cigarette}，顯示文字亦包含此註記，填 {cigarette}/d。"
* valueQuantity.system MS
* valueQuantity.system ^short = "單位系統。[應填入 http://unitsofmeasure.org]"
* valueQuantity.system ^definition = "確認來源單位後填入 http://unitsofmeasure.org，並同時填 code。"
* valueQuantity.code MS
* valueQuantity.code ^short = "UCUM 單位代碼。[每日吸菸量填 {cigarette}/d；吸菸年數填 a]"
* valueString ^short = "文字內容。[原樣填入來源文字]"
* valueString ^definition = "原樣填入來源文字，不列入醫事機構名稱、病人與醫師姓名等資訊。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[來源為不確定時填入 unknown]"
* dataAbsentReason ^definition = "僅用於可為不確定的項目（見 value[x] 說明）。來源為 2（不確定、不知道）時，不填 value[x]，改填 http://terminology.hl7.org/CodeSystem/data-absent-reason#unknown。來源空白則不建立 Observation。"
