CodeSystem: StrokePreEvtIvtpaSiteCS
Id: pre-evt-ivtpa-site
Title: "腦中風－EVT 前 IV-tPA 施打院所代碼"
Description: "此 CodeSystem 定義 EVT 前是否施打 IV-tPA 及施打院所：代碼 1、2 代表已施打及施打地點，3 代表未施打。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.226773153267818042285055528722134505618"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "本院施打" "EVT 前在本院施打 IV-tPA。"
* #2 "他院施打" "EVT 前在他院施打 IV-tPA。"
* #3 "未施打" "EVT 前未施打 IV-tPA。"
