Profile: StrokeNIHSS
Parent: $TWCoreObservationScreeningAssessment
Id: StrokeNIHSS
Title: "腦中風－NIHSS 評估"
Description: "此 Profile 說明本 IG 如何進一步定義 FHIR 的 Observation Resource，以呈現美國國衛院中風量表（NIHSS）的評估結果，包含總分與 15 個分項分數。"
* ^status = #draft
* ^experimental = false
* ^purpose = "每次 NIHSS 評估建立一筆 Observation。入院、施針前、治療後 24 小時與出院四個時點各建一筆，以 assessmentPhase 區分。同次評估的日期、時間、分項與總分放在同一筆。分項與日期時間皆空白、只有總分 0 時不建 Observation，原值存於登錄表單（StrokeRegistryResponse），確認有評估後再建立。"

* extension contains
    StrokeAssessmentPhase named assessmentPhase 1..1 MS and
    StrokeAssessmentSequence named assessmentSequence 0..1 MS
* extension[assessmentPhase] ^short = "評估時點。[應填入 admission／pre-needle／24h／discharge；無法確認時填 unclassified]"
* extension[assessmentPhase] ^definition = "必填。入院填 admission，施針前填 pre-needle，治療後 24 小時填 24h，出院填 discharge；四個時點各建一筆 Observation。時點無法確認時填 unclassified。"
* extension[assessmentSequence] ^short = "來源評估序號。[有序號時原樣填入]"
* extension[assessmentSequence] ^definition = "來源有序號時原樣填入。序號 1 為入院、2 為出院，assessmentPhase 分別填 admission 與 discharge，兩者各建一筆。來源無序號時不填。"

* status MS
* status ^short = "結果狀態。[填 final／amended／unknown 等]"
* status ^definition = "評估結果狀態。來源確認為正式結果填 final，無法確認填 unknown。"

* category MS
* category ^short = "評估類別。[須包含 survey]"
* category ^definition = "依 TW Core 規定，至少須包含 observation-category 的 survey。"

* code MS
* code = $LOINC#72089-6
* code ^short = "NIHSS 總分。[固定為 LOINC 72089-6]"
* code ^definition = "固定填 LOINC 72089-6（Total score [NIH Stroke Scale]）。各分項放在 component，不另建 Observation。"

* subject MS
* subject only Reference(StrokePatient)
* subject ^short = "病人。[應參照 StrokePatient]"

* encounter MS
* encounter only Reference(StrokeEncounter)
* encounter ^short = "就醫事件。[應參照 StrokeEncounter]"
* encounter ^definition = "此次評估對應的就醫事件。"

* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "評估日期與時間。[YYYY-MM-DD；時區確認後填 YYYY-MM-DDThh:mm:ss＋時區]"
* effective[x] ^definition = "評估日期與時間，至少須有完整日期。時區確認前只填日期（YYYY-MM-DD），時間原值以 StrokeEventTimeOnly 擴充附在此元素，並存於 StrokeRegistryResponse 的原始值題目；確認後將同次評估的日期與時間合併，填至秒並帶時區（例如 +08:00）。來源無時間時只填日期；僅有年月或僅有時間時不填此元素，原值改存登錄表單（StrokeRegistryResponse）。"

* value[x] MS
* value[x] only integer or string
* valueInteger ^minValueInteger = 0
* valueInteger ^maxValueInteger = 42
* value[x] ^short = "NIHSS 總分。[0–42 的整數；非數值時原樣填字串]"
* value[x] ^definition = "來源的 NIHSS 總分。有效分數填 valueInteger（範圍 0–42）。若為 X、7+X 等非純數值或超出 0–42，改以 valueString 原樣保留。每筆限填一種型別；總分空白時不填。"

* dataAbsentReason MS
* dataAbsentReason ^short = "缺值原因。[無總分與分項時才填]"
* dataAbsentReason ^definition = "沒有總分且無任何分項時，依 TW Core 規定須填缺值原因。來源若無可支持的缺值原因，不建立 Observation，只保留於登錄表單。"

* component MS
* component ^short = "NIHSS 分項分數"
* component ^definition = "每個分項各建一個 component，以 LOINC 代碼區分。有效分數填 valueInteger。若為 X 等非純數值或整數超出該項範圍，改以 valueString 原樣保留。分項空白時不建立該 component。"
* component.code MS
* component.value[x] MS
* component.value[x] only integer or string
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "依 component.code 的 LOINC 代碼區分 NIHSS 分項。"
* component contains
    levelOfConsciousness 0..1 MS and
    locQuestions 0..1 MS and
    locCommands 0..1 MS and
    bestGaze 0..1 MS and
    visual 0..1 MS and
    facialPalsy 0..1 MS and
    motorArmLeft 0..1 MS and
    motorArmRight 0..1 MS and
    motorLegLeft 0..1 MS and
    motorLegRight 0..1 MS and
    limbAtaxia 0..1 MS and
    sensory 0..1 MS and
    bestLanguage 0..1 MS and
    dysarthria 0..1 MS and
    extinctionInattention 0..1 MS

* component[levelOfConsciousness] ^short = "1a 意識程度"
* component[levelOfConsciousness].code = $LOINC#70184-7
* component[levelOfConsciousness].value[x] ^short = "1a 意識程度分數。[0–3 的整數；非數值時原樣填字串]"
* component[levelOfConsciousness].valueInteger ^minValueInteger = 0
* component[levelOfConsciousness].valueInteger ^maxValueInteger = 3
* component[levelOfConsciousness].valueInteger MS

