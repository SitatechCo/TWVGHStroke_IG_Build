CodeSystem: StrokeSmokingStatusDetailCS
Id: smoking-status-detail
Title: "腦中風－吸菸狀態細分代碼"
Description: "此 CodeSystem 保留吸菸狀態原始分組，與 SNOMED CT 吸菸狀態代碼並列於同一個 CodeableConcept。收錄兩組代碼：數字代碼（1、2、3）區分戒菸年數；文字代碼（Current、Past）不區分戒菸年數。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.128120432650748829062353042460251730009"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #1 "目前吸菸" "目前仍在吸菸。"
* #2 "已戒菸（2 年或以下）" "過去吸菸，已戒菸 2 年或以下。"
* #3 "已戒菸（2 年以上）" "過去吸菸，已戒菸 2 年以上。"
* #Past "過去吸菸" "過去吸菸且目前已戒菸，戒菸年數不詳。"
* #Current "目前吸菸" "目前仍在吸菸。屬文字代碼組，與代碼 1 同義。"
