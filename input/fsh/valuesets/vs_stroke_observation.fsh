ValueSet: StrokeObservationVS
Id: stroke-observation
Title: "腦中風－觀察項目值集"
Description: "此 ValueSet 包含 StrokeObservationCS 的全部觀察項目代碼。各 Observation Profile 的 code 請改用該 Profile 專屬的項目值集。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.34240302965992990650669271842691468432"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeObservationCS

ValueSet: StrokeAdmissionContextCodeVS
Id: stroke-admission-context-code
Title: "腦中風－就醫背景項目值集"
Description: "此 ValueSet 列出「腦中風－就醫背景」（StrokeAdmissionContext）Observation.code 可用的項目代碼，包括就醫來源、到院方式、未住院註記、病人年齡與教育程度。共 5 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.309330581258340673088207214421798785910"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#admission-source
* include StrokeObservationCS#arrival-mode
* include StrokeObservationCS#not-hospitalized
* include StrokeObservationCS#patient-age
* include StrokeObservationCS#education-level

ValueSet: StrokeOnsetTimeCodeVS
Id: stroke-onset-time-code
Title: "腦中風－發病時間項目值集"
Description: "此 ValueSet 列出「腦中風－發病時間」（StrokeOnsetTime）Observation.code 可用的項目代碼，包括中風發病時間、最後正常時間、發病時間不確定與醒後中風。共 4 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.250921737863850792387778364557190334001"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#stroke-onset-time
* include StrokeObservationCS#onset-time-uncertain
* include StrokeObservationCS#last-known-well
* include StrokeObservationCS#wake-up-stroke

ValueSet: StrokeRiskFactorCodeVS
Id: stroke-risk-factor-code
Title: "腦中風－危險因子與病史項目值集"
Description: "此 ValueSet 列出「腦中風－危險因子與病史」（StrokeRiskFactor）Observation.code 可用的項目代碼，包括高血壓、糖尿病、既往中風、心臟病等病史、家族史，以及吸菸量與吸菸年數。共 47 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.10367967418994035534181687308119628574"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#hypertension-history
* include StrokeObservationCS#hypertension-newly-diagnosed
* include StrokeObservationCS#diabetes-history
* include StrokeObservationCS#diabetes-newly-diagnosed
* include StrokeObservationCS#prior-stroke-history
* include StrokeObservationCS#prior-cerebral-infarction-history
* include StrokeObservationCS#prior-cerebral-hemorrhage-history
* include StrokeObservationCS#prior-tia-history
* include StrokeObservationCS#heart-disease-history
* include StrokeObservationCS#chronic-kidney-disease-history
* include StrokeObservationCS#dialysis-treatment
* include StrokeObservationCS#peripheral-artery-disease-history
* include StrokeObservationCS#dyslipidemia-history
* include StrokeObservationCS#hypertriglyceridemia-history
* include StrokeObservationCS#hypercholesterolemia-history
* include StrokeObservationCS#smoking-history
* include StrokeObservationCS#cigarettes-per-day
* include StrokeObservationCS#smoking-duration
* include StrokeObservationCS#alcohol-use-history
* include StrokeObservationCS#cancer-history
* include StrokeObservationCS#cancer-name
* include StrokeObservationCS#other-risk-factor
* include StrokeObservationCS#other-risk-factor-name
* include StrokeObservationCS#polycythemia-history
* include StrokeObservationCS#uremia-history
* include StrokeObservationCS#family-history-hypertension
* include StrokeObservationCS#family-history-diabetes
* include StrokeObservationCS#family-history-ischemic-heart-disease
* include StrokeObservationCS#family-history-stroke-or-tia
* include StrokeObservationCS#no-heart-disease
* include StrokeObservationCS#atrial-fibrillation-history
* include StrokeObservationCS#atrial-fibrillation-newly-diagnosed
* include StrokeObservationCS#ischemic-heart-disease-history
* include StrokeObservationCS#acute-mi-within-4-weeks
* include StrokeObservationCS#acute-mi-history
* include StrokeObservationCS#valvular-heart-disease-history
* include StrokeObservationCS#valvular-heart-disease-name
* include StrokeObservationCS#heart-failure-history
* include StrokeObservationCS#valve-replacement-history
* include StrokeObservationCS#mechanical-heart-valve
* include StrokeObservationCS#prosthetic-heart-valve
* include StrokeObservationCS#other-heart-disease
* include StrokeObservationCS#other-heart-disease-name
* include StrokeObservationCS#endocarditis-history
* include StrokeObservationCS#cardiac-myxoma-history
* include StrokeObservationCS#rheumatic-heart-disease-history
* include StrokeObservationCS#patent-foramen-ovale

