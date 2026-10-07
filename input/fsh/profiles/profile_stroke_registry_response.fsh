Profile: StrokeRegistryResponse
Parent: $TWCoreQuestionnaireResponse
Id: StrokeRegistryResponse
Title: "腦中風－登錄表單回覆"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 QuestionnaireResponse Resource，以呈現腦中風登錄表單的回覆，包括登錄識別碼、表單狀態、無法轉成臨床資源的欄位，以及來源原始值備份。"
* ^status = #draft
* ^purpose = "每個來源、每份表單、每位個案各建一筆。個管系統每個個管事件建一筆；EVT 登錄每位個案的主表與追蹤表各建一筆，各自記錄狀態；RAPID 每次掃描建一筆。回覆內容分兩類：無法轉成臨床資源的欄位歸為正規化題目，以 linkId 的 Slice 定義；來源原值以字串存入原始值群組（raw.*），供追溯與重新轉換。可轉成臨床資源的資料（診斷、評估、處置、用藥等），請以對應的臨床 Profile 呈現。"

// 識別碼
* identifier MS
* identifier ^short = "來源登錄識別碼。[個管流水序號或 EVT 登錄個案識別碼]"
* identifier ^definition = "原樣填入來源系統給這份登錄資料的識別碼。個管系統回覆填個管流水序號；EVT 登錄的主表與追蹤表回覆都填 EVT 登錄個案識別碼。RAPID 回覆或來源沒有識別碼時不填。"
* identifier.system 1..1 MS
* identifier.system ^short = "識別碼系統。[依來源填入固定的系統網址]"
* identifier.system ^definition = "個管流水序號與 EVT 登錄個案識別碼各用一個固定的系統網址。範例使用 http://www.vghks.gov.tw/stroke-case-management-serial（個管流水序號）與 http://www.vghks.gov.tw/evt-registry-id（EVT 登錄個案識別碼）。"
* identifier.value 1..1 MS
* identifier.value ^short = "識別碼。[原樣填入來源序號]"
* identifier.value ^definition = "原樣填入來源序號並保留前置零。個管流水序號須搭配病歷號才能識別個案，subject 須指向對應的病人。"

// 表單
* questionnaire MS
* questionnaire = "http://vgh-stroke-ig.fhir.tw/Questionnaire/stroke-registry|0.1.0" (exactly)
* questionnaire ^short = "所回答的表單。[固定為 stroke-registry 表單 0.1.0 版]"
* questionnaire ^definition = "所有來源都使用同一份表單，固定填入 http://vgh-stroke-ig.fhir.tw/Questionnaire/stroke-registry|0.1.0。"

* status MS
* status ^short = "表單狀態。[應填入 in-progress 或 completed]"
* status ^definition = "依來源的表單登錄狀態填寫：來源為 1（表單暫存）填 in-progress；來源為 2（已結案）且確認結案事實填 completed。來源空白、代碼無法辨識或來源沒有表單狀態（個管系統、RAPID）時填 in-progress，原始代碼保留在原始值群組。EVT 主表與追蹤表各自依登錄狀態填寫。資料若更正或作廢，改填 amended 或 entered-in-error。"

* subject 1..1 MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"
* subject ^definition = "表單所屬的病人，必填，參照 StrokePatient。"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "表單所屬的就醫事件，確定是同一次就醫時才填。"

* authored 1..1 MS
* authored ^short = "資料登錄日期時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區；來源沒有登錄日期時改填 data-absent-reason]"
* authored ^definition = "必填來源記錄的資料登錄日期與時間：直接填值，或以 data-absent-reason 擴充表示缺值。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在 authored 上，並存於原始值群組（EVT 主表為 raw.evt.administration.keyinDate）；確認後填完整日期時間並帶時區（例如 +08:00）。來源沒有登錄日期（例如個管系統、RAPID）時，authored 不填值，改以 data-absent-reason（unknown）表示。確認 EVT 的登錄日期時間是否適用追蹤表前，追蹤表的 authored 也以 data-absent-reason 表示。"
* authored.extension contains $DataAbsentReasonExt named dataAbsentReason 0..1 MS
* authored.extension[dataAbsentReason] ^short = "登錄時間缺值原因。[來源沒有登錄日期時填 unknown]"
* authored.extension[dataAbsentReason] ^definition = "來源沒有登錄日期時使用，valueCode 填 unknown，此時 authored 不填值。若 authored 已填日期或完整日期時間，則不填本擴充。"

