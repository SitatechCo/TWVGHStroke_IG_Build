本頁依 Profile 列出本 IG 所有範例，資料皆為虛構。

範例中含時間的日期時間，假設院方已確認來源時區為臺灣時間（+08:00）；確認前，來源日期時間只填日期，時間以 StrokeEventTimeOnly 擴充附在元素上，並保存在登錄表單回覆的原始值題目。「腦中風 EVT 登錄主表回覆範例」刻意示範時區確認前的寫法。

除病人、醫療院所與醫事人員範例外，其他範例均參照同一位病人（[腦中風病人範例](Patient-stroke-patient-example.html)），可對照其就醫、評估、處置與結果資料。

### 範例

#### 一、共用資料元素

| Profile | 範例 |
|---|---|
| [病人基本資料](StructureDefinition-StrokePatient.html) | [腦中風病人範例](Patient-stroke-patient-example.html)<br>[腦中風病人範例（已死亡、出生年月不明）](Patient-stroke-patient-deceased-example.html) |
| [就醫事件](StructureDefinition-StrokeEncounter.html) | [腦中風住院就醫範例](Encounter-stroke-encounter-example.html)<br>[腦中風本院急診就醫範例](Encounter-stroke-encounter-er-example.html)<br>[腦中風他院急診就醫範例](Encounter-stroke-encounter-other-er-example.html) |
| [醫療院所](StructureDefinition-StrokeOrganization.html) | [腦中風登錄醫院範例](Organization-stroke-organization-vghks.html) |
| [醫事人員](StructureDefinition-StrokePractitioner.html) | [腦中風醫事人員範例](Practitioner-stroke-practitioner-example.html) |
{: .grid .rwd-table}

#### 二、生命徵象與量表

| Profile | 範例 |
|---|---|
| [身高](StructureDefinition-StrokeBodyHeight.html) | [腦中風身高範例](Observation-stroke-body-height-example.html) |
| [體重](StructureDefinition-StrokeBodyWeight.html) | [腦中風體重範例](Observation-stroke-body-weight-example.html) |
| [體溫](StructureDefinition-StrokeBodyTemperature.html) | [腦中風體溫範例](Observation-stroke-body-temperature-example.html) |
| [心率](StructureDefinition-StrokeHeartRate.html) | [腦中風心率範例](Observation-stroke-heart-rate-example.html) |
| [呼吸速率](StructureDefinition-StrokeRespiratoryRate.html) | [腦中風呼吸速率範例](Observation-stroke-respiratory-rate-example.html) |
| [血壓](StructureDefinition-StrokeBloodPressure.html) | [腦中風血壓範例](Observation-stroke-blood-pressure-example.html)<br>[腦中風血壓範例（缺舒張壓）](Observation-stroke-blood-pressure-diastolic-missing-example.html) |
| [昏迷指數](StructureDefinition-StrokeGCS.html) | [腦中風昏迷指數範例](Observation-stroke-gcs-example.html) |
| [NIHSS 評估](StructureDefinition-StrokeNIHSS.html) | [腦中風 NIHSS 入院評估範例](Observation-stroke-nihss-admission-example.html)<br>[腦中風 NIHSS 治療後 24 小時評估範例](Observation-stroke-nihss-24h-example.html) |
| [mRS 評估](StructureDefinition-StrokeMRS.html) | [腦中風離院 mRS 評估範例](Observation-stroke-mrs-discharge-example.html)<br>[腦中風中風前 mRS 範例](Observation-stroke-mrs-pre-stroke-example.html)<br>[腦中風未分類時點 mRS 範例](Observation-stroke-mrs-unclassified-example.html) |
{: .grid .rwd-table}

#### 三、中風評估