* component[locQuestions] ^short = "1b 意識提問"
* component[locQuestions].code = $LOINC#70185-4
* component[locQuestions].value[x] ^short = "1b 意識提問分數。[0–2 的整數；非數值時原樣填字串]"
* component[locQuestions].valueInteger ^minValueInteger = 0
* component[locQuestions].valueInteger ^maxValueInteger = 2
* component[locQuestions].valueInteger MS

* component[locCommands] ^short = "1c 意識指令"
* component[locCommands].code = $LOINC#70186-2
* component[locCommands].value[x] ^short = "1c 意識指令分數。[0–2 的整數；非數值時原樣填字串]"
* component[locCommands].valueInteger ^minValueInteger = 0
* component[locCommands].valueInteger ^maxValueInteger = 2
* component[locCommands].valueInteger MS

* component[bestGaze] ^short = "2 眼球運動"
* component[bestGaze].code = $LOINC#70187-0
* component[bestGaze].value[x] ^short = "2 眼球運動分數。[0–2 的整數；非數值時原樣填字串]"
* component[bestGaze].valueInteger ^minValueInteger = 0
* component[bestGaze].valueInteger ^maxValueInteger = 2
* component[bestGaze].valueInteger MS

* component[visual] ^short = "3 視野"
* component[visual].code = $LOINC#70188-8
* component[visual].value[x] ^short = "3 視野分數。[0–3 的整數；非數值時原樣填字串]"
* component[visual].valueInteger ^minValueInteger = 0
* component[visual].valueInteger ^maxValueInteger = 3
* component[visual].valueInteger MS

* component[facialPalsy] ^short = "4 顏面麻痺"
* component[facialPalsy].code = $LOINC#70189-6
* component[facialPalsy].value[x] ^short = "4 顏面麻痺分數。[0–3 的整數；非數值時原樣填字串]"
* component[facialPalsy].valueInteger ^minValueInteger = 0
* component[facialPalsy].valueInteger ^maxValueInteger = 3
* component[facialPalsy].valueInteger MS

* component[motorArmLeft] ^short = "5a 左上肢運動"
* component[motorArmLeft].code = $LOINC#70190-4
* component[motorArmLeft].value[x] ^short = "5a 左上肢運動分數。[0–4 的整數；非數值時原樣填字串]"
* component[motorArmLeft].valueInteger ^minValueInteger = 0
* component[motorArmLeft].valueInteger ^maxValueInteger = 4
* component[motorArmLeft].valueInteger MS

* component[motorArmRight] ^short = "5b 右上肢運動"
* component[motorArmRight].code = $LOINC#70967-5
* component[motorArmRight].value[x] ^short = "5b 右上肢運動分數。[0–4 的整數；非數值時原樣填字串]"
* component[motorArmRight].valueInteger ^minValueInteger = 0
* component[motorArmRight].valueInteger ^maxValueInteger = 4
* component[motorArmRight].valueInteger MS

* component[motorLegLeft] ^short = "6a 左下肢運動"
* component[motorLegLeft].code = $LOINC#70191-2
* component[motorLegLeft].value[x] ^short = "6a 左下肢運動分數。[0–4 的整數；非數值時原樣填字串]"
* component[motorLegLeft].valueInteger ^minValueInteger = 0
* component[motorLegLeft].valueInteger ^maxValueInteger = 4
* component[motorLegLeft].valueInteger MS

* component[motorLegRight] ^short = "6b 右下肢運動"
* component[motorLegRight].code = $LOINC#70968-3
* component[motorLegRight].value[x] ^short = "6b 右下肢運動分數。[0–4 的整數；非數值時原樣填字串]"
* component[motorLegRight].valueInteger ^minValueInteger = 0
* component[motorLegRight].valueInteger ^maxValueInteger = 4
* component[motorLegRight].valueInteger MS

* component[limbAtaxia] ^short = "7 肢體運動失調"
* component[limbAtaxia].code = $LOINC#70192-0
* component[limbAtaxia].value[x] ^short = "7 肢體運動失調分數。[0–2 的整數；非數值時原樣填字串]"
* component[limbAtaxia].valueInteger ^minValueInteger = 0
* component[limbAtaxia].valueInteger ^maxValueInteger = 2
* component[limbAtaxia].valueInteger MS

* component[sensory] ^short = "8 感覺"
* component[sensory].code = $LOINC#70193-8
* component[sensory].value[x] ^short = "8 感覺分數。[0–2 的整數；非數值時原樣填字串]"
* component[sensory].valueInteger ^minValueInteger = 0
* component[sensory].valueInteger ^maxValueInteger = 2
* component[sensory].valueInteger MS

* component[bestLanguage] ^short = "9 語言"
* component[bestLanguage].code = $LOINC#70194-6
* component[bestLanguage].value[x] ^short = "9 語言分數。[0–3 的整數；非數值時原樣填字串]"
* component[bestLanguage].valueInteger ^minValueInteger = 0
* component[bestLanguage].valueInteger ^maxValueInteger = 3
* component[bestLanguage].valueInteger MS

* component[dysarthria] ^short = "10 構音障礙"
* component[dysarthria].code = $LOINC#70195-3
* component[dysarthria].value[x] ^short = "10 構音障礙分數。[0–2 的整數；非數值時原樣填字串]"
* component[dysarthria].valueInteger ^minValueInteger = 0
* component[dysarthria].valueInteger ^maxValueInteger = 2
* component[dysarthria].valueInteger MS

* component[extinctionInattention] ^short = "11 忽略"
* component[extinctionInattention].code = $LOINC#70196-1
* component[extinctionInattention].value[x] ^short = "11 忽略分數。[0–2 的整數；非數值時原樣填字串]"
* component[extinctionInattention].valueInteger ^minValueInteger = 0
* component[extinctionInattention].valueInteger ^maxValueInteger = 2
* component[extinctionInattention].valueInteger MS
