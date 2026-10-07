### 重要異動公告

<div class="bg-warning" markdown="1">

**0.1.0 初版**

1. **[邏輯模型](logical-models.html)**：依腦中風資料庫三個資料來源的譯碼簿與實際檔案，建立個管系統、EVT 登錄及 RAPID 影像分析三個邏輯模型，並提供原始欄位與 FHIR 路徑對照。
2. **[FHIR Profiles 及 Extensions](profiles-and-extensions.html)**：以 TW Core 1.0.0 為基礎，定義病人、就醫、生命徵象、NIHSS／mRS／GCS 量表、中風評估、EVT 處置、檢驗、用藥、處置、影像及登錄表單等 36 個 Profiles，三個資料來源各一個個案資料包 Bundle（共 39 個 Profiles），以及 4 個 Extensions。
3. **[專門術語](terminologies.html)**：建立中風觀察項目、用藥、處置及各類答案代碼的 CodeSystems 與 ValueSets；量表與生命徵象採用 LOINC，處置附加 SNOMED CT。
4. **[範例](examples.html)**：每個 Profile 皆提供範例。

本版使用 FHIR R4.0.1 與 TW Core IG 1.0.0。

</div>

### 介紹

<div style="padding-left: 10px;">
<p>臺灣榮總腦中風實作指引（TW VGH Stroke Implementation Guide，簡稱 TW VGH Stroke IG）採用 HL7® FHIR® standard（Fast Healthcare Interoperability Resources）IG 建置方法，以 <a href="http://hl7.org/fhir/R4/" target="_blank">FHIR R4.0.1</a> 為標準基礎，並參考<a href="https://twcore.mohw.gov.tw/ig/twcore/index.html" target="_blank">臺灣核心實作指引（TW Core Implementation Guide）1.0.0</a>，定義腦中風資料交換所需的 Resources（類似資料表）、資料項目（欄位）、基數（0..1、0..*、1..1 或 1..*）、資料類型（文字、日期時間、代碼等）與可綁定代碼（及其綁定強制程度）等，供健康照護資訊系統開發與實作者以 TW VGH Stroke IG 為基礎，訂定腦中風資料交換格式。</p>
</div>

### 背景

<div style="padding-left: 10px;">
<p>高雄榮民總醫院的腦中風資料分散於三個來源：腦中風個管系統（NCVA）、急性缺血性腦中風動脈取栓（EVT）登錄資料，以及 RAPID 腦部影像分析結果。三個來源的欄位定義、代碼與識別方式各不相同。本 IG 先以<a href="logical-models.html">邏輯模型</a>整理各來源的原始欄位，再據以設計 FHIR Profiles，使三個來源的資料能以一致的格式交換與整合。</p>
<p>TW VGH Stroke IG 內容會隨版本持續更新，各版皆附有異動說明。所有進一步定義的 Resources 或 Profiles 皆統稱為 Profiles；各 Profiles 依在地實際採用與不再修改的程度標記「成熟度（Maturity Level）」，簡稱 FMM（源自常見的 CMM 級別）。實作者可依 FMM 等級（level）判斷規範文件的成熟與穩定度。以下為已定義的 FMM 等級：</p>
<p><strong>DRAFT 0</strong> 此 Resource 或 Profile（規範文件）已發布於目前建置版本，此等級代表草稿。</p>
<p><strong>FMM 1</strong> 符合 DRAFT 0 條件，且規範文件在建置過程中無任何警語，負責的工作小組亦確認此規範文件基本完備、可供實作使用。</p>
<p><strong>FMM 2</strong> 符合 FMM 1 條件，且此規範文件已通過測試，成功支援至少三套獨立系統間的互操作性（即至少三套系統實作此規範並成功互通資料）。測試系統需涵蓋規範文件的大部分內容（例如至少 80% 的核心資料），並在至少一個宣告範圍內使用半真實資料與情境（例如聯測）；互通結果須提交報告並獲工作小組接受。</p>
<p><strong>FMM 3</strong> 符合 FMM 2 條件；此規範文件已獲工作小組驗證符合《<a href="https://confluence.hl7.org/display/FHIR/Conformance+QA+Criteria">Conformance Resource Quality Guidelines</a>》，且通過一輪正式投票；並由來自至少 3 家不同機構的至少 10 位實作者提出意見，促成至少一項實質變更。</p>
<p><strong>FMM 4</strong> 符合 FMM 3 條件，且此規範文件已正式出版（例如：FHIR 實作指引），並已實際應用於多個雛型專案；負責的工作小組亦認定此規範文件已足夠穩定，後續若有非向下相容（non-backward compatible）的異動，須與實作者協商諮詢。</p>
<p><strong>FMM 5</strong> 符合 FMM 4 條件，且此規範文件已在 FMM 1 以上等級（即試用等級）歷經兩個正式出版週期，並實際應用於至少五套獨立的產品系統。</p>
<p><strong>Normative（規範）</strong> 此規範文件已獲認定為穩定。</p>
<p>TW VGH Stroke IG 目前所有規範文件皆為 <strong>FMM 0 (DRAFT)</strong>。</p>
</div>