| Profile | 範例 |
|---|---|
| [就醫背景](StructureDefinition-StrokeAdmissionContext.html) | [腦中風就醫背景範例－到院方式](Observation-stroke-arrival-mode-example.html)<br>[腦中風就醫背景範例－病人年齡](Observation-stroke-patient-age-example.html)<br>[腦中風就醫背景範例－教育程度](Observation-stroke-education-level-example.html) |
| [職業](StructureDefinition-StrokeOccupation.html) | [腦中風職業範例](Observation-stroke-occupation-example.html) |
| [吸菸狀態](StructureDefinition-StrokeSmokingStatus.html) | [腦中風吸菸狀態範例](Observation-stroke-smoking-status-example.html) |
| [危險因子與病史](StructureDefinition-StrokeRiskFactor.html) | [腦中風危險因子範例－高血壓病史](Observation-stroke-hypertension-history-example.html)<br>[腦中風危險因子範例－糖尿病病史不確定](Observation-stroke-diabetes-history-unknown-example.html)<br>[腦中風危險因子範例－中風家族史（陰性）](Observation-stroke-family-history-stroke-example.html)<br>[腦中風危險因子範例－每日吸菸量](Observation-stroke-cigarettes-per-day-example.html)<br>[腦中風危險因子範例－癌症名稱](Observation-stroke-cancer-name-example.html) |
| [中風診斷](StructureDefinition-StrokeCondition.html) | [腦中風診斷範例](Condition-stroke-condition-example.html) |
| [發病時間](StructureDefinition-StrokeOnsetTime.html) | [腦中風發病時間範例－最後正常時間](Observation-stroke-last-known-well-example.html)<br>[腦中風發病時間範例－只有時間](Observation-stroke-onset-time-only-example.html)<br>[腦中風發病時間範例－醒後中風](Observation-stroke-wake-up-stroke-example.html) |
| [中風分類評估](StructureDefinition-StrokeClinicalAssessment.html) | [腦中風分類評估範例－TOAST 分類](Observation-stroke-toast-classification-example.html)<br>[腦中風分類評估範例－心電圖心房顫動](Observation-stroke-ecg-atrial-fibrillation-example.html)<br>[腦中風分類評估範例－中風前可獨立生活](Observation-stroke-pre-stroke-independent-example.html) |
| [照護流程紀錄](StructureDefinition-StrokeCareProcess.html) | [腦中風照護流程範例－未施打 IV-tPA 主要原因](Observation-stroke-ivtpa-not-given-reason-example.html)<br>[腦中風照護流程範例－未施打 IV-tPA 次要原因](Observation-stroke-ivtpa-not-given-onset-over-3h-example.html)<br>[腦中風照護流程範例－入住加護病房](Observation-stroke-icu-admission-example.html) |
| [住院併發症與惡化](StructureDefinition-StrokeComplication.html) | [腦中風住院併發症範例－肺炎](Observation-stroke-complication-pneumonia-example.html)<br>[腦中風住院併發症範例－其他併發症名稱](Observation-stroke-complication-other-name-example.html)<br>[腦中風住院併發症範例－中風惡化（NIHSS 增加至少 2 分）](Observation-stroke-neurologic-deterioration-example.html) |
| [檢驗結果](StructureDefinition-StrokeLaboratory.html) | [腦中風血紅素檢驗範例](Observation-stroke-lab-hemoglobin-example.html)<br>[腦中風 INR 結果為 NA 範例](Observation-stroke-lab-inr-not-available-example.html) |
| [離院與追蹤結果](StructureDefinition-StrokeOutcome.html) | [腦中風離院與追蹤結果範例－離院去向](Observation-stroke-discharge-destination-example.html)<br>[腦中風離院與追蹤結果範例－3 個月所在處所](Observation-stroke-three-month-residence-example.html)<br>[腦中風離院與追蹤結果範例－追蹤期間再中風](Observation-stroke-recurrent-stroke-example.html)<br>[腦中風離院與追蹤結果範例－再中風日期](Observation-stroke-recurrent-stroke-date-example.html) |
{: .grid .rwd-table}

#### 四、EVT 處置

| Profile | 範例 |
|---|---|
| [EVT 處置細節](StructureDefinition-StrokeEvtProcedureDetail.html) | [腦中風 EVT 處置細節範例－目標血管](Observation-stroke-evt-target-vessel-example.html)<br>[腦中風 EVT 處置細節範例－主動脈弓分型](Observation-stroke-evt-aortic-arch-example.html)<br>[腦中風 EVT 處置細節範例－抽吸失敗後救援策略](Observation-stroke-evt-aspiration-rescue-example.html)<br>[腦中風 EVT 處置細節範例－支架取栓次數](Observation-stroke-evt-stent-retriever-pass-count-example.html) |
| [處置時點結果](StructureDefinition-StrokeProcedureResult.html) | [腦中風首次血管再通時間範例](Observation-stroke-first-recanalization-example.html)<br>[腦中風再灌流時間（僅有時間）範例](Observation-stroke-reperfusion-time-only-example.html) |
| [EVT 術後結果](StructureDefinition-StrokeEvtOutcome.html) | [腦中風 EVT 術後結果範例－最終 TICI 分級](Observation-stroke-evt-final-tici-example.html)<br>[腦中風 EVT 術後結果範例－術後血壓控制目標](Observation-stroke-evt-post-bp-target-example.html)<br>[腦中風 EVT 術後結果範例－無 EVT 相關併發症](Observation-stroke-evt-no-complication-example.html)<br>[腦中風 EVT 術後結果範例－追蹤影像顯示顱內出血](Observation-stroke-evt-follow-up-imaging-ich-example.html) |
{: .grid .rwd-table}