* author MS
* author only Reference(StrokePractitioner or StrokeOrganization)
* author ^short = "登錄者。[應參照 StrokePractitioner 或 StrokeOrganization]"
* author ^definition = "填入登錄這份表單的人員或院所。只知道姓名時填 author.display 即可，不另建 Practitioner；不知道時不填。登錄經手人員另記錄於 StrokeProvenance。"

* source only Reference(StrokePatient or StrokePractitioner)
* source ^short = "回答資料的提供者。[通常不填；若填，應參照 StrokePatient 或 StrokePractitioner]"
* source ^definition = "實際提供回答內容的人。登錄資料多摘錄自病歷，平時不填；明確由病人本人或特定醫事人員提供時才填。"

// 題目
* item MS
* item ^short = "表單題目與回答"
* item ^definition = "題目與回答分兩類。正規化題目：下列各 Slice，linkId 固定，答案型別依各 Slice 規定；原始值群組：包含 raw.ncva（個管系統）、raw.evt（EVT 登錄）、raw.rapid（RAPID），均以字串保存來源原值。每份回覆只填該來源有的題目。所有 linkId 都必須存在於 stroke-registry 表單，並依表單順序排列。來源空白時略過該題；來源值無法辨識時（例如是否題出現 0、1 以外的值、選項題出現未定義代碼），不填正規化題目，只存於原始值群組。"
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #open
* item ^slicing.ordered = false
* item ^slicing.description = "依 linkId 區分正規化題目與原始值群組"
* item contains
    consent 0..1 MS and
    consentDate 0..1 MS and
    signDnr 0..1 MS and
    beforeEvtIvtpa 0..1 MS and
    rapidRequestNo 0..1 MS and
    dischargeTransferHospital 0..1 MS and
    threeMonthHospital 0..1 MS and
    followUpVisitHospital 0..1 MS and
    recurrentStrokeHospital 0..1 MS and
    unresolvedComaScaleCol19 0..1 MS and
    unresolvedMrsCol06 0..1 MS and
    unresolvedMrsCol07 0..1 MS and
    rawNcva 0..1 MS and
    rawEvt 0..1 MS and
    rawRapid 0..1 MS

// 研究同意書簽署狀態
* item[consent] ^short = "研究同意書簽署狀態。[適用 EVT 登錄主表]"
* item[consent] ^definition = "記錄病人是否已簽署研究同意書。只記錄簽署事實，不據此建立 Consent。"
* item[consent].linkId = "demographics.consent" (exactly)
* item[consent].item 0..0
* item[consent].answer 1..1 MS
* item[consent].answer.item 0..0
* item[consent].answer.value[x] 1..1 MS
* item[consent].answer.value[x] only boolean
* item[consent].answer.value[x] ^short = "是否已簽署。[true＝已簽署；false＝無簽署]"
* item[consent].answer.value[x] ^definition = "來源為 1（已簽署）填 true；0（無簽署）填 false。來源空白時略過本題；其他值只存於原始值群組。"

// 研究同意書簽署日期
* item[consentDate] ^short = "研究同意書簽署日期。[適用 EVT 登錄主表]"
* item[consentDate] ^definition = "填入研究同意書簽署日期，只保存在表單。待取得實際同意文件與同意範圍後，才另建 Consent。"
* item[consentDate].linkId = "demographics.consentDate" (exactly)
* item[consentDate].item 0..0
* item[consentDate].answer 1..1 MS
* item[consentDate].answer.item 0..0
* item[consentDate].answer.value[x] 1..1 MS
* item[consentDate].answer.value[x] only date
* item[consentDate].answer.value[x] ^short = "簽署日期。[YYYY-MM-DD，西元年月日]"
* item[consentDate].answer.value[x] ^definition = "西元年月日，格式為 YYYY-MM-DD。來源空白時略過本題；日期格式不正確時只存於原始值群組。"

