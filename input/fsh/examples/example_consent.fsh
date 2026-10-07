Instance: stroke-consent-example
InstanceOf: StrokeConsent
Title: "腦中風研究同意範例"
Description: "病人本人簽署腦中風登錄研究同意書範例，附同意文件資訊。"
Usage: #example
* status = #active
* scope = $ConsentScope#research "Research"
* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#research "Research Information Access"
* patient = Reference(Patient/stroke-patient-example)
* dateTime = "2025-01-16"
* performer = Reference(Patient/stroke-patient-example)
* organization = Reference(Organization/stroke-organization-vghks)
* sourceAttachment.contentType = #application/pdf
* sourceAttachment.title = "腦中風登錄研究同意書（範例）"
* sourceAttachment.creation = "2025-01-16"
* policy.uri = "http://www.vghks.gov.tw/stroke-registry/consent-policy"
* provision.type = #permit
* provision.period.start = "2025-01-16"