ValueSet: StrokeClinicalAssessmentCodeVS
Id: stroke-clinical-assessment-code
Title: "腦中風－中風分類評估項目值集"
Description: "此 ValueSet 列出「腦中風－中風分類評估」（StrokeClinicalAssessment）Observation.code 可用的項目代碼，包括中風類型、TOAST 分類、ICH 分數、Hunt and Hess 分級、心電圖心房顫動與中風前可否獨立生活。共 13 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.200417545706838823599652533726601827116"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#stroke-type-infarction
* include StrokeObservationCS#stroke-type-tia
* include StrokeObservationCS#stroke-type-ich
* include StrokeObservationCS#stroke-type-sah
* include StrokeObservationCS#stroke-subtype-tia-ich-sah
* include StrokeObservationCS#toast-classification
* include StrokeObservationCS#toast-laa-extracranial
* include StrokeObservationCS#toast-laa-intracranial
* include StrokeObservationCS#toast-specific-etiology
* include StrokeObservationCS#ecg-atrial-fibrillation
* include StrokeObservationCS#ich-score
* include StrokeObservationCS#hunt-hess-grade
* include StrokeObservationCS#pre-stroke-independent

ValueSet: StrokeCareProcessCodeVS
Id: stroke-care-process-code
Title: "腦中風－照護流程紀錄項目值集"
Description: "此 ValueSet 列出「腦中風－照護流程紀錄」（StrokeCareProcess）Observation.code 可用的項目代碼，包括未施打 IV-tPA 的原因、首次影像是否為外院影像、入住加護病房，以及各項「無用藥」「無手術」註記。共 17 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.302850195961256199157984928504746628194"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#no-pre-admission-medication
* include StrokeObservationCS#icu-admission
* include StrokeObservationCS#first-ct-mri-from-outside-hospital
* include StrokeObservationCS#ivtpa-not-given-main-reason
* include StrokeObservationCS#ivtpa-not-given-onset-over-3h
* include StrokeObservationCS#ivtpa-not-given-mild-or-improving
* include StrokeObservationCS#ivtpa-not-given-severe-stroke
* include StrokeObservationCS#ivtpa-not-given-age-out-of-range
* include StrokeObservationCS#ivtpa-not-given-prior-stroke-with-diabetes
* include StrokeObservationCS#ivtpa-not-given-high-blood-pressure
* include StrokeObservationCS#ivtpa-not-given-recent-stroke-or-head-trauma
* include StrokeObservationCS#ivtpa-not-given-seizure-at-onset
* include StrokeObservationCS#ivtpa-not-given-oral-anticoagulant
* include StrokeObservationCS#ivtpa-not-given-family-refusal
* include StrokeObservationCS#no-antithrombotic-within-24h
* include StrokeObservationCS#no-surgery
* include StrokeObservationCS#no-discharge-medication

ValueSet: StrokeComplicationCodeVS
Id: stroke-complication-code
Title: "腦中風－住院併發症與惡化項目值集"
Description: "此 ValueSet 列出「腦中風－住院併發症與惡化」（StrokeComplication）Observation.code 可用的項目代碼，包括住院併發症、中風惡化與神經學惡化原因。共 19 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.184625902385695808469097773641368958893"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#no-complication
* include StrokeObservationCS#complication-pneumonia
* include StrokeObservationCS#complication-sepsis
* include StrokeObservationCS#complication-urinary-tract-infection
* include StrokeObservationCS#complication-acute-coronary-syndrome
* include StrokeObservationCS#complication-upper-gi-bleeding
* include StrokeObservationCS#complication-seizure
* include StrokeObservationCS#complication-renal-failure
* include StrokeObservationCS#complication-deep-vein-thrombosis
* include StrokeObservationCS#neurologic-deterioration-nihss-2-or-more
* include StrokeObservationCS#neurologic-deterioration-criteria-unspecified
* include StrokeObservationCS#complication-other
* include StrokeObservationCS#complication-other-name
* include StrokeObservationCS#deterioration-cause-herniation
* include StrokeObservationCS#deterioration-cause-hemorrhagic-infarct-36h
* include StrokeObservationCS#deterioration-cause-hematoma-expansion
* include StrokeObservationCS#deterioration-cause-vasospasm
* include StrokeObservationCS#deterioration-cause-rebleeding
* include StrokeObservationCS#deterioration-cause-medical-problem

