Extension: StrokeEventTimeOnly
Id: event-time-only
Title: "腦中風－來源事件時間"
Description: "此 Extension 在日期時間元素上保留來源記錄的事件時間（不含日期與時區）。適用兩種情況：一、來源只有時間、沒有日期；二、來源有日期與時間，但時區尚未確認，原元素先只填日期。取得完整且時區已確認的日期時間後，改填原元素並移除本 Extension。"
Context: Condition.onset[x], Encounter.period.start, Encounter.period.end, Observation.value[x], Observation.effective[x], Procedure.performed[x], MedicationAdministration.effective[x], MedicationStatement.effective[x], ImagingStudy.started, Provenance.occurred[x], ServiceRequest.authoredOn, ServiceRequest.occurrence[x], Consent.dateTime, QuestionnaireResponse.authored, Period.start, Period.end
* ^status = #draft
* ^experimental = false
* . ^short = "來源事件時間（無日期、無時區）"
* . ^definition = "只用於 dateTime 型別元素；choice 元素只用 dateTime 分支，Period 用於 start 與 end。兩種用法：一、來源只有時間、沒有日期：原元素不填值，只在該元素的 extension 放入本 Extension，例如 Procedure._performedDateTime；此用法不適用 Observation.effective[x]，評估時間缺日期時改存登錄表單。二、來源有日期與時間但時區尚未確認：原元素只填日期（YYYY-MM-DD），並在該元素的 extension 放入本 Extension 保留來源時鐘時間。"
* extension 0..0
* value[x] 1..1 MS
* value[x] only time
* value[x] ^short = "事件時間。[hh:mm:ss，24 小時制]"
* value[x] ^definition = "來源記錄的事件時間，採 24 小時制，格式為 hh:mm:ss，不含日期與時區。來源只有時與分時，秒填 00。"
