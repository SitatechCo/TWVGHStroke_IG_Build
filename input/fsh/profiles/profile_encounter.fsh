Profile: StrokeEncounter
Parent: $TWCoreEncounter
Id: StrokeEncounter
Title: "腦中風－就醫事件"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Encounter Resource，以呈現腦中風病人的急診與住院就醫事件，包含就醫期間與離院情形。"
* ^status = #draft
* ^purpose = "記錄單次急診或住院就醫。急診與住院分開建 Encounter，以 class 區分。本院急診、他院急診與本院住院各建一筆。院方確認病人與就醫事件的對照方式後，才可把不同來源的資料歸到同一筆 Encounter。"

* status MS
* status ^short = "就醫狀態。[填 finished、in-progress 或 unknown]"
* status ^definition = "就醫結束填 finished，例如住院已離院，或急診已轉住院、轉院、離開急診。仍在院填 in-progress。無法判斷填 unknown。"

* class MS
* class ^short = "就醫類別。[急診填 EMER；住院填 IMP]"
* class ^definition = "依實際就醫型態填 v3-ActCode：急診填 EMER（emergency），住院填 IMP（inpatient encounter）。"

* subject 1..1 MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* period MS
* period ^short = "就醫期間"
* period ^definition = "急診 Encounter 的 start 填到達急診時間。住院 Encounter 的 start 填住院日期，end 填離院日期。他院急診另建一筆 Encounter。"
* period.start MS
* period.start ^short = "開始日期時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* period.start ^definition = "急診填到院時間，住院填住院日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在該元素上，並存入 StrokeRegistryResponse 的原始值題目；確認後把同一事件的日期與時間合併成一個值並帶時區（例如 +08:00）。只有年月填 YYYY-MM。只有時間沒有日期時不填值，改用 eventTimeOnly 擴充保留時間。"
* period.start.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* period.start.extension[eventTimeOnly] ^short = "僅有開始時間。[hh:mm:ss，無日期時使用]"
* period.start.extension[eventTimeOnly] ^definition = "來源只有開始時間、沒有日期時使用，period.start 不填值。"
* period.end MS
* period.end ^short = "結束日期時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* period.end ^definition = "住院填離院日期。格式與時區規則比照 start：時區確認前只填日期。不同來源的離院日期不一致時，先人工核對再填。只有時間、沒有日期時不填值，改用 eventTimeOnly 擴充保留時間。"
* period.end.extension contains StrokeEventTimeOnly named eventTimeOnly 0..1 MS
* period.end.extension[eventTimeOnly] ^short = "僅有結束時間。[hh:mm:ss，無日期時使用]"
* period.end.extension[eventTimeOnly] ^definition = "來源只有結束時間、沒有日期時使用，period.end 不填值。"

* hospitalization MS
* hospitalization ^short = "住院資訊"
* hospitalization.dischargeDisposition MS
* hospitalization.dischargeDisposition from StrokeDischargeStatusVS (extensible)
* hospitalization.dischargeDisposition ^short = "離院情形。[填 StrokeDischargeStatusVS 代碼]"
* hospitalization.dischargeDisposition ^definition = "限住院 Encounter 使用。可填 1（病危自動出院）、2（死亡）、3（出院）、LEV05（轉急性後期照護 PAC）。來源代碼 LEV01、LEV02、LEV03 分別轉為 1、2、3，LEV05 維持原代碼。"

* serviceProvider MS
* serviceProvider only Reference(StrokeOrganization)
* serviceProvider ^short = "提供服務的院所。[應參照 StrokeOrganization]"
* serviceProvider ^definition = "本院就醫參照本院 StrokeOrganization。他院急診參照該院所；院所尚未建立時只填 display（院所名稱）。"