ValueSet: StrokeEvtProcedureDetailCodeVS
Id: stroke-evt-procedure-detail-code
Title: "腦中風－EVT 處置細節項目值集"
Description: "此 ValueSet 列出「腦中風－EVT 處置細節」（StrokeEvtProcedureDetail）Observation.code 可用的項目代碼，包括 EVT 前灌流影像註記、主動脈弓分型、頸部血管狹窄程度、目標血管、麻醉與鎮靜、EVT 技術與救援策略。共 49 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.225202453006244015222777298083399193929"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#no-perfusion-imaging
* include StrokeObservationCS#ct-perfusion-performed
* include StrokeObservationCS#mr-perfusion-performed
* include StrokeObservationCS#perfusion-analysis-rapid
* include StrokeObservationCS#perfusion-analysis-other-software
* include StrokeObservationCS#aortic-arch-type
* include StrokeObservationCS#right-cca-stenosis
* include StrokeObservationCS#left-cca-stenosis
* include StrokeObservationCS#right-vertebral-artery-stenosis
* include StrokeObservationCS#left-vertebral-artery-stenosis
* include StrokeObservationCS#right-ica-stenosis
* include StrokeObservationCS#left-ica-stenosis
* include StrokeObservationCS#target-vessel-cervical-ica
* include StrokeObservationCS#target-vessel-cervical-ica-right
* include StrokeObservationCS#target-vessel-cervical-ica-left
* include StrokeObservationCS#target-vessel-ica-terminus
* include StrokeObservationCS#target-vessel-ica-terminus-right
* include StrokeObservationCS#target-vessel-ica-terminus-left
* include StrokeObservationCS#target-vessel-m1
* include StrokeObservationCS#target-vessel-m1-right
* include StrokeObservationCS#target-vessel-m1-left
* include StrokeObservationCS#target-vessel-m2
* include StrokeObservationCS#target-vessel-m2-right
* include StrokeObservationCS#target-vessel-m2-left
* include StrokeObservationCS#target-vessel-m3
* include StrokeObservationCS#target-vessel-m3-right
* include StrokeObservationCS#target-vessel-m3-left
* include StrokeObservationCS#target-vessel-aca
* include StrokeObservationCS#target-vessel-aca-right
* include StrokeObservationCS#target-vessel-aca-left
* include StrokeObservationCS#target-vessel-pca
* include StrokeObservationCS#target-vessel-pca-right
* include StrokeObservationCS#target-vessel-pca-left
* include StrokeObservationCS#target-vessel-basilar-artery
* include StrokeObservationCS#target-vessel-vertebral-artery
* include StrokeObservationCS#target-vessel-vertebral-artery-right
* include StrokeObservationCS#target-vessel-vertebral-artery-left
* include StrokeObservationCS#general-anesthesia
* include StrokeObservationCS#procedural-sedation
* include StrokeObservationCS#no-evt-treatment-technique
* include StrokeObservationCS#balloon-guide-catheter
* include StrokeObservationCS#aspiration-strategy
* include StrokeObservationCS#stent-retriever-pass-count
* include StrokeObservationCS#aspiration-strategy-supplement
* include StrokeObservationCS#aspiration-rescue-strategy
* include StrokeObservationCS#aspiration-rescue-other
* include StrokeObservationCS#stent-retriever-rescue-performed
* include StrokeObservationCS#stent-retriever-rescue-strategy
* include StrokeObservationCS#stent-retriever-rescue-other

ValueSet: StrokeEvtOutcomeCodeVS
Id: stroke-evt-outcome-code
Title: "腦中風－EVT 術後結果項目值集"
Description: "此 ValueSet 列出「腦中風－EVT 術後結果」（StrokeEvtOutcome）Observation.code 可用的項目代碼，包括最終 TICI 分級、再血栓、新血管區域栓塞、術後血壓控制目標、EVT 相關併發症與追蹤影像結果。共 16 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.185858214981525224469175458724132790451"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#final-tici-grade
* include StrokeObservationCS#rethrombosis-within-10-minutes
* include StrokeObservationCS#new-territory-embolism
* include StrokeObservationCS#new-territory-embolism-detail
* include StrokeObservationCS#post-evt-bp-target
* include StrokeObservationCS#no-evt-complication
* include StrokeObservationCS#evt-arterial-dissection
* include StrokeObservationCS#evt-puncture-site-hematoma
* include StrokeObservationCS#evt-other-complication
* include StrokeObservationCS#no-follow-up-imaging
* include StrokeObservationCS#follow-up-ct-performed
* include StrokeObservationCS#follow-up-mri-performed
* include StrokeObservationCS#follow-up-imaging-ich
* include StrokeObservationCS#follow-up-ich-symptom-type
* include StrokeObservationCS#follow-up-imaging-infarct
* include StrokeObservationCS#follow-up-imaging-other-finding

