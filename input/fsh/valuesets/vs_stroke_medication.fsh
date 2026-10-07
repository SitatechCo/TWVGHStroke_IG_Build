ValueSet: StrokeMedicationVS
Id: stroke-medication
Title: "腦中風－藥品與藥物類別值集"
Description: "此 ValueSet 收錄 StrokeMedicationCS 的全部代碼，用於記錄腦中風相關用藥與給藥的本地藥品與藥物類別；代碼僅代表藥名或藥物類別。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.65838976427856107471467648942059110714"
* ^status = #draft
* ^experimental = false
* include codes from system StrokeMedicationCS

ValueSet: StrokeNoacVS
Id: noac
Title: "腦中風－NOAC 藥品值集"
Description: "此 ValueSet 列出非維生素 K 口服抗凝血藥（NOAC）的四個品項：dabigatran、rivaroxaban、apixaban、edoxaban。若來源記錄住院前或離院時的 NOAC 品項，StrokeMedicationStatement 的 strokeMedication Slice 只能填這四個代碼。本 ValueSet 未直接綁定在 Profile 元素上，供轉換與檢查時使用。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.39581828318522630461371762159537019409"
* ^status = #draft
* ^experimental = false
* include StrokeMedicationCS#dabigatran
* include StrokeMedicationCS#rivaroxaban
* include StrokeMedicationCS#apixaban
* include StrokeMedicationCS#edoxaban

ValueSet: StrokeAnticoagulantDetailVS
Id: anticoagulant-detail
Title: "腦中風－抗凝血藥物類別值集"
Description: "此 ValueSet 列出 EVT 後 24 小時內抗凝血藥物類別可用的代碼：heparin、noac（品項不明的 NOAC）、warfarin。若來源記錄此時窗的抗凝血藥物類別，StrokeMedicationStatement 的 recordingContext 填 first-24h，strokeMedication Slice 只能填這三個代碼。本 ValueSet 未直接綁定在 Profile 元素上，供轉換與檢查時使用。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.255310583069965064137591821324915166313"
* ^status = #draft
* ^experimental = false
* include StrokeMedicationCS#heparin
* include StrokeMedicationCS#noac
* include StrokeMedicationCS#warfarin
