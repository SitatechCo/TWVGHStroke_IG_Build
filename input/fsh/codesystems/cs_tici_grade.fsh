CodeSystem: StrokeTiciCS
Id: tici-grade
Title: "腦中風－TICI 再灌流分級代碼"
Description: "此 CodeSystem 定義 EVT 結束時的再灌流程度（TICI 分級），等級越高代表再灌流越完整。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.158416230762499744281270505827913986860"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #0 "TICI 0 級" "阻塞處遠端無灌流。"
* #1 "TICI 1 級" "顯影劑通過阻塞處，但遠端分支幾乎無灌流。"
* #2a "TICI 2a 級" "部分再灌流，範圍未達阻塞血管供應區的一半。"
* #2b "TICI 2b 級" "部分再灌流，範圍達阻塞血管供應區的一半以上。"
* #2c "TICI 2c 級" "接近完全再灌流，僅少數遠端皮質分支血流緩慢或殘留小栓塞。"
* #3 "TICI 3 級" "完全再灌流。"