### 如何閱讀這個實作指引（IG）

<div style="padding-left: 10px;">
<p>TW VGH Stroke IG 網站架構如下圖所示，各功能說明如下：</p>

<img class="figure-img img-responsive img-rounded center-block" src="index_structure.png" alt="IG架構圖" style="display: block;margin-left: auto;margin-right: auto;width: 70%;"/>
<div style="clear:both;"></div>

<ul>
  <li><strong><a href="index.html">應用說明</a></strong>：TW VGH Stroke IG 介紹與背景說明。</li>
  <li><strong><a href="toc.html">目錄</a></strong>：本 IG 所有頁面目錄。</li>
  <li><strong><a href="artifacts.html">規範文件</a></strong>：TW VGH Stroke IG 的所有規範文件，包括邏輯模型、Profiles、Extensions 及專門術語。
    <ul>
      <li><strong><a href="logical-models.html">邏輯模型</a></strong>：收錄腦中風資料庫三個來源的邏輯模型（Logical Models），定義各來源的所有資料欄位、格式與值域。實作者可透過「Mappings」頁籤，查閱各欄位對應的原始欄位名稱，以及對應至本 IG 的哪個 Profile 與資料項目（element）。</li>
      <li><strong><a href="profiles-and-extensions.html">FHIR Profiles 及 Extensions</a></strong>：
        <ul>
          <li>TW VGH Stroke IG 所有 Profiles 與 Extensions 的定義及範例，依共用資料元素、生命徵象與量表、中風評估、EVT 處置、用藥與處置、影像、表單與追溯分類。</li>
          <li>各資料項目應填入的內容、格式、單位、可選值與缺值處理。</li>
          <li>各資料項目對應不同實作強制程度的 Terminology。</li>
          <li>各資料項目的限制（Constraints）。</li>
        </ul>
      </li>
      <li><strong><a href="terminologies.html">專門術語</a></strong>：TW VGH Stroke IG 收錄的專門術語，包含代碼系統（Code Systems）與值集（Value Sets）。NIHSS、mRS、GCS 與生命徵象採用 LOINC，醫療處置另可附加 SNOMED CT，中風診斷採用 ICD-10-CM；若無精確對應的標準代碼，則使用本 IG 本地代碼。</li>
    </ul>
  </li>
  <li><strong><a href="examples.html">範例</a></strong>：TW VGH Stroke IG 的所有範例，依 Profile 分類列出。</li>
  <li><strong><a href="downloads.html">結構定義與範例檔下載</a></strong>：下載完整 IG、NPM Package、規範文件定義、值集展開、範例、試算表與 Schematron。</li>
</ul>
</div>

### 作者與貢獻者

<div style="padding-left: 10px;">
<table class="grid rwd-table">
  <thead>
    <tr class="header">
      <th style="width:10%; vertical-align: middle;">角色</th>
      <th style="width:10%; vertical-align: middle;">貢獻版次</th>
      <th style="width:25%; vertical-align: middle;">姓名</th>
      <th style="width:35%; vertical-align: middle;">所屬單位</th>
      <th style="vertical-align: middle;">聯絡方式</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="vertical-align: middle;">作者</td>
      <td style="vertical-align: middle;">0.1.0</td>
      <td style="vertical-align: middle;">楊宇凡（Yu-Fan Yang）</td>
      <td style="vertical-align: middle;">矽塔資訊服務有限公司<br />（Sitatech Information Services Co., Ltd）</td>
      <td style="vertical-align: middle;"><a href="mailto:ceo@sita.tech">ceo@sita.tech</a></td>
    </tr>
    <tr>
      <td style="vertical-align: middle;">貢獻者</td>
      <td style="vertical-align: middle;">0.1.0</td>
      <td style="vertical-align: middle;">陳靖勳（Jing-Shiun Chen）</td>
      <td style="vertical-align: middle;">矽塔資訊服務有限公司<br />（Sitatech Information Services Co., Ltd）</td>
      <td style="vertical-align: middle;"><a href="mailto:pt@sita.tech">pt@sita.tech</a></td>
    </tr>
    <tr>
      <td style="vertical-align: middle;">貢獻者</td>
      <td style="vertical-align: middle;">0.1.0</td>
      <td style="vertical-align: middle;">張士宏（Shih-Hung Jhang）</td>
      <td style="vertical-align: middle;">矽塔資訊服務有限公司<br />（Sitatech Information Services Co., Ltd）</td>
      <td style="vertical-align: middle;"><a href="mailto:kevin0216@sita.tech">kevin0216@sita.tech</a></td>
    </tr>
  </tbody>
</table>
</div>