ValueSet: StrokeOutcomeCodeVS
Id: stroke-outcome-code
Title: "腦中風－離院與追蹤結果項目值集"
Description: "此 ValueSet 列出「腦中風－離院與追蹤結果」（StrokeOutcome）Observation.code 可用的項目代碼，包括離院死亡原因與去向、中風後 3 個月追蹤、追蹤期間的醫療狀態、死亡與再中風。共 15 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.121373506517251914272390261663181275186"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#discharge-death-cause
* include StrokeObservationCS#discharge-death-cause-other
* include StrokeObservationCS#discharge-destination
* include StrokeObservationCS#three-month-residence
* include StrokeObservationCS#three-month-follow-up-not-completed
* include StrokeObservationCS#follow-up-care-status
* include StrokeObservationCS#follow-up-refusal-reason
* include StrokeObservationCS#follow-up-death-cause
* include StrokeObservationCS#follow-up-death-hemorrhagic-stroke
* include StrokeObservationCS#follow-up-death-ischemic-stroke
* include StrokeObservationCS#follow-up-death-cause-other
* include StrokeObservationCS#recurrent-stroke
* include StrokeObservationCS#recurrent-hemorrhagic-stroke
* include StrokeObservationCS#recurrent-ischemic-stroke
* include StrokeObservationCS#recurrent-stroke-date

ValueSet: StrokeImagingResultCodeVS
Id: stroke-imaging-result-code
Title: "腦中風－影像判讀結果項目值集"
Description: "此 ValueSet 列出「腦中風－影像判讀結果」（StrokeImagingResult）Observation.code.coding 中 strokeObservation Slice 可用的本地項目代碼，包括 ASPECTS、灌流核心梗塞與 mismatch 體積、mismatch 比值、Tmax > 6 秒體積、低灌流強度比值、影響側與多期 CTA 側枝循環。共 9 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.166739765409374296899348603165304827868"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#aspects-score
* include StrokeObservationCS#perfusion-mismatch-ratio
* include StrokeObservationCS#perfusion-core-volume
* include StrokeObservationCS#perfusion-mismatch-volume
* include StrokeObservationCS#mcta-collateral-grade
* include StrokeObservationCS#aspects-affected-side
* include StrokeObservationCS#cta-affected-side
* include StrokeObservationCS#tmax-over-6s-volume
* include StrokeObservationCS#hypoperfusion-intensity-ratio

ValueSet: StrokeProcedureResultCodeVS
Id: stroke-procedure-result-code
Title: "腦中風－處置時點結果項目值集"
Description: "此 ValueSet 列出「腦中風－處置時點結果」（StrokeProcedureResult）Observation.code.coding 中 strokeObservation Slice 可用的本地項目代碼，包括首次與最終血管再通時間及再灌流時間。共 3 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.268015032292890117114778966010896052577"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#reperfusion-time
* include StrokeObservationCS#first-recanalization-time
* include StrokeObservationCS#final-recanalization-time

ValueSet: StrokeLaboratoryCodeVS
Id: stroke-laboratory-code
Title: "腦中風－檢驗結果項目值集"
Description: "此 ValueSet 列出「腦中風－檢驗結果」（StrokeLaboratory）Observation.code.coding 中 strokeObservation Slice 可用的本地項目代碼，包括血液常規、凝血功能、血糖、腎功能、肝功能、血脂及其他抽血檢驗。共 22 個代碼，皆來自 StrokeObservationCS。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.224019439548074677265195775780420335445"
* ^status = #draft
* ^experimental = false
* include StrokeObservationCS#hemoglobin
* include StrokeObservationCS#hematocrit
* include StrokeObservationCS#platelet-count
* include StrokeObservationCS#ptt
* include StrokeObservationCS#prothrombin-time
* include StrokeObservationCS#pt-inr
* include StrokeObservationCS#hba1c
* include StrokeObservationCS#wbc-count
* include StrokeObservationCS#glucose-at-emergency
* include StrokeObservationCS#bun
* include StrokeObservationCS#creatinine
* include StrokeObservationCS#fasting-glucose-first
* include StrokeObservationCS#total-cholesterol
* include StrokeObservationCS#triglyceride
* include StrokeObservationCS#hdl-cholesterol
* include StrokeObservationCS#ldl-cholesterol
* include StrokeObservationCS#ast
* include StrokeObservationCS#alt
* include StrokeObservationCS#ptt-control
* include StrokeObservationCS#albumin
* include StrokeObservationCS#crp
* include StrokeObservationCS#ua-unspecified