// 住院期間簽署 DNR
* item[signDnr] ^short = "住院期間簽署 DNR。[適用個管系統]"
* item[signDnr] ^definition = "記錄住院期間是否簽署 DNR（不施行心肺復甦術）意願書。只記錄簽署註記，不據此建立醫囑或 Consent。"
* item[signDnr].linkId = "inpatientTreatment.tre09" (exactly)
* item[signDnr].item 0..0
* item[signDnr].answer 1..1 MS
* item[signDnr].answer.item 0..0
* item[signDnr].answer.value[x] 1..1 MS
* item[signDnr].answer.value[x] only boolean
* item[signDnr].answer.value[x] ^short = "是否簽署。[true＝有；false＝無]"
* item[signDnr].answer.value[x] ^definition = "來源為 1（有）填 true；0（無）填 false。來源空白時略過本題；其他值只存於原始值群組。"

// EVT 前 IV-tPA 施打院所
* item[beforeEvtIvtpa] ^short = "EVT 前施打 IV-tPA 的院所。[適用 EVT 登錄主表]"
* item[beforeEvtIvtpa] ^definition = "EVT 前是否施打 IV-tPA 及施打院所共有三種選項。選 1 或 2 且施打時間、劑量等資料齊全時，另以 StrokeMedicationAdministration 記錄給藥；選 3 則只保留在本題，不另建未給藥紀錄。"
* item[beforeEvtIvtpa].linkId = "preEvt.beforeEvtIvtpa" (exactly)
* item[beforeEvtIvtpa].item 0..0
* item[beforeEvtIvtpa].answer 1..1 MS
* item[beforeEvtIvtpa].answer.item 0..0
* item[beforeEvtIvtpa].answer.value[x] 1..1 MS
* item[beforeEvtIvtpa].answer.value[x] only Coding
* item[beforeEvtIvtpa].answer.value[x] from StrokePreEvtIvtpaSiteVS (required)
* item[beforeEvtIvtpa].answer.value[x] ^short = "施打院所。[應填入 StrokePreEvtIvtpaSiteVS 代碼：1｜2｜3]"
* item[beforeEvtIvtpa].answer.value[x] ^definition = "system 填 http://vgh-stroke-ig.fhir.tw/CodeSystem/pre-evt-ivtpa-site。代碼可填 1（本院施打）、2（他院施打）、3（未施打）。來源空白請省略本題；其他代碼只保留在原始值群組。"

// RAPID 影像申請序號
* item[rapidRequestNo] ^short = "RAPID 影像申請序號。[適用 RAPID]"
* item[rapidRequestNo] ^definition = "原樣保留 RAPID 影像分析資料的申請序號。在確認此序號是檢查的 accession number、醫令號或檢查項目碼之前，請勿寫入 ImagingStudy 或 ServiceRequest 的識別碼。"
* item[rapidRequestNo].linkId = "rapid.rpreqno" (exactly)
* item[rapidRequestNo].item 0..0
* item[rapidRequestNo].answer 1..1 MS
* item[rapidRequestNo].answer.item 0..0
* item[rapidRequestNo].answer.value[x] 1..1 MS
* item[rapidRequestNo].answer.value[x] only string
* item[rapidRequestNo].answer.value[x] ^short = "申請序號。[原樣填入]"
* item[rapidRequestNo].answer.value[x] ^definition = "原樣填入並保留前置零。來源空白請省略本題。"

// 離院轉入醫院
* item[dischargeTransferHospital] ^short = "離院轉入醫院。[適用 EVT 登錄主表]"
* item[dischargeTransferHospital] ^definition = "離院去向為轉院時填寫的轉入醫院名稱。院所主檔核定後，可另填入 StrokeEncounter 的 hospitalization.destination.display。"
* item[dischargeTransferHospital].linkId = "discharge.leavePlaceHospital" (exactly)
* item[dischargeTransferHospital].item 0..0
* item[dischargeTransferHospital].answer 1..1 MS
* item[dischargeTransferHospital].answer.item 0..0
* item[dischargeTransferHospital].answer.value[x] 1..1 MS
* item[dischargeTransferHospital].answer.value[x] only string
* item[dischargeTransferHospital].answer.value[x] ^short = "醫院名稱。[自由文字，原樣填入]"
* item[dischargeTransferHospital].answer.value[x] ^definition = "原樣填入醫院名稱。來源空白請省略本題。"

