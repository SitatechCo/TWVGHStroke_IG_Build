Instance: stroke-medadmin-ivtpa-example
InstanceOf: StrokeMedicationAdministration
Title: "腦中風 IV-tPA 給藥範例"
Description: "已完成的靜脈血栓溶解劑（IV-tPA）給藥紀錄。品項未明填 iv-tpa-unspecified；劑量以 mg 記錄。"
Usage: #example
* status = #completed
* medicationCodeableConcept.coding[strokeMedication] = StrokeMedicationCS#iv-tpa-unspecified "靜脈血栓溶解劑 IV-tPA（品項未明）"
* medicationCodeableConcept.text = "IV-tPA"
* subject = Reference(Patient/stroke-patient-example)
* context = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T10:15:00+08:00"
* dosage.text = "45 mg"
* dosage.dose = 45 'mg' "mg"

Instance: stroke-medadmin-intra-arterial-example
InstanceOf: StrokeMedicationAdministration
Title: "腦中風 EVT 動脈內藥物給藥範例"
Description: "EVT 術中動脈內給藥。只有藥名，填入 text；給藥時間只有時間、沒有日期；劑量原文為分次給予，無法可靠解析為單一數值與單位，原文記於 note，不建 dosage。"
Usage: #example
* status = #completed
* medicationCodeableConcept.text = "Urokinase"
* subject = Reference(Patient/stroke-patient-example)
* context = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime.extension[eventTimeOnly].valueTime = "11:20:00"
* partOf = Reference(stroke-procedure-evt-example)
* note.text = "劑量原文：20 萬單位，分次給予"

Instance: stroke-medadmin-sedation-example
InstanceOf: StrokeMedicationAdministration
Title: "腦中風 EVT 鎮靜藥給藥範例"
Description: "EVT 術中給予鎮靜藥。只有藥名，填入 text。院方已核定此藥劑量單位為微克，來源劑量可解析為 50 微克，以 UCUM ug 填 dosage.dose，並在 dosage.text 保留原文。"
Usage: #example
* status = #completed
* medicationCodeableConcept.text = "Fentanyl"
* subject = Reference(Patient/stroke-patient-example)
* context = Reference(Encounter/stroke-encounter-example)
* effectiveDateTime = "2025-01-15T11:02:00+08:00"
* partOf = Reference(stroke-procedure-evt-example)
* dosage.text = "Fentanyl 50 mcg IV"
* dosage.dose = 50 'ug' "mcg"
