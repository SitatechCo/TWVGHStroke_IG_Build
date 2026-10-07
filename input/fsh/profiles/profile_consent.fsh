Profile: StrokeConsent
Parent: Consent
Id: StrokeConsent
Title: "腦中風－研究同意"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Consent Resource，以呈現病人簽署的腦中風登錄研究同意書。"
* ^status = #draft
* ^purpose = "每份研究同意文件建一筆 Consent。有可查核的同意文件，且能確認同意狀態與範圍才建立。若來源只有「已簽署／未簽署」旗標或簽署日期，改存登錄表單（StrokeRegistryResponse），不建 Consent。因 TW Core 1.0.0 沒有 Consent Profile，故以 FHIR R4 Consent 為父層。"

* status MS
* status ^short = "同意狀態。[同意有效填 active]"
* status ^definition = "依同意文件判斷：同意有效填 active，病人拒絕填 rejected，已撤回或失效填 inactive，未完成簽署填 draft 或 proposed。"

* scope MS
* scope = $ConsentScope#research
* scope ^short = "同意範圍。[固定填 research]"

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research
* category ^short = "同意類別。[固定填 consentcategorycodes 的 research]"
* category ^definition = "研究資料使用同意。固定填 http://terminology.hl7.org/CodeSystem/consentcategorycodes 的 research。"

* patient 1..1 MS
* patient only Reference(StrokePatient)
* patient ^short = "病人。[應參照 StrokePatient]"

* dateTime MS
* dateTime ^short = "簽署日期。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* dateTime ^definition = "同意書簽署日期。時區確認前只填日期（YYYY-MM-DD），時間原值留在同意文件或 StrokeRegistryResponse 的原始值題目；確認後填完整日期時間與時區（例如 +08:00）。"

* performer MS
* performer only Reference(StrokePatient or RelatedPerson)
* performer ^short = "簽署人。[病人本人參照 StrokePatient；代理人參照 RelatedPerson]"

* organization MS
* organization only Reference(StrokeOrganization)
* organization ^short = "保管同意書的院所。[應參照 StrokeOrganization]"

* source[x] 1..1 MS
* source[x] only Attachment or Reference(DocumentReference)
* source[x] ^short = "同意文件。[應填入同意書檔案或文件參照]"
* source[x] ^definition = "簽署的同意書，必填；沒有同意文件就不建 Consent。可用 sourceAttachment 填檔案資訊（title、contentType、creation），或用 sourceReference 參照 DocumentReference。"

* policy MS
* policy ^short = "研究計畫或同意書規範。[policy.uri 填入規範網址]"
* policy ^definition = "研究計畫或同意書版本的規範。policy 與 policyRule 至少填一個（符合 FHIR 規則 ppc-1）。"
* policy.uri MS
* policy.uri ^short = "規範網址。[應填入研究計畫或同意書版本的網址]"

* provision MS
* provision ^short = "同意內容"
* provision.type MS
* provision.type ^short = "同意或拒絕。[permit 或 deny]"
* provision.period MS
* provision.period ^short = "同意有效期間。[YYYY-MM-DD]"