// 中風後 3 個月所在醫院
* item[threeMonthHospital] ^short = "中風後 3 個月所在醫院。[適用 EVT 登錄追蹤表]"
* item[threeMonthHospital] ^definition = "填寫中風後 3 個月追蹤時，病人所在的醫院名稱。"
* item[threeMonthHospital].linkId = "followUp3Month.traceThreePlaceHospital" (exactly)
* item[threeMonthHospital].item 0..0
* item[threeMonthHospital].answer 1..1 MS
* item[threeMonthHospital].answer.item 0..0
* item[threeMonthHospital].answer.value[x] 1..1 MS
* item[threeMonthHospital].answer.value[x] only string
* item[threeMonthHospital].answer.value[x] ^short = "醫院名稱。[自由文字，原樣填入]"
* item[threeMonthHospital].answer.value[x] ^definition = "原樣填入醫院名稱。來源空白請省略本題。"

// 追蹤回診醫院
* item[followUpVisitHospital] ^short = "追蹤回診醫院。[適用 EVT 登錄追蹤表]"
* item[followUpVisitHospital] ^definition = "填寫追蹤期間病人繼續回診服藥的醫院名稱。"
* item[followUpVisitHospital].linkId = "followUpEvent.traceTreat1Hospital" (exactly)
* item[followUpVisitHospital].item 0..0
* item[followUpVisitHospital].answer 1..1 MS
* item[followUpVisitHospital].answer.item 0..0
* item[followUpVisitHospital].answer.value[x] 1..1 MS
* item[followUpVisitHospital].answer.value[x] only string
* item[followUpVisitHospital].answer.value[x] ^short = "醫院名稱。[自由文字，原樣填入]"
* item[followUpVisitHospital].answer.value[x] ^definition = "原樣填入醫院名稱。來源空白請省略本題。"

// 再中風就醫醫院
* item[recurrentStrokeHospital] ^short = "再中風就醫醫院。[適用 EVT 登錄追蹤表]"
* item[recurrentStrokeHospital] ^definition = "填寫追蹤期間再中風時，病人就醫的醫院名稱。"
* item[recurrentStrokeHospital].linkId = "followUpEvent.traceTreat2StrokeHospital" (exactly)
* item[recurrentStrokeHospital].item 0..0
* item[recurrentStrokeHospital].answer 1..1 MS
* item[recurrentStrokeHospital].answer.item 0..0
* item[recurrentStrokeHospital].answer.value[x] 1..1 MS
* item[recurrentStrokeHospital].answer.value[x] only string
* item[recurrentStrokeHospital].answer.value[x] ^short = "醫院名稱。[自由文字，原樣填入]"
* item[recurrentStrokeHospital].answer.value[x] ^definition = "原樣填入醫院名稱。來源空白請省略本題。"

// 待確認的額外欄位
* item[unresolvedComaScaleCol19] ^short = "昏迷指數與生命徵象的額外欄位（第 19 欄）。[適用個管系統]"
* item[unresolvedComaScaleCol19] ^definition = "記錄個管系統昏迷指數與生命徵象資料中，實際檔案比譯碼簿多出的一欄。"
* item[unresolvedComaScaleCol19].linkId = "unresolved.NCVA.COMASCALE.UNNAMED_COL_19" (exactly)
* item[unresolvedComaScaleCol19].item 0..0
* item[unresolvedComaScaleCol19].answer 1..1 MS
* item[unresolvedComaScaleCol19].answer.item 0..0
* item[unresolvedComaScaleCol19].answer.value[x] 1..1 MS
* item[unresolvedComaScaleCol19].answer.value[x] only string
* item[unresolvedComaScaleCol19].answer.value[x] ^short = "原始值。[原樣填入]"
* item[unresolvedComaScaleCol19].answer.value[x] ^definition = "完整填入原始字串。來源空白請省略本題。"

* item[unresolvedMrsCol06] ^short = "mRS 評估的額外欄位（第 6 欄）。[適用個管系統]"
* item[unresolvedMrsCol06] ^definition = "個管系統 mRS 評估資料中，實際檔案比譯碼簿多出的第一欄。單一個管事件可有多筆 mRS 評估，每筆非空白值各填一個 answer；各值對應哪一筆評估，以原始值群組 raw.ncva.mrs 為準。"
* item[unresolvedMrsCol06].linkId = "unresolved.NCVA.mRS.UNNAMED_COL_06" (exactly)
* item[unresolvedMrsCol06].item 0..0
* item[unresolvedMrsCol06].answer 1..* MS
* item[unresolvedMrsCol06].answer.item 0..0
* item[unresolvedMrsCol06].answer.value[x] 1..1 MS
* item[unresolvedMrsCol06].answer.value[x] only string
* item[unresolvedMrsCol06].answer.value[x] ^short = "原始值。[原樣填入]"
* item[unresolvedMrsCol06].answer.value[x] ^definition = "完整填入原始字串，空白值不填。"

