CodeSystem: StrokeToastCS
Id: toast-classification
Title: "腦中風－TOAST 分類代碼"
Description: "此 CodeSystem 定義缺血性中風的 TOAST 病因分類。數字代碼沿用原分類，小血管阻塞填 svo；本 CodeSystem 未收錄代碼 2。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.193760600448900989713803837252122541997"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "大動脈粥狀硬化" "大動脈粥狀硬化（Large artery atherosclerosis）造成的缺血性中風。"
* #3 "心因性栓塞" "心臟來源栓子（Cardioembolism）造成的缺血性中風。"
* #4 "其他確定病因" "已確認其他特定病因（Specific etiology）的缺血性中風。"
* #5 "病因不明" "經評估仍無法確定病因（Undetermined etiology）的缺血性中風。"
* #svo "小血管阻塞" "小血管阻塞（Small vessel occlusion）造成的缺血性中風。"
