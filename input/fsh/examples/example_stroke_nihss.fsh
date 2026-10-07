Instance: stroke-nihss-admission-example
InstanceOf: StrokeNIHSS
Title: "腦中風 NIHSS 入院評估範例"
Description: "入院 NIHSS 評估包含 15 個分項與總分，來源評估序號填 1。"
Usage: #example
* extension[assessmentPhase].valueCode = #admission
* extension[assessmentSequence].valuePositiveInt = 1
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = $LOINC#72089-6 "Total score [NIH Stroke Scale]"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T10:30:00+08:00"
* valueInteger = 12
* component[levelOfConsciousness].code = $LOINC#70184-7 "Level of consciousness [NIH Stroke Scale]"
* component[levelOfConsciousness].valueInteger = 0
* component[locQuestions].code = $LOINC#70185-4 "LOC questions [NIH Stroke Scale]"
* component[locQuestions].valueInteger = 1
* component[locCommands].code = $LOINC#70186-2 "LOC commands [NIH Stroke Scale]"
* component[locCommands].valueInteger = 0
* component[bestGaze].code = $LOINC#70187-0 "Best gaze [NIH Stroke Scale]"
* component[bestGaze].valueInteger = 1
* component[visual].code = $LOINC#70188-8 "Visual [NIH Stroke Scale]"
* component[visual].valueInteger = 0
* component[facialPalsy].code = $LOINC#70189-6 "Facial palsy [NIH Stroke Scale]"
* component[facialPalsy].valueInteger = 2
* component[motorArmLeft].code = $LOINC#70190-4 "Motor arm Left arm [NIH Stroke Scale]"
* component[motorArmLeft].valueInteger = 0
* component[motorArmRight].code = $LOINC#70967-5 "Motor arm Right arm [NIH Stroke Scale]"
* component[motorArmRight].valueInteger = 3
* component[motorLegLeft].code = $LOINC#70191-2 "Motor leg Leg - left [NIH Stroke Scale]"
* component[motorLegLeft].valueInteger = 0
* component[motorLegRight].code = $LOINC#70968-3 "Motor leg Leg - right [NIH Stroke Scale]"
* component[motorLegRight].valueInteger = 2
* component[limbAtaxia].code = $LOINC#70192-0 "Limb ataxia [NIH Stroke Scale]"
* component[limbAtaxia].valueInteger = 0
* component[sensory].code = $LOINC#70193-8 "Sensory [NIH Stroke Scale]"
* component[sensory].valueInteger = 1
* component[bestLanguage].code = $LOINC#70194-6 "Best language [NIH Stroke Scale]"
* component[bestLanguage].valueInteger = 1
* component[dysarthria].code = $LOINC#70195-3 "Dysarthria [NIH Stroke Scale]"
* component[dysarthria].valueInteger = 1
* component[extinctionInattention].code = $LOINC#70196-1 "Extinction and inattention [NIH Stroke Scale]"
* component[extinctionInattention].valueInteger = 0

Instance: stroke-nihss-24h-example
InstanceOf: StrokeNIHSS
Title: "腦中風 NIHSS 治療後 24 小時評估範例"
Description: "治療後 24 小時 NIHSS 評估：構音障礙分項來源為非數值 X，以 valueString 原樣保留，總分照來源原值填寫。"
Usage: #example
* extension[assessmentPhase].valueCode = #24h
* status = #final
* category[survey] = $ObsCategory#survey "Survey"
* code = $LOINC#72089-6 "Total score [NIH Stroke Scale]"
* subject = Reference(Patient/stroke-patient-example)
* encounter = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-16T11:00:00+08:00"
* valueInteger = 6
* component[levelOfConsciousness].code = $LOINC#70184-7 "Level of consciousness [NIH Stroke Scale]"
* component[levelOfConsciousness].valueInteger = 0
* component[locQuestions].code = $LOINC#70185-4 "LOC questions [NIH Stroke Scale]"
* component[locQuestions].valueInteger = 0
* component[locCommands].code = $LOINC#70186-2 "LOC commands [NIH Stroke Scale]"
* component[locCommands].valueInteger = 0
* component[bestGaze].code = $LOINC#70187-0 "Best gaze [NIH Stroke Scale]"
* component[bestGaze].valueInteger = 0
* component[visual].code = $LOINC#70188-8 "Visual [NIH Stroke Scale]"
* component[visual].valueInteger = 0
* component[facialPalsy].code = $LOINC#70189-6 "Facial palsy [NIH Stroke Scale]"
* component[facialPalsy].valueInteger = 1
* component[motorArmLeft].code = $LOINC#70190-4 "Motor arm Left arm [NIH Stroke Scale]"
* component[motorArmLeft].valueInteger = 0
* component[motorArmRight].code = $LOINC#70967-5 "Motor arm Right arm [NIH Stroke Scale]"
* component[motorArmRight].valueInteger = 2
* component[motorLegLeft].code = $LOINC#70191-2 "Motor leg Leg - left [NIH Stroke Scale]"
* component[motorLegLeft].valueInteger = 0
* component[motorLegRight].code = $LOINC#70968-3 "Motor leg Leg - right [NIH Stroke Scale]"
* component[motorLegRight].valueInteger = 1
* component[limbAtaxia].code = $LOINC#70192-0 "Limb ataxia [NIH Stroke Scale]"
* component[limbAtaxia].valueInteger = 0
* component[sensory].code = $LOINC#70193-8 "Sensory [NIH Stroke Scale]"
* component[sensory].valueInteger = 1
* component[bestLanguage].code = $LOINC#70194-6 "Best language [NIH Stroke Scale]"
* component[bestLanguage].valueInteger = 1
* component[dysarthria].code = $LOINC#70195-3 "Dysarthria [NIH Stroke Scale]"
* component[dysarthria].valueString = "X"
* component[extinctionInattention].code = $LOINC#70196-1 "Extinction and inattention [NIH Stroke Scale]"
* component[extinctionInattention].valueInteger = 0