#### 五、用藥與處置

| Profile | 範例 |
|---|---|
| [用藥紀錄](StructureDefinition-StrokeMedicationStatement.html) | [腦中風住院中用藥範例（Aspirin）](MedicationStatement-stroke-medstatement-aspirin-inpatient-example.html)<br>[腦中風住院前用藥範例（未使用 statin）](MedicationStatement-stroke-medstatement-statin-pre-admission-example.html)<br>[腦中風離院時用藥範例（Apixaban）](MedicationStatement-stroke-medstatement-apixaban-discharge-example.html) |
| [給藥紀錄](StructureDefinition-StrokeMedicationAdministration.html) | [腦中風 IV-tPA 給藥範例](MedicationAdministration-stroke-medadmin-ivtpa-example.html)<br>[腦中風 EVT 動脈內藥物給藥範例](MedicationAdministration-stroke-medadmin-intra-arterial-example.html)<br>[腦中風 EVT 鎮靜藥給藥範例](MedicationAdministration-stroke-medadmin-sedation-example.html) |
| [醫療處置](StructureDefinition-StrokeProcedure.html) | [腦中風 EVT 主處置範例](Procedure-stroke-procedure-evt-example.html)<br>[腦中風 EVT 動脈穿刺範例](Procedure-stroke-procedure-evt-puncture-example.html)<br>[腦中風 EVT 支架取栓範例](Procedure-stroke-procedure-stent-retriever-example.html)<br>[腦中風住院吞嚥篩檢範例](Procedure-stroke-procedure-dysphagia-screening-example.html)<br>[腦中風住院未使用呼吸器範例](Procedure-stroke-procedure-ventilation-not-done-example.html) |
{: .grid .rwd-table}

#### 六、影像

| Profile | 範例 |
|---|---|
| [影像檢查](StructureDefinition-StrokeImagingStudy.html) | [腦中風 CT 灌流檢查範例](ImagingStudy-stroke-imagingstudy-ctp-example.html)<br>[腦中風追蹤 MR 檢查範例](ImagingStudy-stroke-imagingstudy-follow-up-mr-example.html) |
| [影像判讀結果](StructureDefinition-StrokeImagingResult.html) | [腦中風 ASPECTS 分數範例](Observation-stroke-imaging-aspects-example.html)<br>[腦中風灌流核心梗塞體積範例](Observation-stroke-imaging-core-volume-example.html)<br>[腦中風 mismatch 比值無法計算範例](Observation-stroke-imaging-mismatch-ratio-unavailable-example.html)<br>[腦中風 CTA 影響側範例](Observation-stroke-imaging-cta-affected-side-example.html) |
| [影像檢查醫令](StructureDefinition-StrokeServiceRequest.html) | [腦中風 CT 灌流檢查醫令範例](ServiceRequest-stroke-servicerequest-ctp-example.html) |
{: .grid .rwd-table}

#### 七、表單與追溯

登錄表單回覆範例對應的表單定義為[腦中風登錄表單](Questionnaire-stroke-registry.html)。

| Profile | 範例 |
|---|---|
| [登錄表單回覆](StructureDefinition-StrokeRegistryResponse.html) | [腦中風 EVT 登錄主表回覆範例](QuestionnaireResponse-stroke-registry-response-evt-example.html)<br>[腦中風 RAPID 影像分析回覆範例](QuestionnaireResponse-stroke-registry-response-rapid-example.html) |
| [資料來源追溯](StructureDefinition-StrokeProvenance.html) | [腦中風資料來源追溯範例](Provenance-stroke-provenance-example.html) |
| [研究同意](StructureDefinition-StrokeConsent.html) | [腦中風研究同意範例](Consent-stroke-consent-example.html) |
{: .grid .rwd-table}

#### 八、個案資料包

| Profile | 範例 |
|---|---|
| [個管系統個案資料包](StructureDefinition-StrokeCaseManagementBundle.html) | [腦中風個管系統個案資料包範例](Bundle-stroke-bundle-ncva-example.html) |
| [EVT 登錄個案資料包](StructureDefinition-StrokeEvtRegistryBundle.html) | [腦中風 EVT 登錄個案資料包範例](Bundle-stroke-bundle-evt-example.html) |
| [RAPID 影像分析資料包](StructureDefinition-StrokeRapidBundle.html) | [腦中風 RAPID 影像分析資料包範例](Bundle-stroke-bundle-rapid-example.html) |
{: .grid .rwd-table}