* item[unresolvedMrsCol07] ^short = "mRS 評估的額外欄位（第 7 欄）。[適用個管系統]"
* item[unresolvedMrsCol07] ^definition = "個管系統 mRS 評估資料中，實際檔案比譯碼簿多出的第二欄。單一個管事件可有多筆 mRS 評估，每筆非空白值各填一個 answer；各值對應哪一筆評估，以原始值群組 raw.ncva.mrs 為準。"
* item[unresolvedMrsCol07].linkId = "unresolved.NCVA.mRS.UNNAMED_COL_07" (exactly)
* item[unresolvedMrsCol07].item 0..0
* item[unresolvedMrsCol07].answer 1..* MS
* item[unresolvedMrsCol07].answer.item 0..0
* item[unresolvedMrsCol07].answer.value[x] 1..1 MS
* item[unresolvedMrsCol07].answer.value[x] only string
* item[unresolvedMrsCol07].answer.value[x] ^short = "原始值。[原樣填入]"
* item[unresolvedMrsCol07].answer.value[x] ^definition = "完整填入原始字串，空白值不填。"

// 原始值群組
* item[rawNcva] ^short = "個管系統原始值。[linkId 固定為 raw.ncva]"
* item[rawNcva] ^definition = "收納個管系統的來源原始值。下層請依個管系統邏輯模型（StrokeCaseManagementLM）元素排列：識別欄位與各欄位為字串題目，資料表為群組題目。linkId 為 `raw.ncva.<邏輯模型元素路徑>`，例如 raw.ncva.caseMain.occdate。NIHSS 與 mRS 評估每一列各建一個群組。所有值一律填入 valueString（包含代碼、日期、時間與數字）；去除前後空白，其餘不改寫；空白欄位直接省略。"
* item[rawNcva].linkId = "raw.ncva" (exactly)
* item[rawNcva].answer 0..0
* item[rawNcva].item 1..* MS
* item[rawNcva].item.answer.value[x] only string
* item[rawNcva].item.item.answer.value[x] only string
* item[rawNcva].item.item.item 0..0

* item[rawEvt] ^short = "EVT 登錄原始值。[linkId 固定為 raw.evt]"
* item[rawEvt] ^definition = "收納 EVT 登錄的來源原始值。下層請依 EVT 登錄邏輯模型（StrokeEvtRegistryLM）元素排列：個案識別碼與各欄位為字串題目，欄位分組為群組題目。linkId 為 `raw.evt.<邏輯模型元素路徑>`，例如 raw.evt.demographics.consent。主表回覆放追蹤以外的欄位；追蹤表回覆放個案識別碼、追蹤表登錄狀態，以及 3 個月追蹤與追蹤醫療事件的欄位。值一律填入 valueString；去除前後空白，其餘不改寫；空白欄位直接省略。"
* item[rawEvt].linkId = "raw.evt" (exactly)
* item[rawEvt].answer 0..0
* item[rawEvt].item 1..* MS
* item[rawEvt].item.answer.value[x] only string
* item[rawEvt].item.item.answer.value[x] only string
* item[rawEvt].item.item.item 0..0

* item[rawRapid] ^short = "RAPID 原始值。[linkId 固定為 raw.rapid]"
* item[rawRapid] ^definition = "收納 RAPID 影像分析的來源原始值。下層請依 RAPID 邏輯模型（StrokeRapidLM）元素排列，每個欄位建一個字串題目，linkId 為 `raw.rapid.<邏輯模型元素路徑>`，例如 raw.rapid.scantype。值一律填入 valueString；去除前後空白，其餘不改寫，9999 等特殊值也照填；空白欄位直接省略。"
* item[rawRapid].linkId = "raw.rapid" (exactly)
* item[rawRapid].answer 0..0
* item[rawRapid].item 1..* MS
* item[rawRapid].item.answer.value[x] only string
* item[rawRapid].item.item 0..0
