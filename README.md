# 臺灣榮總腦中風實作指引（TW VGH Stroke IG）

本專案以 [FHIR Shorthand (FSH)](https://build.fhir.org/ig/HL7/fhir-shorthand/) 撰寫，基於 [HL7 FHIR R4.0.1](http://hl7.org/fhir/R4/)，並參考[臺灣核心實作指引（TW Core IG）](https://twcore.mohw.gov.tw/ig/twcore/index.html)。

## 目錄結構

| 路徑 | 說明 |
|------|------|
| `input/fsh/profiles/` | Profiles |
| `input/fsh/extensions/` | Extensions |
| `input/fsh/codesystems/` | CodeSystems |
| `input/fsh/valuesets/` | ValueSets |
| `input/fsh/examples/` | 範例 |
| `input/pagecontent/` | 說明頁面（Markdown） |
| `input/includes/menu.xml` | 網站選單 |

## 建置方式

```bash
# 編譯 FSH 為 FHIR JSON（快速語法檢查）
sushi .

# 更新 IG Publisher
./_updatePublisher.sh

# 完整建置 IG 網站（含驗證）
./_genonce.sh
```

Windows 使用 `.bat` 版本，持續建置使用 `_gencontinuous.sh`。

## 專案資訊

| 項目 | 說明 |
|------|------|
| Canonical URL | `http://vgh-stroke-ig.fhir.tw` |
| Package ID | `tw.vgh.stroke` |
| 發布單位 | 高雄榮民總醫院 (Kaohsiung Veterans General Hospital, KSVGH) |
| 版本 | 0.1.0 |
| FHIR 版本 | R4.0.1 |
| 上層依賴 | TW Core IG 1.0.0 |

## 授權

本專案內容以 [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.zh-hant)（姓名標示─非商業性─禁止改作 4.0 國際）授權條款釋出，詳見 [LICENSE](LICENSE)。
