CodeSystem: StrokeProcedureCS
Id: stroke-procedure
Title: "腦中風－醫療處置代碼"
Description: "此 CodeSystem 定義本 IG 用於 Procedure.code 的本地處置代碼，包含 EVT 主處置與其子處置（動脈穿刺、支架取栓、抽吸取栓、置放支架等）、腦部手術，以及住院期間的處置與衛教。若有對應的 SNOMED CT 代碼，可在 Procedure.code 同時填入。"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[0].value = "urn:oid:2.25.56596865537018584225811559403070491633"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #evt "動脈內血栓移除術（EVT）" "急性缺血性腦中風血管內血栓移除治療主處置。動脈穿刺、支架取栓、抽吸取栓、置放支架等子處置，以 partOf 參照此處置。"
* #ia-thrombectomy "動脈內取栓" "住院期間執行的動脈內取栓治療，只記錄是否執行，不含術中細節。"
* #urinary-catheter-insertion "留置導尿管" "住院期間留置導尿管（Foley）。"
* #rehabilitation "復健治療" "住院期間接受復健治療。"
* #mechanical-ventilation "使用呼吸器" "住院期間使用呼吸器（機械通氣）。"
* #nasogastric-tube-insertion "留置鼻胃管" "住院期間留置鼻胃管。"
* #dysphagia-screening "吞嚥篩檢" "住院期間執行吞嚥功能篩檢。"
* #smoking-cessation-counseling "戒菸衛教" "住院期間對病人進行戒菸衛教。"
* #stroke-education "中風衛教" "住院期間對病人或家屬進行中風衛教。"
* #surgical-treatment "手術治療（未指明術式）" "住院期間接受手術，未指明術式。"
* #evt-puncture "EVT 動脈穿刺" "EVT 建立血管通路的動脈穿刺。穿刺時間填 performedDateTime，穿刺部位填 bodySite。"
* #stent-placement "置放支架" "EVT 過程中置放血管支架。"
* #aspiration-thrombectomy "抽吸取栓" "EVT 過程中以抽吸導管移除血栓。"
* #intra-arterial-drug-therapy "動脈內藥物治療" "EVT 過程中經動脈給藥（例如血栓溶解劑），藥品與劑量填在給藥紀錄。"
* #stent-retriever-thrombectomy "支架取栓" "EVT 過程中以支架取栓器移除血栓。"
* #balloon-angioplasty "球囊血管成形術" "EVT 過程中以球囊擴張狹窄血管。"
* #decompressive-craniectomy "減壓性顱骨切除術" "切除部分顱骨以降低顱內壓的手術。"
* #hematoma-evacuation "血腫清除術" "以手術清除顱內血腫。"
* #external-ventricular-drainage "腦室外引流術（EVD）" "放置腦室外引流管，將腦脊髓液引流至體外。"
* #ventriculoperitoneal-shunt "腦室腹腔分流術（VP shunt）" "放置分流管，將腦脊髓液由腦室引流至腹腔。"
* #other-surgery "其他手術" "住院期間接受的其他手術，術式名稱填在 Procedure.code.text。"
