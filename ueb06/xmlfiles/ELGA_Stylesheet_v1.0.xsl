<?xml version="1.0" encoding="UTF-8"?>
<!--
"ELGA Referenz-Stylesheet" - Hinweise zur Nutzung

Das "ELGA Referenz-Stylesheet" ermöglicht eine allgemeine, einheitliche und benutzerfreundliche Darstellung von medizinischen CDA-Dokumenten (HL7 CDA Release 2.0),
die als gemäß der Vorgaben der ELGA CDA Implementierungsleitfäden erstellt wurden. Das "ELGA Referenz-Stylesheet" wurde auf Grundlage von Vorarbeiten der Firmen
"USECON The Usability Consultants" und "NETCONOMY Software & Consulting GmbH" unter Leitung der ELGA GmbH von Arbeitsgruppen zur Harmonisierung
der CDA Implementierungsleitfäden gemäß dem Stand der Technik und unter Anwendung der größtmöglichen Sorgfalt auf seine Anwendbarkeit getestet und überprüft.

Das "ELGA Referenz-Stylesheet" wird von der ELGA GmbH bis auf Widerruf unentgeltlich und nicht-exklusiv sowie zeitlich und örtlich unbegrenzt, jedoch beschränkt auf
Verwendungen für die Zwecke der "Clinical Document Architecture" (CDA) zur Verfügung gestellt. Veränderungen des "ELGA Referenz-Stylesheet" für die lokale
Verwendung sind zulässig. Derartige Veränderungen (sogenannte bearbeitete Fassungen) dürfen ihrerseits publiziert und Dritten zur Weiterverwendung und Bearbeitung zur Verfügung
gestellt werden. Bei der Veröffentlichung von bearbeiteten Fassungen ist darauf hinzuweisen, dass diese auf Grundlage des von der ELGA GmbH publizierten
"ELGA Referenz-Stylesheet" erstellt wurden.

Die Anwendung sowie die allfällige Bearbeitung des "ELGA Referenz-Stylesheet" erfolgt in ausschließlicher Verantwortung der AnwenderInnen.
Aus der Veröffentlichung, Verwendung und/oder Bearbeitung können keinerlei Rechtsansprüche gegen die ELGA GmbH erhoben oder abgeleitet werden.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3" xmlns:n2="urn:hl7-org:v3/meta/voc" xmlns:voc="urn:hl7-org:v3/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="urn:ihe:pharm:medication" exclude-result-prefixes="n1 n2 voc xsi ns2" id="ELGA_Referenzstylesheet_1.07.004.1" >
  <xsl:output method="html" omit-xml-declaration="yes" indent="yes" encoding="utf-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd" />

  <!--    
  ShowRevisionMarks:
  Wert 0: Eingefügter Text wird normal, gelöschter Text wird nicht dargestellt
  Wert 1: Eingefügter Text wird unterstrichen und kursiv, gelöschter Text wird durchgestrichen dargestellt
  -->
  <xsl:param name="param_showrevisionmarks" />
  
  <xsl:variable name="showrevisionmarks">
    <xsl:choose>
      <xsl:when test="not($param_showrevisionmarks)">
        <xsl:value-of select="0" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param_showrevisionmarks" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!--    
  HideHeader:
  Wert 0: Header-Daten (Patienteninformationen) werden angezeigt
  Wert 1: Header-Daten (Patienteninformationen) werden ausgeblendet
  -->
  <xsl:param name="param_hideheader" />
  
  <xsl:variable name="hideheader">
    <xsl:choose>
      <xsl:when test="not($param_hideheader)">
        <xsl:value-of select="0" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param_hideheader" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  
  <!-- 
  use external css 
  useexternalcss:   Wert 0: Externes CSS deaktiviert  
                    Wert 1: Externes CSS aktiviert
  externalcssname:  Name der CSS-Datei bei useexternalcss = 1 
  
  -->
  <xsl:param name="param_useexternalcss" />
  
  <xsl:variable name="useexternalcss">
    <xsl:choose>
      <xsl:when test="not($param_useexternalcss)">
        <xsl:value-of select="0" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param_useexternalcss" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>  
  
  <xsl:param name="param_externalcssname" />
  
  <xsl:variable name="externalcssname">
    <xsl:if test="$param_externalcssname">
      <xsl:value-of select="$param_externalcssname" />
    </xsl:if>
  </xsl:variable> 
  
  
  <!--
  print icon visibility
    1: show print icon
    0: hide print icon
  -->
  <xsl:param name="param_printiconvisibility" />
  
  <xsl:variable name="printiconvisibility">
    <xsl:choose>
      <xsl:when test="not($param_printiconvisibility)">
        <xsl:value-of select="0" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param_printiconvisibility" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <!--
  document state
    1: document is deprecated
    0: document is not deprecated
  -->
  <xsl:param name="param_isdeprecated" />
  
  <xsl:variable name="isdeprecated">
    <xsl:choose>
      <xsl:when test="not($param_isdeprecated)">
        <xsl:value-of select="0" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param_isdeprecated" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!--
   strict mode disabled
     1: valid and invalid documents will be rendered (only allowed in debug mode!)
     0: only valid documents will be rendered (default)
   -->
  <xsl:param name="param_strictModeDisabled" />

  <xsl:variable name="isStrictModeDisabled">
    <xsl:choose>
      <xsl:when test="not($param_strictModeDisabled)">
        <xsl:value-of select="0" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param_strictModeDisabled" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

<!--
 Base64 decoder service URL: The URL of the base64 decoder servlet installation. An example for the base64 decoder
 servlet is available at http://www.elga.gv.at.
 If the parameter is set, the base64 decoding of attachments is enabled.
 If the parameter is not set, a generic hint will be displayed and the base 64 decoding of attachments is disabled.
-->
<xsl:param name="param_base64DecoderServiceUrl" />

<xsl:variable name="base64DecoderServiceUrl">
    <xsl:choose>
        <xsl:when test="not($param_base64DecoderServiceUrl)">
            <xsl:value-of select="''" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$param_base64DecoderServiceUrl" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<!--
 gesundheit.gv.at service URL. Used for LOINC code resolution.
-->
<xsl:param name="param_LOINCResolutionUrl" />

<xsl:variable name="LOINCResolutionUrl">
<xsl:choose>
    <xsl:when test="not($param_LOINCResolutionUrl)">
        <xsl:value-of select="'https://www.gesundheit.gv.at/linkaufloesung/applikation-flow?quelle=GHP&amp;flow=LO&amp;leistung=LA-GP-LO-'" />
    </xsl:when>
    <xsl:otherwise>
        <xsl:value-of select="$param_LOINCResolutionUrl" />
    </xsl:otherwise>
</xsl:choose>
</xsl:variable>

<!--
    show info button
        0: disable info button
        1: enable info button in "ELGA Laborbefund EIS Full Support" documents
-->
<xsl:param name="param_enableInfoButton" />

<xsl:variable name="enableInfoButton">
    <xsl:choose>
        <xsl:when test="not($param_enableInfoButton)">
            <xsl:value-of select="0" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$param_enableInfoButton" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<!--
    show tables in best guess mode
       1: invalid tables will be rendered as good as possible (only allowed in debug mode!; only possible with param_strictModeDisabled = 1!)
       0: only valid tables will be rendered (default)
-->
<xsl:param name="param_showTableInBestGuess" />

<xsl:variable name="showTableInBestGuess">
    <xsl:choose>
        <xsl:when test="not($param_showTableInBestGuess)">
            <xsl:value-of select="0" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$param_showTableInBestGuess" />
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

  <!-- helper vars, transform to lower / uppercase -->
  <xsl:variable name="lc" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uc" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

  <!--
  global variables for the document
  (document title, language, patient sex, gendered patient title)
   -->
  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="/n1:ClinicalDocument/n1:title">
        <xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
      </xsl:when>
      <xsl:otherwise>Clinical Document</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="language"><xsl:value-of select="/n1:ClinicalDocument/n1:languageCode/@code" /></xsl:variable>
  <xsl:variable name="sex" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code"/>
  <xsl:variable name="genderedpatient">
    <xsl:choose>
      <xsl:when test="$sex='M'"><xsl:text>Patient</xsl:text></xsl:when>
      <xsl:when test="$sex='F'"><xsl:text>Patientin</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text>Patient(in)</xsl:text></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="documentValid">
    <xsl:if test="$isStrictModeDisabled='0'">
      <xsl:call-template name="checkDocumentValid" />
    </xsl:if>
  </xsl:variable>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$documentValid = ''">
        <xsl:apply-templates select="n1:ClinicalDocument"/>
      </xsl:when>
      <xsl:otherwise>
        <html>
          <head>
            <meta http-equiv="X-UA-Compatible" content="IE=9; chrome=1" />
            <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
            <xsl:comment> Do NOT edit this HTML directly, it was generated via an XSL transformation from the original release 2 CDA Document. </xsl:comment>
            <title>Ungültiges Dokument</title>
          </head>
          <body style="background-color: white; color: black; font-family: Arial,sans-serif; font-size: 100%; line-height: 130%;">
            <table style="border: 0.1em solid black; width: 100%; align: center" cellspacing="0" cellpadding="0">
              <tr>
                <td style="padding: 1em; text-align: center;"><xsl:text>Das Dokument kann wegen einer ungültigen Formatanweisung nicht dargestellt werden.</xsl:text></td>
              </tr>
            </table>
          </body>
        </html>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="n1:ClinicalDocument">

    <html>
    <!--
      HTML Head
      Document title and patient name is shown in browser tab
    -->
      <head>
        <meta http-equiv="X-UA-Compatible" content="IE=9; chrome=1" />
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <xsl:comment> Do NOT edit this HTML directly, it was generated via an XSL transformation from the original release 2 CDA Document. </xsl:comment>
        <title>
          <xsl:value-of select="$title"/> | <xsl:value-of select="$genderedpatient" />:
          <xsl:call-template name="getName">
            <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name"/>
          </xsl:call-template>
        </title>
        <style type="text/css" media="screen,print">
body {
  font-family: Arial, sans-serif;
  font-size: 100%;
  line-height: 130%;
  <xsl:choose>
    <xsl:when test="$isdeprecated=0">
      <xsl:text>color: black;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>color: #666666;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  background-color: white;
}

.outerContainer {

}

.bodyContentContainer {
  width: 900px;
  margin: 0 auto 0 auto;
}

img {
  border: none;
}

h2 img {
  vertical-align: text-top;
  margin-right: 8px;
}

h3 img {
  vertical-align: middle;
  margin-right: 2px;
}

a {
  color: #004A8D;
}

a:hover {
  text-decoration: none;
}

a:focus, .multimediaSubmit:focus {
  background-color: #004A8D;
  color: #ffffff;
}

div.tableofcontentsMinimize a.show_tableofcontents, div.tableofcontentsMinimize a.hide_tableofcontents {
  font-weight: bold;
}

a.collapseShow {
  display: block;
  width: 40px;
  height: 20px;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($expandIcon),'&#32;','')" />);
}

a.collapseShow:hover {
  display: block;
  width: 40px;
  height: 20px;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($expandIconHover),'&#32;','')" />);
}

a.collapseHide:hover {
  display: block;
  width: 40px;
  height: 20px;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($collapseIcon),'&#32;','')" />);
}

a.collapseHide {
    display: block;
    width: 40px;
    height: 20px;
    background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($collapseIconHover),'&#32;','')" />);
}

p {
  margin: 0;
}

.clearer {
  clear: both;
}

.header {
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>padding: 1em 0 1em 0;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>padding: 1em 0 0.3em 0;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>  
}

.header h1 {
  margin: 0;
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>font-size: 180%;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>  font-size: 140%;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
}

.header p {  
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>padding-top: 0.7em;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>padding-top: 0.3em;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
}

.header .logo {
  float: right;
  overflow: hidden;
  text-align: right;
  width: 270px;
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>height: 80px;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>height: 50px;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>  
}
.header .logo img {
  max-width: 270px; 
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>max-height: 80px;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>max-height: 50px;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
}

.print {
  margin-left: 2em;
  vertical-align: top;
}

.tableofcontents {
  margin-bottom: 1em;
}
.tableofcontents .left {
  float: left;
  width: 50%;
  background-color: #DDDDDD;
}
.tableofcontents .right {
  float: left;
  width: 50%;
}
.tableofcontents .right .container,
.tableofcontents .left .container {
  padding: 1em;
}

.tableofcontents .information {
  padding-bottom: 1em;
  font-weight: bold;
}
.subtitle_create {
  padding-bottom: 0.5em;
}

h1 {
  font-size: 130%;
}

h2 {
  font-size: 120%;
  margin-bottom: 0.5em;
  margin-top: 1.5em;
}

.section_indent h2, h3 {
  font-size: 115%;
  margin-bottom: 0.5em;
  margin-top: 1em;
}

.section_indent .section_indent h2, h4 {
  font-size: 110%;
}

h4 .backlink {
  display: none;
}

.backlink {
  display: inline-block;
  float: right;
  font-size: 130%;
  text-decoration: none;
  padding: 10px;
  background-color: #EEEEEE;
  border: 1px solid #004a8d;
}
.backlink:hover {
  background-color: black;
  color: white;
}

.caption {
  font-size: 120%;
  padding: 0.5em 0 0.5em 0;
  display: block;
}
.paragraph {
  padding: 0.5em 0 0.5em 0;
}

h4 {
  font-size: 110%;
}

.error {
  color: red;
}

.risk {
  border: 0.2em solid red;
  padding-left: 1em;
  padding-bottom: 1em;
  margin-top: 1em;
  background-color: yellow;
}

.risk .section_text {
  padding-left: 0;
}
.risk .backlink {
  display: none;
}

.xred {
  color: #B10F3D;
  font-weight: bold;
}

.xblue {
  color: #0060f0;
  font-weight: bold;
}

.lighter {
  color: #666666;
}

.hideCreatedByTo,
.createdbyto,
.collapseTrigger,
.bottomline .element {
  cursor: pointer;
}
.hideCreatedByTo:hover,
.createdbyto:hover,
.collapseTrigger:hover,
.bottomline .element:hover {
  background-color: #ffffd1 !important;
}

.hideCreatedByTo,.createdbyto {
  background-color: #dddddd;
  padding: 0.5em;
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>margin-bottom: 1em;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>margin-bottom: 0.3em;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
}

.hideCreatedByTo .created,.hideCreatedByTo .to,.createdbyto .to,.createdbyto .created
  {
  font-weight: bold;
  padding-right: 1em;
}

.collapseLinks {

}

.leftsmall {
  float: left;
  width: 12%;
}

.leftwide {
  float: left;
  width: 33%;
  word-wrap: break-word;
}

.hideCreatedByTo .leftsmall,.createdbyto .leftsmall {
  text-align: right;
  padding-left: 0.5em;
}

.body_section {

}

.body_section h1 {
  background-color: #C7D9FF;
  padding: 0.3em 0 0.3em 0.5em;
}

h1.body_section_header {
  margin-bottom: 0;
}

.salutation {
  padding-top: 1em;
  padding-bottom: 1em;
  font-weight: normal;
}

.salutation .section_text {
  padding: 0;
}

.leavetaking {
  padding-top: 3em;
  padding-bottom: 1em;
  font-weight: normal;
}

.leavetaking .section_text {
  padding: 0;
}

.section_indent {
  padding-left: 1em;
}

.section_text {
  padding-left: 1em;
}

.section_table {
  border: 0.1em solid black;
  width: 100%;
}

.section_table td ul {
  margin-top: 0;
  margin-bottom: 0;
}

.section_table th {
  text-align: left;
  background-color: #dddddd;
  border-bottom: 0.2em solid white;
}

.section_table tr.even {
  background-color: #eeeeee;
}

.section_table th,.section_table td {
  padding: 0.3em;
  vertical-align: top;
}

.section_table tfoot tr td{
  border-top: 0.1em solid black;
  font-size: 90%;
}

.tableFormatExceptionInformation {
  text-align: center;
  color: #FF00FF;
}

/* Addresses */
.address {
  margin-bottom: 1em;
}

.recipient {
  margin-top: 1em;
}

div.collapseTrigger, div.collapseTriggerWithoutHover {
  background-color: #dddddd;
  padding: 0.5em 0.5em 0.5em 0.5em;
}

div.collapseTrigger h1, div.collapseTriggerWithoutHover h1 {
  float: left;
  margin: 0;
  padding-right: 0.5em;
}

div.collapseTriggerWithoutHover .authenticatorShortInfo,
div.collapseTrigger .clientShortInfo,
div.collapseTrigger .stayShortInfo,
div.collapseTrigger .patientShortInfo,
{
  float: left;
}

.authenticatorShortInfo
{
  float: left;
  width: 640px;
}

div.collapseTrigger .stayShortInfo {
  width: 100%;
}

.patientTitle {
  float: left;
  width: 18%;
}
.patientTitle h1 {
  padding: 0;
}
.patientShortInfo {
  float: left;
  width: 82%;
}

div.collapseTrigger .authenticatorShortInfo .name, div.collapseTriggerWithoutHover .authenticatorShortInfo .name, div.collapseTrigger .clientShortInfo .name,div.collapseTrigger .stayShortInfo .name,div.collapseTrigger .patientShortInfo .name
  {
  font-size: 140%;
}

div.collapseTrigger .collapseLinks, div.hideCreatedByTo .collapseLinks, div.createdbyto .collapseLinks {
  padding-right: 0.5em;
  width: 20px;
}

.collapseLinks {
  float: left;
  display: block;
  font-weight: bold;
}

/* patient container */
.patientContainer {
  <xsl:choose>
    <xsl:when test="$hideheader=0">
      <xsl:text>margin-bottom: 1em;</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>margin-bottom: 0.3em;</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
}

.patientContainer .date, .patientContainer .addresses,.patientContainer .guardian,
.patientContainer .data, .patientContainer .collapsableStay
  {
  padding: 1em 0 1em 0;
}

.patientContainer h2 {
  margin: 0;
  padding-right: 1em;
  padding-bottom: 1em;
  padding-left: 0.5em;
}

.patientContainer .leftsmall {
  width: 30%;
}

.patientContainer .leftwide {
  width: 70%;
}

.patientContainer td {
  vertical-align: top;
}

.patientContainer .firstrow {
  padding-right: 1em;
  font-weight: bold;
}

tr.spacer td {
  padding-bottom: 1em;
}

.contactAddress .address {
  float: left;
    padding-right: 1em;
  width: 12em;
}

.addressRegion {
  font-weight: bold;
}

.guardianContact {
  padding-bottom: 1em;
}

.guardianContact .address {
  margin: 0;
}

.guardianContact .organisationName {
  padding-top: 0.5em;
  font-weight: bold;
}

.guardianName {
  font-weight: bold;
}

/* stay container */
.stayShortInfo {
  margin-top: 0.7em;
}

.stayShortInfo h1 {
  font-weight: normal;
}

.collapsableStay .leftsmall {
  float: left;
  width: 35%;
  padding-left: 4em;
}

.collapsableStay .leftwide {
  float: left;
  width: 42%;
  padding-left: 8%;
}

.collapsableStay .medic {

}

.collapsableStay .medicName {
  font-weight: bold;
}
.collapsableStay .organisationName {
  font-weight: bold;
}

.collapsableStay .az {
  margin-bottom: 1em;
  padding-left: 4em;
}

/* client container */
.clientContainer {
  margin-bottom: 1em;
}

.clientContainer .leftsmall {
  float: left;
  width: 35%;
  padding-left: 4em;
}

.clientContainer .leftwide {
  float: left;
  width: 42%;
  padding-left: 8%;
}

.clientContainer .collapsable {
  padding-top: 1em;
  padding-bottom: 1em;
}

.clientContainer .clientdata,
.clientContainer .collapseable .name {
  font-weight: bold;
}

/* authenticatorContainer */
.authenticatorContainer {
  padding-bottom: 1em;
}

.authenticatorContainer .collapsed .name,
.authenticatorContainer .organisationName {
  font-weight: bold;
}

.authenticatorContainer .leftsmall {
  float: left;
  width: 35%;
  padding-left: 4em;
}

.authenticatorContainer .leftwide {
  float: left;
  width: 42%;
  padding-left: 8%;
}

.authenticatorContainer .collapsable {
  padding-top: 1em;
}

.authenticatorContainer .address {
  margin-bottom: 0em;
}


.bottomline_data .leftsmall {
  width: 30%;
}

.bottomline_data .leftwide {
  width: 60%;
}

.bottomline .collapseLinks {
  float: left;
  width: 3em;
}

.bottomline h2 {
  font-size: 100%;
  margin: 0;
}

h2 .collapseLinks, h3 .collapseLinks {
  float: right;
}

.bottomline .organisationName {
  font-weight: bold;
}

.bottomline .relationship {
  font-weight: normal;
}

.bottomline_data .element {
  clear: both;
  padding: 1em;
}

.bottomline_data .address {
  margin: 0;
}

.bottomline .element:nth-child(2n+1) {
  background-color: #eeeeee;
}
.bottomline .leftsmall .date {
  color: #666666;
}

/* tooltip */
.tooltipTrigger {
  position: relative;
  cursor: help;
}

.tooltip {
  display: none;
  font-weight: bold;
}

.tooltipTrigger:hover .tooltip,.showTooltip .tooltip {
  display: block;
  position: absolute;
  top: 2em;
  left: 2em;
  background-color: white;
  border: 0.1em solid black;
  z-index: 100;
  font-size: 11px;
  padding: 0.5em;
  color: black;
}

.tooltipentry {
  display: block;
}

.backlinktooltip {
  width: 80px;
  font-size: 60%;
}

.warning_icon .collapseLinks, .law_icon .collapseLinks {
  font-weight: normal;
  float: none;
}

.infotooltip {
  width: 470px;
}

.tableofcontenttooltip {
  width: 170px;
}

.risktooltip {
  width: 100px;
}


/* end tooltip */

.footer {
  margin-bottom: 100px;
}

.footer_logo {
  float: right;
  height: 40px;
  width: 40px;
  padding-bottom: 1em;
}

/*
*	hide/show collapse triggers and collapseable
* by default (no javascript) triggers are hidden and content is shown
*/
.hide_all,.show_all, .print, .show_tableofcontents, .hide_tableofcontents {
  display: none;
}
.hide_all,.show_all, .show_tableofcontents, .hide_tableofcontents {
  padding-right: 1em;
}

.collapseLinks {
  display: none;
}

.hideCreatedByTo .leftwide p,.hideCreatedByTo .leftwide div {
  display: none;
}

html .hideCreatedByTo .leftwide p.organisationName {
  display: block;
}

.hideBottomlineCollapseable .leftwide div,.hideBottomlineCollapseable .leftwide p.telecom,.hideBottomlineCollapseable .leftsmall p
  {
  display: none;
}

.responsibleContact {
  border: 0.1em solid black;
  width: 40%;
  background-color: #ffff99;
  padding: 1em 1em 1em 20px;
  margin-bottom: 1em;
}

.responsibleContact .organisationName {
  font-weight: bold;
  word-wrap: break-word;
}

.responsibleContactAddress {
  padding-left: 1em;
}

/* warncontainer */
.warncontainer {
  background-color: #ffff99;
    border: 0.1em solid black;
    margin-bottom: 1em;
    padding: 0.5em;
}

.warncontainer a, .warncontainer .info {
  padding-left: 0.5em;
}
.warncontainer img {
  vertical-align: top;
}

.warningIcon {
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($warningIcon),'&#32;','')" />);
}

.warningIcon:hover {
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($warningIconHover),'&#32;','')" />);
}

.country,
.uppercase {
  text-transform: uppercase;
}

.smallcaps {
  font-variant: small-caps;
}

.nonbreaking {
  white-space: nowrap;
}

#IDPatientContainer {
  background-color: #99CCFF;
}

#IDfulfillmentof {
  background-color: #E3ECFF;
}

.patientinformation_even{
  background-color: #FFFFFF;
}

.patientinformation_odd{
  background-color: #EEEEEE;
}

.inlineimg{
  max-width: 100%;
}

.multimediaicon {
  position: relative;
  top: 3px;
}

.serviceeventlist {
  padding: 0 0 0 0px;
  margin: 0 0 0 0px;
  list-style: none;
}

.deprecated {
  height: 100px;
  font-size: 88px;
  font-weight: bold;
  color: red;
  letter-spacing: 42px;
  margin: 15px;
  line-height: 100%;
}

.warning_icon, .law_icon {
  float: left;
  width: 100%;
  height: 24px;
}

p.warning_icon img, p.law_icon img {
  float: left;
}

.tableofcontentsMinimize {
  float: left; 
  padding: 0 0.5em; 
  width: 20px;
}

.expandIcon {
  width: 30px;
  height: 20px;
  float: left;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($expandIcon),'&#32;','')" />);
}

.expandIcon:hover {
  width: 30px;
  height: 20px;
  float: left;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($expandIconHover),'&#32;','')" />);
}

.collapseIcon {
  width: 30px;
  height: 20px;
  float: left;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($collapseIcon),'&#32;','')" />);
}

.collapseIcon:hover {
  width: 30px;
  height: 20px;
  float: left;
  background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($collapseIconHover),'&#32;','')" />);
}

.show_tableofcontents, .hide_tableofcontents, .hide_all, .show_all {
  float: left;
}

#backToTopContainer {
    width: 953px;
    position: fixed;
    bottom: 0%;
    margin-bottom: 30px;
}

.modal {
  display: none;
  position: fixed;
  z-index: 100;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(200,200,200);
  background-color: rgba(0,0,0,0.4);
}

.modal-content {
  background-color: #EEEEEE;
  margin: 15% auto;
  border: 1px solid #004a8d;
  width: 900px;
}

.modal-header {
  padding: 20px;
}

.modal-footer {
  padding: 20px;
  padding-bottom: 23px;
  text-align: right;
}

.modal-body {
  padding-left: 20px;
  padding-right: 20px;
}

.modal-close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.modal-close:hover, .modal-close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.modal-ok, .modal-ok:visited {
  color: #FFF;
  background-color: #004a8d;
  text-decoration: none;
  padding-left: 20px;
  padding-right: 20px;
  padding-top: 7px;
  padding-bottom: 7px;
  font-weight: bold;
}

.modal-ok:hover, .modal-ok:focus {
  color: #aaa;
  text-decoration: none;
  cursor: pointer;
}

.infoButton {
  cursor: pointer;
}
        </style>
        <style type="text/css" media="print">
html body {
  font-size: 12pt;
}

html .bodyContentContainer {
  width: 100%;
  margin: 0;
}

html .hide_all,.show_all, .print, .collapseShow, .collapseHide,
.show_tableofcontents, .hide_tableofcontents, .backlink {
  display: none !important;
}

html .section_text, html .section_indent {
  padding: 0;
}

html .hideCreatedByTo .leftsmall, html .hideCreatedByTo .leftwide,
html .createdbyto .leftsmall, html .createdbyto .leftwide {
  float: none;
  text-align: left;
}
html .hideCreatedByTo .leftwide,
html .createdbyto .leftwide {
  padding-left: 5em;
}

html .patientContainer .leftwide, html .patientContainer .leftsmall,
html .stayContainer .leftwide, html .stayContainer .leftsmall {
  float: none;
  padding-left: 10%;
  width: 100%;
}

a {
  text-decoration: none;
}

.footer_logo {
  height: 1cm;
  width: 1cm;
}

        </style>
<style  type="text/css">

    .multimediaSubmit {
      border: medium none;
      color: #004A8D;
      cursor: pointer;
      text-decoration: underline;
      font-size: 100%;
      padding: 0 0 0 17px;
      margin: 0 0 0 0px;
    }

    .multimediaSubmit:hover {
        text-decoration: none;
    }

    .multimediaSubmitPDF {
      background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($pdfIcon),'&#32;','')" />);
    }

    .multimediaSubmitAudio {
      background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($audioIcon),'&#32;','')" />);
    }

    .multimediaSubmitVideo {
      background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($videoIcon),'&#32;','')" />);
    }

    .multimediaSubmitVarious {
      background: no-repeat left center url(<xsl:value-of select="translate(normalize-space($variousIcon),'&#32;','')" />);
    }

    .emptyblock {
        border: 0.1em dashed black !important;
    }
</style>
        <script type="text/javascript">
<xsl:variable name="javascript">
<![CDATA[

var HIDE_SPECIAL_CONTAINER_CLASS = "hideCreatedByTo";
var SPECIAL_CONTAINER_CLASS = "createdbyto";
var COLLAPSEABLE_CONTAINER_CLASS = "collapsable";
var COLLAPSE_TRIGGER_CONTAINER_CLASS = "collapseTrigger";
var TABLE_OF_CONTENTS_CLASS = "tableofcontents";
var COLLAPSE_LINKS_CONTAINER_CLASS = "collapseLinks";
var HIDE_TRIGGER_CLASS = "collapseHide";
var SHOW_TRIGGER_CLASS = "collapseShow";
var HIDE_ALL_TRIGGER_CLASS = "hide_all";
var SHOW_ALL_TRIGGER_CLASS = "show_all";
var HIDE_TABLE_OF_CONTENTS_CLASS = "hide_tableofcontents";
var SHOW_TABLE_OF_CONTENTS_CLASS = "show_tableofcontents";
var PRINT_BUTTON_CLASS = "print";
var SHOW_BOTTOMLINE_CLASS = "bottomlineCollapseable";
var HIDE_BOTTOMLINE_CLASS = "hideBottomlineCollapseable";



function getElementsByClassFromNode(searchClass, node) {
    "use strict";
    var classElements = [],
        els,
        elsLen,
        pattern,
        i = 0,
        j = 0,
        tag = '*';

    els = node.getElementsByTagName(tag);
    elsLen = els.length;
    pattern = new RegExp("(^|\\s)" + searchClass + "(\\s|$)");
    for (i = 0; i < elsLen; i++) {
        if (pattern.test(els[i].className)) {
            classElements[j] = els[i];
            j++;
        }
    }
    return classElements;
}

function getElementsByClass(searchClass) {
    "use strict";
    return getElementsByClassFromNode(searchClass, window.document);
}

function updateStyleDisplay(node, value) {
    "use strict";
    var i = 0;
    for (i = 0; i < node.length; i++) {
        node[i].style.display = value;
    }
}

function setCollapseContainer(node, hide) {
    "use strict";
    if (node.tagName === "BODY") {
        return false;//error
    }
    if (node.className === SPECIAL_CONTAINER_CLASS || node.className === HIDE_SPECIAL_CONTAINER_CLASS) {
        if (hide === true) {
            node.className = HIDE_SPECIAL_CONTAINER_CLASS;
        } else {
            node.className = SPECIAL_CONTAINER_CLASS;
        }
        return true;
    }
    if (node.className === COLLAPSE_TRIGGER_CONTAINER_CLASS) {
        if (hide === true) {
            if (node.nextSibling.nodeType === 3) {
                node.nextSibling.nextSibling.style.display = "none";
            } else {
                node.nextSibling.style.display = "none"; //IE
            }
        } else {
            if (node.nextSibling.nodeType === 3) {
                node.nextSibling.nextSibling.style.display = "";
            } else {
                node.nextSibling.style.display = ""; //IE
            }
        }
        return true;
    }
    if (node.className === SHOW_BOTTOMLINE_CLASS || node.className === HIDE_BOTTOMLINE_CLASS) {
        if (hide === true) {
            node.className = HIDE_BOTTOMLINE_CLASS;
        } else {
            node.className = SHOW_BOTTOMLINE_CLASS;
        }
        return true;
    }
    setCollapseContainer(node.parentNode, hide);
}

/* all dynamic hideables in arrays */
var hideTriggerElements = null;
var showTriggerElements = null;
var collapseLinkContainerElements = null;
var showAllElements = null;
var hideAllElements = null;
var printElement = null;
var collapseAllElements = null;
var createdByToElements = null;
var bottomlineElements = null;
var tableofcontentsElement = null;
var hideTableofcontens = null;
var showTableofcontens = null;

function showCollapsed(node) {
    "use strict";
    setCollapseContainer(node, false); //false = show
    node.previousSibling.style.display = "block";
    node.style.display = "none";
    return false;
}

function hideCollapseable(node) {
    "use strict";
    setCollapseContainer(node, true); //true = hide
    node.nextSibling.style.display = "block";
    node.style.display = "none";
    return false;
}


function showAll() {
    "use strict";
    var i = 0;
    updateStyleDisplay(collapseAllElements, "");
    updateStyleDisplay(hideAllElements, "inline");
    updateStyleDisplay(showAllElements, "");
    updateStyleDisplay(hideTriggerElements, "block");
    updateStyleDisplay(showTriggerElements, "none");
    for (i = 0; i < createdByToElements.length; i++) {
        createdByToElements[i].className = SPECIAL_CONTAINER_CLASS;
    }
    for (i = 0; i < bottomlineElements.length; i++) {
        bottomlineElements[i].className = SHOW_BOTTOMLINE_CLASS;
    }
    showTableOfContents();
    return false;
}

function hideAll() {
    "use strict";
    var i = 0;
    updateStyleDisplay(collapseAllElements, "none");
    updateStyleDisplay(hideAllElements, "");
    updateStyleDisplay(showAllElements, "inline");
    updateStyleDisplay(hideTriggerElements, "none");
    updateStyleDisplay(showTriggerElements, "block");
    for (i = 0; i < createdByToElements.length; i++) {
        createdByToElements[i].className = HIDE_SPECIAL_CONTAINER_CLASS;
    }
    for (i = 0; i < bottomlineElements.length; i++) {
        bottomlineElements[i].className = HIDE_BOTTOMLINE_CLASS;
    }
    hideTableOfContents();
    return false;
}

function showTableOfContents() {
    "use strict";
    updateStyleDisplay(hideTableofcontens, "inline");
    updateStyleDisplay(showTableofcontens, "");
    updateStyleDisplay(tableofcontentsElement, "");
    return false;
}

function hideTableOfContents() {
    "use strict";
    updateStyleDisplay(hideTableofcontens, "");
    updateStyleDisplay(showTableofcontens, "inline");
    updateStyleDisplay(tableofcontentsElement, "none");
    return false;
}

function toggleCollapseable(node) {
    "use strict";
    var collapseLinksContainer,
        collapseLinks,
        i;
    collapseLinksContainer = getElementsByClassFromNode("collapseLinks", node);
    if(collapseLinksContainer && collapseLinksContainer.length > 0) {
        collapseLinks = collapseLinksContainer[0].getElementsByTagName("A");
        for (i = 0; i < collapseLinks.length; i++) {
            if(collapseLinks[i].style.display === "block" || collapseLinks[i].style.display === "") {
                if(collapseLinks[i].className === SHOW_TRIGGER_CLASS) {
                    showCollapsed(collapseLinks[i]);
                } else {
                    hideCollapseable(collapseLinks[i]);
                }
                break;
            }
        }
    }
}

function jump(elementID) {
    "use strict";
    var collapseLinksContainer,
        collapseLinks,
        i,
        node;
    node = window.document.getElementById(elementID);
    collapseLinksContainer = getElementsByClassFromNode("collapseLinks", node);
    if(collapseLinksContainer && collapseLinksContainer.length > 0) {
        collapseLinks = collapseLinksContainer[0].getElementsByTagName("A");
        for (i = 0; i < collapseLinks.length; i++) {
            if(collapseLinks[i].style.display === "block" || collapseLinks[i].style.display === "") {
                if(collapseLinks[i].className === SHOW_TRIGGER_CLASS) {
                    showCollapsed(collapseLinks[i]);
                }
                break;
            }
        }
    }
}

/* init document */
window.onload = startWrapper;

function startWrapper() {
  start();
  movetostart();
  printiconcontrol();
};

function start() {
    "use strict";
    var i = 0;
    //(javascript works) setup triggers, hide content

    // hide [-]
    hideTriggerElements = getElementsByClass(HIDE_TRIGGER_CLASS);
    updateStyleDisplay(hideTriggerElements, "none");

    showTriggerElements = getElementsByClass(SHOW_TRIGGER_CLASS);
    // show collapse triggers
    collapseLinkContainerElements = getElementsByClass(COLLAPSE_LINKS_CONTAINER_CLASS);
    updateStyleDisplay(collapseLinkContainerElements, "block");

    showAllElements = getElementsByClass(SHOW_ALL_TRIGGER_CLASS);
    updateStyleDisplay(showAllElements, "inline");

    // show table of contents button
    showTableofcontens = getElementsByClass(SHOW_TABLE_OF_CONTENTS_CLASS);
    updateStyleDisplay(showTableofcontens, "inline");

    hideAllElements = getElementsByClass(HIDE_ALL_TRIGGER_CLASS);
    hideTableofcontens = getElementsByClass(HIDE_TABLE_OF_CONTENTS_CLASS);

    /* hide all collapseable elements */
    collapseAllElements = getElementsByClass(COLLAPSEABLE_CONTAINER_CLASS);
    updateStyleDisplay(collapseAllElements, "none");

    createdByToElements = getElementsByClass(SPECIAL_CONTAINER_CLASS);
    for (i = 0; i < createdByToElements.length; i++) {
        createdByToElements[i].className = HIDE_SPECIAL_CONTAINER_CLASS;
    }

    bottomlineElements = getElementsByClass(SHOW_BOTTOMLINE_CLASS);
    for (i = 0; i < bottomlineElements.length; i++) {
        bottomlineElements[i].className = HIDE_BOTTOMLINE_CLASS;
    }

    tableofcontentsElement = getElementsByClass(TABLE_OF_CONTENTS_CLASS);
    updateStyleDisplay(tableofcontentsElement, "none");
};
]]>
</xsl:variable>


<xsl:variable name="javascriptmove">
  <xsl:choose>
    <xsl:when test="$hideheader='0'">
      <![CDATA[
        function movetostart() {
        };
      ]]>
    </xsl:when>
    <xsl:otherwise>
      <![CDATA[
        function movetostart() {
          window.location.hash="IDPatientContainer"
        };
      ]]>    
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="jsprinticoncontrol">
  <xsl:choose>
    <xsl:when test="$printiconvisibility='1'">
      <![CDATA[
        function printiconcontrol() {
          "use strict";
          // show print button
          printElement = getElementsByClass(PRINT_BUTTON_CLASS);
          updateStyleDisplay(printElement, "inline");
        };
      ]]>
    </xsl:when>
    <xsl:otherwise>
       <![CDATA[
        function printiconcontrol() {
          "use strict";
          // hide print button
          printElement = getElementsByClass(PRINT_BUTTON_CLASS);
          updateStyleDisplay(printElement, "none");
        };
      ]]>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>


      <!-- Beginning of CDATA section -->
      <xsl:text disable-output-escaping="yes"><![CDATA[//<]]></xsl:text><xsl:text disable-output-escaping="yes">![CDATA[</xsl:text>

      <!-- original javascript -->
      <xsl:value-of  select="$javascript" disable-output-escaping="yes"/>
      
      <xsl:value-of select="$javascriptmove" disable-output-escaping="yes"/>
      
      
      <xsl:value-of select="$jsprinticoncontrol" disable-output-escaping="yes" />

      <!-- End of CDATA section -->
      <xsl:text>//]]</xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>

        </script>
        
        <xsl:if test="$useexternalcss=1">
          <style type="text/css" media="screen">
            <xsl:value-of select="document($externalcssname)" />
          </style>
        </xsl:if>
        
      </head>

      <!--
        HTML Body
      -->
      <body>
      <div class="outerContainer" id="elgadocument">
        <div class="bodyContentContainer">
        
        <xsl:call-template name="documentstate" />
        
        <xsl:variable name="headerWidth">
          <xsl:choose>
            <xsl:when test="$hideheader=1">
              <xsl:value-of select="580" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="625" />
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        
        <!-- document header -->
        
        <div class="header">
          <xsl:if test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code = 'BRIEFT']/n1:entry/n1:observationMedia">
            <div class="logo">
              <xsl:call-template name="renderLogo">
                <xsl:with-param name="logo" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section/n1:entry/n1:observationMedia" />
              </xsl:call-template>
            </div>
          </xsl:if>
          <xsl:if test="$hideheader=1">
          <div class="tableofcontentsMinimize tooltipTrigger">
            <a class="show_tableofcontents" href="#" onclick="showTableOfContents(); return false;" style="padding-right: 0em;">
              <div class="expandIcon"></div>
              <span class="tooltip tableofcontenttooltip">
                Inhaltsverzeichnis ausklappen
              </span>
            </a>
            <a class="hide_tableofcontents" href="#" onclick="hideTableOfContents(); return false;" style="padding-right: 0em;">
              <div class="collapseIcon"></div>
              <span class="tooltip tableofcontenttooltip">
                Inhaltsverzeichnis einklappen
              </span>
            </a>
          </div>
          </xsl:if>
          <div style="float: left; width: {$headerWidth}px;">
            <h1 class="tooltipTrigger" style="line-height: 115%">
              <xsl:value-of select="$title"/>
              <span class="tooltip">
                <xsl:call-template name="getHL7ATXDSDokumentenklassen">
                  <xsl:with-param name="code" select="/n1:ClinicalDocument/n1:code/@code" />
                </xsl:call-template>
              </span>
            </h1>
            <p class="subtitle_create">
              <xsl:text>Erzeugt am </xsl:text>
              <xsl:call-template name="formatDate">
                <xsl:with-param name="date" select="/n1:ClinicalDocument/n1:effectiveTime" />
                <xsl:with-param name="date_shortmode">false</xsl:with-param>
              </xsl:call-template>
              <xsl:text> | Version: </xsl:text><xsl:value-of select="/n1:ClinicalDocument/n1:versionNumber/@value" />
            </p>
          </div>
          <div class="clearer" ></div>
          <xsl:if test="$hideheader=0">
            <hr />
            <div>
              <a class="show_tableofcontents" href="#" onclick="showTableOfContents(); return false;">
                <div class="expandIcon"></div>
                Inhaltsverzeichnis ausklappen
              </a>
              <a class="hide_tableofcontents" href="#" onclick="hideTableOfContents(); return false;">
                <div class="collapseIcon"></div>
                Inhaltsverzeichnis einklappen
              </a>
              <a class="show_all" href="#" onclick="showAll(); return false;">
                <div class="expandIcon"></div>
                Alle Inhalte ausklappen
              </a>
              <a class="hide_all" href="#" onclick="hideAll(); return false;">
                <div class="collapseIcon"></div>
                Alle Inhalte einklappen
              </a>
              <a class="print" href="#" onclick="javascript:window.print()"><img alt="Dokument drucken" src="data:image/gif;base64,R0lGODlhFAAUAKIEAENFRcHCwoKDgwQHB////wAAAAAAAAAAACH5BAEAAAQALAAAAAAUABQAAANb
  SDrcrjCSAYK9TcYh9CDAp02dJIYj5zmBFJbjJEIMnM5ByAB87+8dh3DoEBCPRUosxlEuPUaADMlo
  NaWUixZjNQ4CqiUHLNCFmRmazdMyrU3tDbWqEdjv+Hs8AQA7" /></a>
            </div>
            <div style="clear: both;"></div>
          </xsl:if>
        </div>
        <!-- END document header -->

        <!--
          table of contents
          if there is no javascript enabled it is shown as default
          else it is hidden and can be shown
          on click jump to the element (if needed opens the elemnt before)
        -->
        <div class="tableofcontents">
          <div class="left">
            <div class="container">
              <p>
                <a href="#IDPatientContainer" onclick="jump('IDPatientContainer');"><xsl:value-of select="$genderedpatient" /></a>
                <xsl:if test="/n1:ClinicalDocument/n1:componentOf and $hideheader='0'">
                  <xsl:text> / </xsl:text>
                  <a href="#IDCollapseableStay" onclick="jump('IDPatientContainer');">
                    <xsl:call-template name="getEncounter" />
                  </a>
                </xsl:if>
              </p>
              <xsl:if test="/n1:ClinicalDocument/n1:inFulfillmentOf">
                <p><a href="#IDfulfillmentof" onclick="jump('IDfulfillmentof');">Auftraggeber(in)</a></p>
              </xsl:if>
              <p><a href="#IDCreatedbyto" onclick="jump('IDCreatedbyto');">Erstellt von / An</a></p>
              <xsl:text>-----</xsl:text>              
              <xsl:choose>
                <xsl:when test="n1:component/n1:structuredBody">
                  <xsl:for-each select="//n1:section" >
                    <xsl:variable name="indent" select="count(ancestor::*/n1:section)-1" />
                    <xsl:choose>
                        <!-- do not show following titel -->
                        <xsl:when test="n1:code/@code = 'BRIEFT' "/>
                        <xsl:when test="n1:code/@code = 'ABBEM' "/>
                        <xsl:otherwise>
                            <xsl:variable name="anchor">
                                <xsl:choose>
                                    <xsl:when test="n1:code[@code = '51898-5' and @codeSystem ='2.16.840.1.113883.6.1']">
                                        <!-- Risiko -->
                                        <xsl:text>#id</xsl:text><xsl:value-of select="n1:code/@code" /><xsl:text>-</xsl:text><xsl:value-of select="../../n1:code/@code" /><xsl:value-of select="riskIndex" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>#id</xsl:text><xsl:value-of select="n1:code/@code" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <p style="padding-left: {$indent}em;"><a href="{$anchor}"><xsl:value-of select="n1:title" /></a></p>
                        </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                  <p><a href="#IDBody"><xsl:text>Unstrukturierter Inhalt</xsl:text></a></p>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text>-----</xsl:text>
              <p><a href="#IDResponsibleContact">Kontaktperson für Fragen</a></p>
              <p><a href="#IDAuthenticatorContainer" onclick="jump('IDAuthenticatorContainer');">Unterzeichnet von</a></p>
              <p><a href="#IDBottomline" onclick="jump('IDBottomline');">Zusätzliche Informationen über das Dokument</a></p>
            </div>
          </div>
          <div class="right"></div>
          <div class="clearer"></div>
        </div><!-- END table of contents -->


        <!--
          Patient element collapseable includes information about the stay
        -->
        <xsl:variable name="sex" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code"/>
        <xsl:variable name="sexName">
          <xsl:choose>
            <xsl:when test="$sex='M'">m&#xE4;nnlich</xsl:when>
            <xsl:when test="$sex='F'">weiblich</xsl:when>
            <xsl:when test="$sex='UN'">nicht zugewiesen</xsl:when>
            <xsl:otherwise>unbekannt</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:variable name="birthdate_short">
          <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime"/>
           <xsl:with-param name="date_shortmode">true</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="birthdate_long">
          <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime"/>
            <xsl:with-param name="date_shortmode">false</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="svnnumber">
          <xsl:choose>
            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id[@root='1.2.40.0.10.1.4.3.1']/@extension">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id[@root='1.2.40.0.10.1.4.3.1']/@extension"/>
            </xsl:when>
            <xsl:otherwise>nicht angegeben</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <div class="patientContainer">
          <div class="collapseTrigger" onclick="toggleCollapseable(this);" id="IDPatientContainer">
            <div class="patientTitle">
              <xsl:call-template name="collapseTrigger"/>
              <h1><xsl:value-of select="$genderedpatient"/>:</h1>
            </div>
            <div class="patientShortInfo">
              <p class="name">
                <xsl:call-template name="getName">
                  <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name"/>
                  <xsl:with-param name="printFamilyNameBold">1</xsl:with-param>
                </xsl:call-template>
             </p>
              <xsl:if test="$hideheader=0">
                <p>
                  <xsl:text>Geschlecht: </xsl:text>
                  <xsl:value-of select="$sexName"/>
                  <xsl:text> | </xsl:text>
                  <xsl:text>geboren am: </xsl:text>
                  <xsl:value-of select="$birthdate_short"/>
                  <xsl:text> | </xsl:text>
                  <xsl:text>SVN: </xsl:text>
                  <xsl:value-of select="$svnnumber"/>
                  <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian">
                    <xsl:text> | </xsl:text>
                    <br />
                    <xsl:text>Gesetzlicher Vertreter vorhanden</xsl:text>
                  </xsl:if>
                </p>
                <xsl:if test="/n1:ClinicalDocument/n1:componentOf">
                  <div class="stayShortInfo">
                    <h1 class="stayheader">
                      <xsl:call-template name="getEncounter"/>
                      <xsl:text>:</xsl:text>
                    </h1>
                    <p class="name">
                      <xsl:call-template name="getName">
                        <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name"/>
                      </xsl:call-template>
                    </p>
                    <p>
                      <xsl:call-template name="getAmbulatory">
                        <xsl:with-param name="code" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:code"/>
                        <xsl:with-param name="effectiveTime" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:effectiveTime"/>
                        <xsl:with-param name="date_shortmode">true</xsl:with-param>
                      </xsl:call-template>
                      <xsl:if test="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:id/@extension != ''">
                        <xsl:text> | </xsl:text>
                        <span class="nonbreaking">
                          <xsl:call-template name="getEncounterCaseNumber"/>
                          <b>
                            <xsl:apply-templates select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:id/@extension"/>
                          </b>
                        </span>
                      </xsl:if>
                    </p>
                  </div>
                </xsl:if>
                <!-- END stayShortInfo -->
              </xsl:if>
            </div>
            <div class="clearer"/>
          </div>
          <div class="collapsable">
            <!-- every 2nd entry with gray background-color. first entry can only have white background-color -->
            <!-- check if block(s) exists -->
            <xsl:variable name="residence">
              <xsl:choose>
                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr">
                  <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="0"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name="guard">
              <xsl:choose>
                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian">
                  <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="0"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <!-- allgemeine Daten -->
            <xsl:call-template name="getPatientInformationData">
              <xsl:with-param name="sexName" select="$sexName"/>      
              <xsl:with-param name="birthdate_long" select="$birthdate_long"/>
              <xsl:with-param name="svnnumber" select="$svnnumber"/>
            </xsl:call-template>
            <!-- bekannte Adressen -->
            <xsl:if test="$residence=1">
              <div class="patientinformation_odd">
                <xsl:call-template name="getPatientAdress"/>
              </div>
            </xsl:if>
            <!-- Sachwalter / Vormund -->
            <xsl:if test="$guard=1">
              <xsl:choose>
                <xsl:when test="$residence=1">
                  <div class="patientinformation_even" style="margin-top: 1em;">
                    <xsl:call-template name="getPatientGuardian"/>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="patientinformation_odd" style="margin-top: 1em;">
                    <xsl:call-template name="getPatientGuardian"/>
                  </div>
                </xsl:otherwise>
              </xsl:choose>      
            </xsl:if>
            <!-- Aufenthalt  -->
            <xsl:if test="/n1:ClinicalDocument/n1:componentOf">
              <xsl:choose>
                <xsl:when test="$residence=$guard">
                  <div class="patientinformation_odd">
                    <xsl:call-template name="getPatientStay"/>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="patientinformation_even">
                    <xsl:call-template name="getPatientStay"/>
                  </div>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </div>
        </div>
        <!-- END patient element -->

        <!--
          fulfillment of collapseable (labor document)
        -->
        <xsl:if test="/n1:ClinicalDocument/n1:participant/@typeCode = 'REF' and //n1:templateId/@root = '1.2.40.0.34.11.4' ">
          <div class="clientContainer">
            <div class="collapseTrigger" onclick="toggleCollapseable(this);" id="IDfulfillmentof">
              <xsl:call-template name="collapseTrigger"/>
              <h1><xsl:text>Auftraggeber(in):</xsl:text></h1>
              <div class="clientShortInfo">
                <p class="name">
                  <xsl:choose>
                    <xsl:when test="/n1:ClinicalDocument/n1:participant[@typeCode='REF']/n1:associatedEntity/n1:scopingOrganization/n1:name">
                      <xsl:call-template name="getName">
                        <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:participant[@typeCode='REF']/n1:associatedEntity/n1:scopingOrganization/n1:name" />
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>nicht angegeben</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                </p>
              </div>
              <div class="clearer"></div>
            </div>
            <div class="collapsable">
              <div class="leftsmall">
                <p class="name">
                  <xsl:call-template name="getName">
                    <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:participant[@typeCode='REF']/n1:associatedEntity/n1:scopingOrganization/n1:name"/>
                  </xsl:call-template>
                </p>
                <xsl:call-template name="getContactInfo">
                  <xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:participant[@typeCode='REF']/n1:associatedEntity"/>
                </xsl:call-template>
              </div>
              <div class="leftwide">
                <p class="clientdata"><xsl:text>Auftragsdaten: </xsl:text></p>
                <p>
                  Auftragsnummer:
                  <xsl:choose>
                    <xsl:when test="/n1:ClinicalDocument/n1:inFulfillmentOf/n1:order/n1:id/@extension">
                      <xsl:apply-templates select="/n1:ClinicalDocument/n1:inFulfillmentOf/n1:order/n1:id/@extension" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text>nicht angegeben</xsl:text>
                    </xsl:otherwise>
                  </xsl:choose>
                </p>
                <p class="date">
                  Auftragsdatum:
                  <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="/n1:ClinicalDocument/n1:participant[@typeCode='REF']/n1:time" />
                  </xsl:call-template>
                </p>
              </div>
              <div class="clearer"></div>
            </div>
          </div>
        </xsl:if>

        <!--
          FromTo element collapseable   
        -->
        <div class="createdbyto" onclick="toggleCollapseable(this);" id="IDCreatedbyto">
            <div class="patientTitle">
              <xsl:call-template name="collapseTrigger"/>
              <xsl:choose>
                <xsl:when test="/n1:ClinicalDocument/n1:author/n1:assignedAuthor">
                  <span class="created">Erstellt von: </span>
                </xsl:when>
                <xsl:otherwise>
                  <span class="created error">Erstellt von: (nicht vorhanden)</span>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <div class="leftwide">                            
              <xsl:if test="/n1:ClinicalDocument/n1:author[1]/n1:assignedAuthor[1]/n1:representedOrganization[1]">
                <xsl:call-template name="getOrganization">
                  <xsl:with-param name="organization" select="/n1:ClinicalDocument/n1:author[1]/n1:assignedAuthor[1]/n1:representedOrganization[1]"/>
                  <xsl:with-param name="showMore" select="1" />
                </xsl:call-template>
              </xsl:if>
            </div>
            <div class="leftsmall">
              <xsl:choose>
                <xsl:when test="/n1:ClinicalDocument/n1:informationRecipient[not(@typeCode) or @typeCode != 'TRC'][1]/n1:intendedRecipient/n1:receivedOrganization/n1:name">
                  <span class="to">An: </span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="to">Ergeht an: </span>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <div class="leftwide">
            <xsl:choose>
              <xsl:when test="/n1:ClinicalDocument/n1:informationRecipient[not(@typeCode) or @typeCode != 'TRC'][1]/n1:intendedRecipient/n1:receivedOrganization">
              <xsl:call-template name="getOrganization">
                <xsl:with-param name="organization" select="/n1:ClinicalDocument/n1:informationRecipient[not(@typeCode) or @typeCode != 'TRC'][1]/n1:intendedRecipient/n1:receivedOrganization"/>
              </xsl:call-template>
              </xsl:when>
              <xsl:when test="/n1:ClinicalDocument/n1:informationRecipient[not(@typeCode) or @typeCode != 'TRC'][1]/n1:intendedRecipient/n1:informationRecipient">
              <xsl:call-template name="getIntendedRecipient">
                <xsl:with-param name="recipient" select="/n1:ClinicalDocument/n1:informationRecipient[not(@typeCode) or @typeCode != 'TRC'][1]/n1:intendedRecipient"/>
              </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>(nicht vorhanden)</xsl:otherwise>
            </xsl:choose>
            </div>
            <div class="clearer"></div>
        </div><!-- END FromTo element -->

        <!--
          Warn container
          displays urgent information like risk or alternative denial if the document is well structured with [!]
          if the document is not well structured, there may be such information [?]
          also important law information (living will) is displayed [§]
        -->
        
	<!-- check if structured document -->
        <xsl:variable name="structuredDoc">
          <xsl:for-each select="/n1:ClinicalDocument/n1:templateId" >
            <xsl:if test="@root ='1.2.40.0.34.11.2.0.2' or @root ='1.2.40.0.34.11.2.0.3' or 
                          @root ='1.2.40.0.34.11.3.0.2' or @root ='1.2.40.0.34.11.3.0.3' or
                          @root ='1.2.40.0.34.11.12.0.2' or @root ='1.2.40.0.34.11.12.0.3'">found</xsl:if>
          </xsl:for-each>
       </xsl:variable>

	<!-- check if it is necessary to show the warn container -->
	<xsl:variable name="warncontainer">
	  <xsl:if test="($structuredDoc = 'found' and ((//*/n1:code/@code = '51898-5' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1') or (//*/n1:code/@code = '48765-2' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1') or (not(//*/n1:code/@code = '51898-5' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1') and not(//*/n1:code/@code = '48765-2' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1')))) or (//*/n1:code/@code = '42348-3' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1')">show</xsl:if>
	</xsl:variable>	

	<!-- check if document is a discharge letter -->
	<xsl:variable name="discharge">
          <xsl:for-each select="/n1:ClinicalDocument/n1:templateId">
	    <xsl:variable name="oid">
	      <xsl:value-of select="@root"/>
	    </xsl:variable>
	    <xsl:if test="contains($oid, '1.2.40.0.34.11.2') or contains($oid, '1.2.40.0.34.11.3')">true</xsl:if>
          </xsl:for-each>
	</xsl:variable>

	<xsl:if test="($warncontainer = 'show') or ($warncontainer = '' and contains($discharge, 'true'))">
          <div class="warncontainer" id="IDWarnContainer">
            <div class="warncontainer_content">
              <!-- if structured display warnings otherwise info that the document is not structured-->
              <xsl:choose>
                <xsl:when test="$structuredDoc = 'found' ">
                  <xsl:if test="//*/n1:code/@code = '51898-5' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1' ">
                    <p class="warning_icon">
                      <span class="collapseLinks tooltipTrigger">

                        <xsl:variable name="riskId">
                          <xsl:text>#id51898-5-</xsl:text><xsl:value-of select="//*/n1:code[@code='51898-5']/../../../n1:code/@code" />
                        </xsl:variable>

                        <a href="{$riskId}" class="warningIcon" style="padding-left: 28px">
                          <xsl:choose>
                            <xsl:when test="count(//*/n1:code[@code = '51898-5' and @codeSystem ='2.16.840.1.113883.6.1']) > 1">
                              <xsl:text>Mehrere Risiken</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text>Risiko</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                         <span class="tooltip risktooltip"><xsl:text>Gehe zu: Risiken</xsl:text></span>   
                        </a>
                      </span>
                    </p>
                    <div style="clear: both;"></div>
                  </xsl:if>
                  <xsl:if test="//*/n1:code/@code = '48765-2' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1' ">
                    <p class="warning_icon">
                      <span class="collapseLinks tooltipTrigger">
                        <a href="#id48765-2" class="warningIcon" style="padding-left: 28px">
                          <xsl:text>Allergien, Unverträglichkeiten und Risiken</xsl:text>
                          <span class="tooltip infotooltip">
                            <xsl:text>Gehe zu: Informationen zu Allergien, Unverträglichkeiten und Risiken</xsl:text>
                          </span>                      
                        </a>
                      </span>
                    </p>
                    <div style="clear: both;"></div>
                  </xsl:if>
                  <xsl:if test="not(//*/n1:code/@code = '51898-5' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1') and not(//*/n1:code/@code = '48765-2' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1')" >
                    <p class="warning_icon">
                      <xsl:call-template name="getWarningIcon" />
                      <span style="padding-left: 8px;"><xsl:text>Keine Warnungen</xsl:text></span>
                    </p>
                    <div style="clear: both;"></div>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="contains($discharge, 'true')">
                    <p class="question_icon">
                      <xsl:call-template name="getQuestionIcon" />
                      <span class="info">
                        <xsl:text>Für dieses Dokument wurden keine automatischen Hinweistexte erzeugt. Wichtige Informationen über Allergien, Risiken, Patientenverfügungen etc. sind möglicherweise im Befundtext enthalten.</xsl:text>
                      </span>
                    </p>
	  	  		  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
              <!-- display law info -->
              <xsl:if test="//*/n1:code/@code = '42348-3' and //*/n1:code/@codeSystem ='2.16.840.1.113883.6.1' ">
                <p class="law_icon">
                  <xsl:call-template name="getLawIcon" />
                  <span class="collapseLinks tooltipTrigger">
                    <a href="#id42348-3"><xsl:text>Patientenverfügung vorhanden</xsl:text>
                      <span class="tooltip infotooltip">Gehe zu: Patientenverfügung und andere juridische Dokumente</span>                      
                    </a>
                  </span>
                </p>
                <div style="clear: both;"></div>
              </xsl:if>
            </div>
          </div>
	</xsl:if>

        <!--
          BODY
        -->
        <div class="body_section" id="IDBody">
          <!-- javascript is disabled -->
          <noscript><div style="padding: 1em 0 1em 0"><b>Aktive Inhalte (in lokalen Dateien) werden in Ihrem Browser nicht zugelassen. Bitte treffen Sie die entsprechenden Einstellungen für eine optimale Darstellung.</b></div></noscript>
          <xsl:apply-templates select="n1:component/n1:structuredBody|n1:component/n1:nonXMLBody"/>
          <br />
          <br />
        </div><!-- END body section -->

        <!--
            FOOTER
        -->
        <xsl:call-template name="bottomline"/>
        <div class="clearer"></div>

        <hr />
        <div class="footer">
          <a href="http://www.elga.gv.at" target="_blank">
            <img class="footer_logo" src="data:image/png;base64,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" />
          </a>
          <p>ELGA - Meine elektronische Gesundheitsakte <a href="http://www.gesundheit.gv.at" target="_blank">www.gesundheit.gv.at</a></p>
          
          <xsl:call-template name="documentstate" />
        </div>
        <div id="backToTopContainer">
          <span class="collapseLinks tooltipTrigger" style="display: block; float: right;">
            <a class="backlink" href="#elgadocument">
              <xsl:text>[&#8593;]</xsl:text>
              <span class="tooltip backlinktooltip">
                <span>nach oben</span>
              </span>
            </a>
          </span>
        </div>
        <div style="clear: both;"></div>


        <div id="infoButtonPopUp" class="modal">
          <div class="modal-content">
            <div class="modal-header">
              <b>Information</b>
              <span id="modalClose" class="modal-close">&#215;</span>
            </div>
            <div class="modal-body">
              <p>Sie werden nun zu einer Informationsseite am öffentlichen Gesundheitsportal Österreichs weitergeleitet. Dieser Link ist nicht Teil des unterzeichneten Befundes. Er wurde nachträglich automatisch zur Anzeige hinzugefügt.</p>
            </div>
            <div class="modal-footer">
              <a id="eHealthPortalLink" target="_blank" style="text-decoration: none;"><span class="modal-ok">OK</span></a>
            </div>
          </div>
        </div>

        </div>
      </div>
        <script type="text/javascript">
          <xsl:variable name="javascriptpopup">
            <![CDATA[

              var modal = document.getElementById("infoButtonPopUp");
              var link = document.getElementById("eHealthPortalLink");

              var infoButtons = getElementsByClass("infoButton");
              for(var i=0; i<infoButtons.length; i++) {
                infoButtons[i].onclick = function() {
                  modal.style.display = "block";
                  link.href = "https://www.gesundheit.gv.at/linkaufloesung/applikation-flow?quelle=GHP&flow=LO&leistung=LA-GP-LO-" + this.getAttribute("data-observationCode")
                }
              }
              var span = document.getElementById("modalClose");
              span.onclick = function() {
                  modal.style.display = "none";
              }

              window.onclick = function(event) {
                  if (event.target == modal) {
                      modal.style.display = "none";
                  }
              }

            ]]>
          </xsl:variable>

          <!-- Beginning of CDATA section -->
          <xsl:text disable-output-escaping="yes"><![CDATA[//<]]></xsl:text><xsl:text disable-output-escaping="yes">![CDATA[</xsl:text>

          <!-- original javascript -->
          <xsl:value-of select="$javascriptpopup" disable-output-escaping="yes" />

          <!-- End of CDATA section -->
          <xsl:text>//]]</xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>


        </script>
      </body>

    </html>
  </xsl:template>


  <!-- Print elements as separated list -->
  <xsl:template name="renderListItems">
    <xsl:param name="list" />

    <xsl:for-each select="$list">
      <xsl:if test="position()>1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:value-of select="." />
    </xsl:for-each>
  </xsl:template>

  <!-- Get a Name -->
  <xsl:template name="getName">
    <xsl:param name="name"/>
    <xsl:param name="printFamilyNameBold" select="0" />

    <xsl:choose>
      <xsl:when test="$name/n1:family">
        <xsl:if test="$name/n1:prefix">
          <xsl:for-each select="$name/n1:prefix">
            <xsl:value-of select="."/>
            <xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:if>
        <xsl:for-each select="$name/n1:given">
          <xsl:value-of select="."/>
          <xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="$name/n1:family[not(@qualifier)]">
          <xsl:if test="count($name/n1:family[not(@qualifier)]) &gt; 1 and position() &gt; 1">
            <xsl:text> </xsl:text>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="$printFamilyNameBold='1'">
              <b><xsl:value-of select="."/></b>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
        <xsl:if test="$name/n1:suffix">
          <xsl:for-each select="$name/n1:suffix">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="."/>
          </xsl:for-each>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$name"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- guardian -->
  <xsl:template match="n1:guardian">
    <div class="guardianContact">
      <p class="guardianName">
        <xsl:if test="n1:guardianPerson/n1:name">
          <xsl:call-template name="getName">
            <xsl:with-param name="name" select="n1:guardianPerson/n1:name"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="n1:guardianOrganization/n1:name">
          <xsl:apply-templates select="n1:guardianOrganization/n1:name"/>
        </xsl:if>      
      </p>
      <xsl:call-template name="getContactInfo">
        <xsl:with-param name="contact" select="."/>
      </xsl:call-template>
      <xsl:if test="n1:guardianOrganization/n1:asOrganizationPartOf/n1:wholeOrganization">
        <xsl:call-template name="getOrganization">
          <xsl:with-param name="organization" select="n1:guardianOrganization/n1:asOrganizationPartOf/n1:wholeOrganization"/>
        </xsl:call-template>
      </xsl:if>
    </div>
  </xsl:template>

  <!--  Format Date
    outputs a date in day.month.year form
    e.g., 19991207  ==>  7. Dezember 1999
  -->
  <xsl:template name="formatDate">
    <xsl:param name="date"/>
    <!-- shortmode = true, display only the date, not the time -->
    <xsl:param name="date_shortmode" />

    <xsl:choose>
      <xsl:when test="not($date/@nullFlavor) and not($date/@nullFlavor='UNK') and $date">
        <xsl:call-template name="formateDateInternal">
          <xsl:with-param name="date" select="$date" />
          <xsl:with-param name="date_shortmode" select="$date_shortmode" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>unbekannt</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="formateDateInternal">
    <xsl:param name="date" />
    <xsl:param name="date_shortmode" />

    <xsl:choose>
      <xsl:when test="substring ($date/@value, 7, 1)='0'">
        <xsl:value-of select="substring ($date/@value, 8, 1)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring ($date/@value, 7, 2)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>. </xsl:text>
    <xsl:variable name="month" select="substring ($date/@value, 5, 2)"/>
    <xsl:choose>
      <xsl:when test="$month='01'">
        <xsl:text>Januar </xsl:text>
      </xsl:when>
      <xsl:when test="$month='02'">
        <xsl:text>Februar </xsl:text>
      </xsl:when>
      <xsl:when test="$month='03'">
        <xsl:text>März </xsl:text>
      </xsl:when>
      <xsl:when test="$month='04'">
        <xsl:text>April </xsl:text>
      </xsl:when>
      <xsl:when test="$month='05'">
        <xsl:text>Mai </xsl:text>
      </xsl:when>
      <xsl:when test="$month='06'">
        <xsl:text>Juni </xsl:text>
      </xsl:when>
      <xsl:when test="$month='07'">
        <xsl:text>Juli </xsl:text>
      </xsl:when>
      <xsl:when test="$month='08'">
        <xsl:text>August </xsl:text>
      </xsl:when>
      <xsl:when test="$month='09'">
        <xsl:text>September </xsl:text>
      </xsl:when>
      <xsl:when test="$month='10'">
        <xsl:text>Oktober </xsl:text>
      </xsl:when>
      <xsl:when test="$month='11'">
        <xsl:text>November </xsl:text>
      </xsl:when>
      <xsl:when test="$month='12'">
        <xsl:text>Dezember </xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:value-of select="substring ($date/@value, 1, 4)"/>
    <xsl:variable name="hour" select="substring ($date/@value, 9, 2)"/>
    <xsl:if test="$hour != '' and $date_shortmode != 'true'">
      <xsl:text> um </xsl:text>
      <xsl:choose>
        <!-- print "00:00" Uhr as "0:00" Uhr -->
        <xsl:when test="$hour='00'">
          <xsl:text>0</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring ($date/@value, 9, 2)"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>:</xsl:text>
      <xsl:value-of select="substring ($date/@value, 11, 2)"/>
      <xsl:text> Uhr </xsl:text>
    </xsl:if>

  </xsl:template>
  
  <!-- StructuredBody -->
  <xsl:template match="n1:component/n1:structuredBody">
    <xsl:apply-templates select="n1:component/n1:section"/>
  </xsl:template>


  <!--
    Component/Section
  -->
  <xsl:template match="n1:component/n1:section">
    <!-- zeige TITEL der Sektion -->
    <xsl:choose>
      <!-- Briefkopf: zeige keinen Titel -->
      <xsl:when test="n1:code/@code = 'BRIEFT' "/>
      <!-- Abschließende Bemerkungen -->
      <xsl:when test="n1:code/@code = 'ABBEM' " />
      <!-- do not show section risk here -->
      <xsl:when test="n1:code/@code = '51898-5' and n1:code/@codeSystem ='2.16.840.1.113883.6.1' "/>
      <!-- do not show section allergic here -->
      <xsl:when test="n1:code/@code = '48765-2' and n1:code/@codeSystem = '2.16.840.1.113883.6.1' " />
      <xsl:otherwise>
        <xsl:apply-templates select="n1:title">
          <xsl:with-param name="code" select="n1:code"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>

  <!-- the /end template tag is in Stylesheet_Base.xsl TODO: Refactor this -->

    <!-- text of section -->
    <xsl:choose>
      <!-- salutation (Briefkopf: eigene Formatierung / BRIEFT ABBEM) -->
      <xsl:when test="n1:code/@code = 'BRIEFT' ">
        <div class="salutation"><xsl:apply-templates select="n1:text"/></div>
      </xsl:when>
      <xsl:when test="n1:code/@code = 'ABBEM'">
        <div class="leavetaking"><xsl:apply-templates select="n1:text"/></div>
      </xsl:when>
      <!-- rendering for risk -->
      <xsl:when test="n1:code/@code = '51898-5' and n1:code/@codeSystem ='2.16.840.1.113883.6.1' ">
        <div class="risk">
          <xsl:apply-templates select="n1:title">
            <xsl:with-param name="code" select="n1:code"/>
            <xsl:with-param name="idprefix" select="concat('-', ../../n1:code/@code)" />
          </xsl:apply-templates>
          <xsl:apply-templates select="n1:text"/>
        </div>
      </xsl:when>
      <!-- rendering allergic(s) section -->
      <xsl:when test="n1:code/@code = '48765-2' and n1:code/@codeSystem = '2.16.840.1.113883.6.1' ">
        <div class="risk">
          <xsl:apply-templates select="n1:title">
            <xsl:with-param name="code" select="n1:code"/>
            <xsl:with-param name="idprefix" select="''" />
          </xsl:apply-templates>
          <xsl:apply-templates select="n1:text"/>
        </div>      
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="n1:text"/>
      </xsl:otherwise>
    </xsl:choose>

    <!-- section is intended -->
    <xsl:if test="n1:component/n1:section">
      <div class="section_indent">
        <xsl:apply-templates select="n1:component/n1:section"/>
      </div>
    </xsl:if>

    <xsl:if test="/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.2' and n1:code/@code = 'ABBEM' and 
        (//n1:templateId/@root='1.2.40.0.34.11.2.2.13' or //n1:templateId/@root='1.2.40.0.34.11.2.2.14' or 
    	//n1:templateId/@root='1.2.40.0.34.11.2.2.18' or //n1:templateId/@root='1.2.40.0.34.11.2.2.19' or 
    	//n1:templateId/@root='1.2.40.0.34.11.2.2.19' or //n1:templateId/@root='1.2.40.0.34.11.2.2.20' or 
    	//n1:templateId/@root='1.2.40.0.34.11.2.2.21' or //n1:templateId/@root='1.2.40.0.34.11.2.2.22' or
    	//n1:templateId/@root='1.2.40.0.34.11.1.2.4' or //n1:templateId/@root='1.2.40.0.34.11.1.2.3')">
        <hr/>
    </xsl:if>
  </xsl:template>

  <!--   Title within a section from h2 to h4 -->
  <xsl:template match="n1:title">
    <xsl:param name="code" select="''"/>    
    <xsl:param name="idprefix" select="''"/>
    <xsl:variable name="header">
      <xsl:choose>
        <xsl:when test="count(ancestor::*/n1:section) > 1">h3</xsl:when>
        <xsl:when test="count(ancestor::*/n1:section) > 2">h4</xsl:when>
        <xsl:otherwise>h2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:element name="{$header}"> 
      <xsl:attribute name="id">id<xsl:value-of select="concat($code/@code, $idprefix)"/></xsl:attribute>
      <xsl:attribute name="class"></xsl:attribute> <!-- enter class 'tooltipTrigger' to enable title tooltip -->

      <!-- display icon: Risiko oder Allergie-->
      <xsl:if test="($code/@code='51898-5' and $code/@codeSystem ='2.16.840.1.113883.6.1') or ($code/@code='48765-2' and $code/@codeSystem ='2.16.840.1.113883.6.1')">
        <xsl:call-template name="getWarningIcon" />
      </xsl:if>

      <!-- display icon: Patientenverfuegung-->
      <xsl:if test="$code/@code='42348-3' and $code/@codeSystem ='2.16.840.1.113883.6.1'">
        <xsl:call-template name="getLawIcon" />
      </xsl:if>

      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <!--   footnoteref -->
  <xsl:template match="n1:footnote">
    <i>
      <xsl:apply-templates/>
    </i>
  </xsl:template>

          <!--   remark -->
  <xsl:template match="n1:remark">
  <tr>
    <td/>
    <td colspan="6" bgcolor="#ffff66" style="font-size:80%">
      <i>
        <xsl:apply-templates/>
      </i>
    </td>
  </tr>
  </xsl:template>

  <!--   Text   -->
  <xsl:template match="n1:text">
    <div class="section_text"><xsl:apply-templates/></div>
  </xsl:template>

  <!--   paragraph  -->
  <xsl:template match="n1:paragraph">
    <p class="paragraph"><xsl:apply-templates/></p>
  </xsl:template>

  <!--   line break  -->
  <xsl:template match="n1:br">
    <xsl:apply-templates/>
    <br />
  </xsl:template>

  <!--   Content w/ deleted text is crossed out -->
  <xsl:template match="n1:content[@revised='delete']">
    <xsl:if test="$showrevisionmarks = 1">
      <span style="text-decoration:line-through;">
        <xsl:apply-templates />
      </span>
    </xsl:if>
  </xsl:template>


  <!-- Content w/ insert text is underlined and italic -->
  <xsl:template match="n1:content[@revised='insert']">
    <xsl:if test="$showrevisionmarks = 1">
      <span style="text-decoration: underline; font-style: italic;">
        <xsl:apply-templates />
      </span>
    </xsl:if>
    <xsl:if test="$showrevisionmarks = 0">
      <xsl:apply-templates />
    </xsl:if>
  </xsl:template>

  <!--   content  -->
  <xsl:template match="n1:content">
    <xsl:choose>
      <xsl:when test="@styleCode">
        <xsl:call-template name="applyStyleCode">
          <xsl:with-param name="transformed_stylecode" select="translate(@styleCode, $lc, $uc)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--   list  -->
  <xsl:template match="n1:list">
    
    <!-- Stylecode case sensitive processing --> 
    <xsl:variable name="transformed_stylecode" select="translate(@styleCode, $lc, $uc)" />
    <xsl:variable name="transformed_listtype" select="translate(@listType, $lc, $uc)" />

    <!-- caption -->
    <xsl:if test="n1:caption">
      <span style="font-weight:bold; ">
        <xsl:apply-templates select="n1:caption"/>
      </span>
    </xsl:if>
    <!-- item -->
    <xsl:choose>
      <xsl:when test="$transformed_listtype='ORDERED'">
        <xsl:choose>
          <xsl:when test="$transformed_stylecode='LITTLEROMAN'">
            <ol style="list-style-type: lower-roman">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ol>
          </xsl:when>
          <xsl:when test="$transformed_stylecode='BIGROMAN'">
            <ol style="list-style-type: upper-roman">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ol>
          </xsl:when> 
          <xsl:when test="$transformed_stylecode='LITTLEALPHA'">
            <ol style="list-style-type: lower-latin">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ol>
          </xsl:when>
          <xsl:when test="$transformed_stylecode='BIGALPHA'">
            <ol style="list-style-type: upper-latin">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ol>
          </xsl:when>
          <xsl:otherwise>
            <ol style="list-style-type: decimal">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ol>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <!-- list is unordered -->
        <xsl:choose>
          <xsl:when test="$transformed_stylecode='CIRCLE'">
            <ul style="list-style-type: circle">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ul>           
          </xsl:when>
          <xsl:when test="$transformed_stylecode='SQUARE'">
            <ul style="list-style-type: square">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ul>           
          </xsl:when>
          <xsl:otherwise>
            <ul style="list-style-type: disc">
              <xsl:for-each select="n1:item">
                <li>
                  <!-- list element-->
                  <xsl:apply-templates/>
                </li>
              </xsl:for-each>
            </ul>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--   caption  -->
  <xsl:template match="n1:caption">
    <div class="caption">
      <xsl:apply-templates/>
      <xsl:text>: </xsl:text>
    </div>
  </xsl:template>
  <xsl:template match="n1:paragraph/n1:caption">
    <span class="caption">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

<xsl:template match="n1:table">

<xsl:variable name="tableMaxCellCount">
  <xsl:call-template name="getMaxCellsInRowFromTable">
    <xsl:with-param name="table" select="." />
    <xsl:with-param name="totalRowCount" select="count((./*[self::n1:tbody or self::n1:thead or self::n1:tfoot]/n1:tr | ./n1:tr))" />
  </xsl:call-template>
</xsl:variable>

<xsl:variable name="numHeaderCells">
  <xsl:call-template name="getNumHeaderCells">
    <xsl:with-param name="table" select="." />
  </xsl:call-template>
</xsl:variable>

<xsl:variable name="tableValid">
  <xsl:call-template name="checkTableValid">
    <xsl:with-param name="table" select="." />
    <xsl:with-param name="numHeaderCells" select="$numHeaderCells" />
  </xsl:call-template>
</xsl:variable>

<xsl:variable name="doesRowCountMatch">
  <xsl:call-template name="checkRowCountValid">
    <xsl:with-param name="table" select="." />
    <xsl:with-param name="numHeaderCells" select="$numHeaderCells" />
  </xsl:call-template>
</xsl:variable>

<xsl:variable name="showInfoButton">
  <xsl:if test="$enableInfoButton='1'">
    <xsl:call-template name="checkForInfoButton">
      <xsl:with-param name="table" select="." />
    </xsl:call-template>
  </xsl:if>
</xsl:variable>

<xsl:choose>
  <xsl:when test="$tableValid = ''">

    <xsl:if test="$doesRowCountMatch != ''">
      <div class="tableFormatExceptionInformation" style="margin-top: 0.5em;">
        <b>***** ACHTUNG: Die folgende Tabelle enthält ungültige Formatierungen! *****</b><br />
        Der Inhalt kann unter Umständen fehlerhaft interpretiert werden! <br />
        In der Originaltabelle fehlen die umrandeten Zellen, sie wurden automatisch eingefügt.<br />
        Bitte kontaktieren Sie den fachlichen Ansprechpartner oder Ersteller bei Unklarheiten.
      </div>
    </xsl:if>

    <table class="section_table" cellspacing="0" cellpadding="0">

      <xsl:call-template name="renderTableHeader">
        <xsl:with-param name="node" select="n1:thead" />
        <xsl:with-param name="maxCellCount" select="$tableMaxCellCount" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
      </xsl:call-template>

      <xsl:call-template name="renderTableBody">
        <xsl:with-param name="headerNode" select="n1:thead" />
        <xsl:with-param name="node" select="n1:tbody" />
        <xsl:with-param name="maxCellCount" select="$tableMaxCellCount" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
      </xsl:call-template>

      <xsl:call-template name="renderTableFooter">
        <xsl:with-param name="headerNode" select="n1:thead" />
        <xsl:with-param name="bodyNode" select="n1:tbody" />
        <xsl:with-param name="node" select="n1:tfoot" />
        <xsl:with-param name="maxCellCount" select="$tableMaxCellCount" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
      </xsl:call-template>

      <!-- fallback if no thead or tbody element exist -->
      <xsl:for-each select="n1:tr">
        <xsl:call-template name="renderTableRow">
          <xsl:with-param name="rowPosition" select="position()" />
          <xsl:with-param name="theadExist" select="0" />
          <xsl:with-param name="maxCellCount" select="$tableMaxCellCount" />
          <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        </xsl:call-template>
      </xsl:for-each>

    </table>

    <xsl:if test="$doesRowCountMatch != ''">
      <div class="tableFormatExceptionInformation" style="margin-bottom: 0.5em;"><b>***** ENDE *****</b></div>
    </xsl:if>
  </xsl:when>
  <xsl:otherwise>
    <table class="section_table" cellspacing="0" cellpadding="0">
      <tr>
        <td style="padding: 1em; text-align: center;"><xsl:text>Die Tabelle kann wegen einer ungültigen Formatanweisung nicht dargestellt werden.</xsl:text></td>
      </tr>
    </table>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="renderTableHeader">
<xsl:param name="node" />
<xsl:param name="maxCellCount" />
<xsl:param name="showInfoButton" />

<xsl:if test="n1:thead">
  <thead>
    <xsl:for-each select="$node/n1:tr">
      <xsl:call-template name="renderTableRow">
        <xsl:with-param name="rowPosition" select="position()" />
        <xsl:with-param name="cellWidthCalculated" select="1" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        <xsl:with-param name="maxCellCount" select="$maxCellCount" />
      </xsl:call-template>
    </xsl:for-each>
  </thead>
</xsl:if>
</xsl:template>

<xsl:template name="renderTableBody">
<xsl:param name="node" />
<xsl:param name="headerNode" />
<xsl:param name="maxCellCount" />
<xsl:param name="showInfoButton" />

<xsl:variable name="cellWidthCalculated">
  <xsl:choose>
    <xsl:when test="$headerNode"><xsl:text>1</xsl:text></xsl:when>
    <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:if test="n1:tbody">
  <tbody>
    <xsl:for-each select="$node/n1:tr">
      <xsl:call-template name="renderTableRow">
        <xsl:with-param name="rowPosition" select="position()" />
        <xsl:with-param name="cellWidthCalculated" select="$cellWidthCalculated" />
        <xsl:with-param name="maxCellCount" select="$maxCellCount" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
      </xsl:call-template>
    </xsl:for-each>
  </tbody>
</xsl:if>
</xsl:template>

<xsl:template name="renderTableFooter">
<xsl:param name="node" />
<xsl:param name="headerNode" />
<xsl:param name="bodyNode" />
<xsl:param name="maxCellCount" />
<xsl:param name="showInfoButton" />

<xsl:if test="n1:tfoot">

  <xsl:variable name="theadExist">
    <xsl:choose>
      <xsl:when test="$headerNode"><xsl:text>1</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="cellWidthCalculated">
    <xsl:choose>
      <xsl:when test="$bodyNode and $theadExist=1"><xsl:text>1</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <tfoot>
    <xsl:for-each select="$node/n1:tr">

      <xsl:variable name="cellCountInCurrentRow">
        <xsl:call-template name="calculateCellCount">
          <xsl:with-param name="cells" select="./n1:td" />
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="colspanWithWithInfoButton">
        <xsl:choose>
          <xsl:when test="$showInfoButton != ''">
            <xsl:value-of select="$maxCellCount - $cellCountInCurrentRow + 2" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$maxCellCount - $cellCountInCurrentRow + 1" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:call-template name="renderTableRow">
        <xsl:with-param name="rowPosition" select="1" /> <!-- force white rowbg -->
        <xsl:with-param name="cellWidthCalculated" select="$cellWidthCalculated" />
        <xsl:with-param name="firstColspan" select="$colspanWithWithInfoButton" />
        <xsl:with-param name="maxCellCount" select="$maxCellCount" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        <xsl:with-param name="isTFootElement" select="1" />
      </xsl:call-template>
    </xsl:for-each>
  </tfoot>
</xsl:if>
</xsl:template>

<xsl:template name="renderTableRow">
<xsl:param name="rowPosition" />
<xsl:param name="cellWidthCalculated" select="0" />
<xsl:param name="colspan" select="1" />
<xsl:param name="firstColspan" select="0" />
<xsl:param name="maxCellCount" />
<xsl:param name="showInfoButton" />
<xsl:param name="isTFootElement" select="0" />

<xsl:variable name="xELGA_blue">
  <xsl:if test="contains(translate(@styleCode, $lc, $uc), 'XELGA_BLUE')">
    <xsl:text>xblue</xsl:text>
  </xsl:if>
</xsl:variable>
<xsl:variable name="xELGA_red">
  <xsl:if test="contains(translate(@styleCode, $lc, $uc), 'XELGA_RED')">
    <xsl:text>xred</xsl:text>
  </xsl:if>
</xsl:variable>

<xsl:variable name="rowBG">
  <xsl:choose>
    <xsl:when test="$rowPosition mod 2 = 1"><xsl:text>odd</xsl:text></xsl:when>
    <xsl:otherwise><xsl:text>even</xsl:text></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<tr class="{$rowBG} {$xELGA_blue} {$xELGA_red}">

  <xsl:if test="./n1:th">

    <xsl:variable name="cellCountInCurrentRow">
      <xsl:call-template name="calculateCellCount">
        <xsl:with-param name="cells" select="./n1:th" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:for-each select="./n1:th">
      <xsl:call-template name="renderTableHeaderCell">
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        <xsl:with-param name="maxCellCount" select="$maxCellCount" />
        <xsl:with-param name="cellCountInCurrentRow" select="$cellCountInCurrentRow" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:variable name="emptyBlockWidth">
      <xsl:call-template name="getCellWidth">
        <xsl:with-param name="parentRow" select="./n1:th" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        <xsl:with-param name="maxCellCount" select="$maxCellCount" />
        <xsl:with-param name="cellCountInCurrentRow" select="$cellCountInCurrentRow" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:call-template name="addEmptyBlocks">
      <xsl:with-param name="numberOfBlocks" select="$maxCellCount - $cellCountInCurrentRow" />
      <xsl:with-param name="element">th</xsl:with-param>
      <xsl:with-param name="width" select="$emptyBlockWidth" />
    </xsl:call-template>

    <xsl:call-template name="renderInfoButtonInTableHeader">
      <xsl:with-param name="showInfoButton" select="$showInfoButton" />
    </xsl:call-template>

  </xsl:if>

  <xsl:if test="./n1:td">

    <xsl:variable name="cellCountInCurrentRow">
      <xsl:call-template name="calculateCellCount">
        <xsl:with-param name="cells" select="./n1:td" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:for-each select="./n1:td">

      <xsl:variable name="colSpanForPosition">
        <xsl:choose>
          <xsl:when test="$isTFootElement = 1 and position() = 1">
            <xsl:value-of select="$firstColspan" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$colspan" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:call-template name="renderTableBodyCell">
        <xsl:with-param name="rowPosition" select="$rowPosition" />
        <xsl:with-param name="cellWidthCalculated" select="$cellWidthCalculated" />
        <xsl:with-param name="colspan" select="$colSpanForPosition" />
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        <xsl:with-param name="maxCellCount" select="$maxCellCount" />
        <xsl:with-param name="cellCountInCurrentRow" select="$cellCountInCurrentRow" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="$isTFootElement = 0">
      <xsl:variable name="emptyBlockWidth">
        <xsl:if test="$rowPosition=1 and $cellWidthCalculated=0">
          <xsl:call-template name="getCellWidth">
            <xsl:with-param name="parentRow" select="./n1:td" />
            <xsl:with-param name="showInfoButton" select="$showInfoButton" />
            <xsl:with-param name="maxCellCount" select="$maxCellCount" />
            <xsl:with-param name="cellCountInCurrentRow" select="$cellCountInCurrentRow" />
          </xsl:call-template>
        </xsl:if>
      </xsl:variable>

      <xsl:call-template name="addEmptyBlocks">
        <xsl:with-param name="numberOfBlocks" select="$maxCellCount - $cellCountInCurrentRow" />
        <xsl:with-param name="element">td</xsl:with-param>
        <xsl:with-param name="width" select="$emptyBlockWidth"/>
      </xsl:call-template>

      <xsl:call-template name="renderInfoButtonInTableRow">
        <xsl:with-param name="showInfoButton" select="$showInfoButton" />
        <xsl:with-param name="row" select="." />
        <xsl:with-param name="isTFootElement" select="$isTFootElement" />
      </xsl:call-template>
    </xsl:if>
  </xsl:if>

</tr>

</xsl:template>

<xsl:template name="renderTableHeaderCell">
<xsl:param name="showInfoButton" />
<xsl:param name="maxCellCount" />
<xsl:param name="cellCountInCurrentRow" />

<xsl:variable name="width">
  <xsl:call-template name="getCellWidth">
    <xsl:with-param name="parentRow" select="../n1:th" />
    <xsl:with-param name="showInfoButton" select="$showInfoButton" />
    <xsl:with-param name="maxCellCount" select="$maxCellCount" />
    <xsl:with-param name="cellCountInCurrentRow" select="$cellCountInCurrentRow" />
  </xsl:call-template>
</xsl:variable>

<xsl:variable name="colspan">
  <xsl:choose>
    <xsl:when test="@colspan">
      <xsl:value-of select="@colspan" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>1</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="rowspan">
  <xsl:choose>
    <xsl:when test="@rowspan">
      <xsl:value-of select="@rowspan" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>1</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- create th element -->
<xsl:element name="th">
  <xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
  <xsl:attribute name="colspan"><xsl:value-of select="$colspan"/></xsl:attribute>
  <xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
  <xsl:apply-templates/>
</xsl:element>

</xsl:template>


<xsl:template name="renderTableBodyCell">
<xsl:param name="rowPosition" />
<xsl:param name="cellWidthCalculated" />
<xsl:param name="colspan" select="0" />
<xsl:param name="showInfoButton" />
<xsl:param name="maxCellCount" />
<xsl:param name="cellCountInCurrentRow" />

<xsl:variable name="transformed_stylecode" select="translate(@styleCode, $lc, $uc)" />

<xsl:variable name="tdStyleCode_Style">
  <xsl:if test="contains($transformed_stylecode, 'LRULE')">
    <xsl:text>text-align: left;</xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'RRULE')">
    <xsl:text>text-align: right;</xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'TOPRULE')">
    <xsl:text>vertical-align: top;</xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'BOTRULE')">
    <xsl:text>vertical-align: bottom;</xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'BOLD')">
    <xsl:text>font-weight: bold;</xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'UNDERLINE')">
    <xsl:text>text-decoration: underline</xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'ITALICS')">
    <xsl:text>font-style: italic;</xsl:text>
  </xsl:if>
</xsl:variable>

<xsl:variable name="tdStyleCode_Class">
  <xsl:if test="contains($transformed_stylecode, 'EMPHASIS')">
    <xsl:text> smallcaps </xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'XELGA_BLUE')">
    <xsl:text> xblue </xsl:text>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode, 'XELGA_RED')">
    <xsl:text> xred </xsl:text>
  </xsl:if>
</xsl:variable>

<xsl:variable name="cellColspan">
  <xsl:choose>
    <xsl:when test="@colspan">
      <xsl:value-of select="@colspan" />
    </xsl:when>
    <xsl:when test="not(@colspan) and $colspan">
      <xsl:value-of select="$colspan" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>1</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="rowspan">
  <xsl:choose>
    <xsl:when test="@rowspan">
      <xsl:value-of select="@rowspan" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>1</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="width">
  <xsl:if test="$rowPosition=1 and $cellWidthCalculated=0">
    <xsl:call-template name="getCellWidth">
      <xsl:with-param name="parentRow" select="../n1:td" />
      <xsl:with-param name="showInfoButton" select="$showInfoButton" />
      <xsl:with-param name="maxCellCount" select="$maxCellCount" />
      <xsl:with-param name="cellCountInCurrentRow" select="$cellCountInCurrentRow" />
    </xsl:call-template>
  </xsl:if>
</xsl:variable>

<xsl:element name="td">
  <xsl:if test="$width != ''">
    <xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute>
  </xsl:if>
  <xsl:attribute name="colspan"><xsl:value-of select="$cellColspan"/></xsl:attribute>
  <xsl:attribute name="rowspan"><xsl:value-of select="$rowspan"/></xsl:attribute>
  <xsl:if test="$tdStyleCode_Class != ''">
    <xsl:attribute name="class"><xsl:value-of select="$tdStyleCode_Class" /></xsl:attribute>
  </xsl:if>
  <xsl:if test="$tdStyleCode_Style != ''">
    <xsl:attribute name="style"><xsl:value-of select="$tdStyleCode_Style" /></xsl:attribute>
  </xsl:if>

  <xsl:apply-templates/>

</xsl:element>

</xsl:template>

<xsl:template name="renderInfoButtonInTableHeader">
<xsl:param name="showInfoButton" />

<xsl:if test="$showInfoButton != ''">
  <!-- 3.84 = 100 / 104 * 4 -->
  <th colspan="1" rowspan="1" width="3.84%" /> <!-- empty header for info button -->
</xsl:if>

</xsl:template>

<xsl:template name="addEmptyBlocks">

<xsl:param name="numberOfBlocks" />
<xsl:param name="blocksAdded" select="0" />
<xsl:param name="element" />
<xsl:param name="width" select="0" />

<xsl:if test="$blocksAdded &lt; $numberOfBlocks">

  <xsl:choose>
    <xsl:when test="$element='th'">
      <xsl:choose>
        <xsl:when test="$width != ''">
          <th colspan="1" rowspan="1" width="{$width}" class="emptyblock"></th>
        </xsl:when>
        <xsl:otherwise>
          <th colspan="1" rowspan="1" class="emptyblock"></th>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$width != ''">
          <td colspan="1" rowspan="1" width="{$width}" class="emptyblock"></td>
        </xsl:when>
        <xsl:otherwise>
          <td colspan="1" rowspan="1" class="emptyblock"></td>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:call-template name="addEmptyBlocks">
    <xsl:with-param name="numberOfBlocks" select="$numberOfBlocks"/>
    <xsl:with-param name="blocksAdded" select="$blocksAdded + 1"/>
    <xsl:with-param name="element" select="$element" />
    <xsl:with-param name="width" select="$width" />
  </xsl:call-template>
</xsl:if>

</xsl:template>

<xsl:template name="renderInfoButtonInTableRow">
<xsl:param name="showInfoButton" />
<xsl:param name="row" />
<xsl:param name="isTFootElement" />

<xsl:if test="$showInfoButton != '' and $isTFootElement=0">
  <td colspan="1" rowspan="1" style="text-align: center">
    <xsl:choose>
      <xsl:when test="@ID">

        <xsl:variable name="obsID" select="concat('#', @ID)" />
        <xsl:variable name="observationIDEntry" select="//n1:text/n1:reference[@value=$obsID]" />
        <xsl:variable name="observationCode">
          <xsl:if test="$observationIDEntry/parent::*/parent::*/n1:code/@codeSystem='2.16.840.1.113883.6.1'">
            <xsl:value-of select="$observationIDEntry/parent::*/parent::*/n1:code/@code" />
          </xsl:if>
        </xsl:variable>

        <xsl:variable name="loincURL">
          <xsl:value-of select="concat($LOINCResolutionUrl, $observationCode)" />
        </xsl:variable>

        <xsl:if test="$observationCode != ''">
          <xsl:element name="img">
            <xsl:attribute name="class">infoButton</xsl:attribute>
            <xsl:attribute name="data-observationCode"><xsl:value-of select="$observationCode"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="translate(normalize-space($infoButtonIcon),'&#32;','')" /></xsl:attribute>
          </xsl:element>
        </xsl:if>

      </xsl:when>
      <xsl:otherwise>
        <!-- loinc not found -->
      </xsl:otherwise>
    </xsl:choose>
  </td>
</xsl:if>
</xsl:template>

<xsl:template name="checkForInfoButton">
<xsl:param name="table" />

<!-- show info button only if cda is instance of "laborbefund" full support -->
<xsl:if test="/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.4.0.3'">
  <xsl:if test="$table/n1:tbody/n1:tr">
    <xsl:for-each select="$table/n1:tbody/n1:tr">
      <xsl:call-template name="checkForInfoButtonInRow">
        <xsl:with-param name="row" select="." />
      </xsl:call-template>
    </xsl:for-each>
  </xsl:if>

  <xsl:if test="$table/n1:tr">
    <xsl:for-each select="$table/n1:tr">
      <xsl:call-template name="checkForInfoButtonInRow">
        <xsl:with-param name="row" select="." />
      </xsl:call-template>
    </xsl:for-each>
  </xsl:if>
</xsl:if>
</xsl:template>

<xsl:template name="checkForInfoButtonInRow">
<xsl:param name="row" />

<xsl:if test="$row/@ID">

  <xsl:variable name="obsID" select="concat('#', $row/@ID)" />
  <xsl:variable name="observationIDEntry" select="//n1:text/n1:reference[@value=$obsID]" />
  <xsl:variable name="observationCode">
    <xsl:if test="$observationIDEntry/parent::*/parent::*/n1:code/@codeSystem='2.16.840.1.113883.6.1'">
      <xsl:value-of select="$observationIDEntry/parent::*/parent::*/n1:code/@code" />
    </xsl:if>
  </xsl:variable>

  <xsl:if test="$observationCode">
    <xsl:text>1</xsl:text>
  </xsl:if>

</xsl:if>
</xsl:template>

<xsl:template name="checkTableValid">
<xsl:param name="table" />
<xsl:param name="numHeaderCells" />

<xsl:if test="$isStrictModeDisabled = '0' or not($isStrictModeDisabled = '0' or $showTableInBestGuess = '1')">
  <xsl:call-template name="checkRowCountValid">
    <xsl:with-param name="table" select="$table" />
    <xsl:with-param name="numHeaderCells" select="$numHeaderCells" />
  </xsl:call-template>
</xsl:if>

<xsl:if test="$table/n1:tfoot/n1:tr/n1:th">
  <!-- th is not valid in tfoot -->
  <xsl:value-of select="-1" />
</xsl:if>

</xsl:template>

<xsl:template name="checkRowCountValid">
<xsl:param name="table" />
<xsl:param name="numHeaderCells" />

<xsl:choose>
  <xsl:when test="$table/n1:tbody/n1:tr">
    <xsl:for-each select="$table/n1:tbody/n1:tr">
      <xsl:variable name="currentRowCells">
        <xsl:call-template name="calculateCellCount">
          <xsl:with-param name="cells" select="./n1:td" />
        </xsl:call-template>
      </xsl:variable>

      <xsl:if test="$numHeaderCells != $currentRowCells">
        <xsl:value-of select="-1" />
      </xsl:if>
    </xsl:for-each>
  </xsl:when>
  <xsl:otherwise>
    <xsl:for-each select="$table/n1:tr">
      <xsl:variable name="currentRowCells">
        <xsl:call-template name="calculateCellCount">
          <xsl:with-param name="cells" select="./n1:td" />
        </xsl:call-template>
      </xsl:variable>

      <xsl:if test="$numHeaderCells != $currentRowCells">
        <xsl:value-of select="-1" />
      </xsl:if>
    </xsl:for-each>
  </xsl:otherwise>
</xsl:choose>

<!-- only one td element in each tfoot tr row is allowed -->
<xsl:for-each select="$table/n1:tfoot/n1:tr">
  <xsl:if test="count(./n1:td) != 1">
    <xsl:value-of select="-1" />
  </xsl:if>
</xsl:for-each>

</xsl:template>

<xsl:template name="getNumHeaderCells">
<xsl:param name="table" />

<xsl:choose>
  <xsl:when test="$table/n1:thead/n1:tr[position() = 1]/n1:th">
    <xsl:call-template name="calculateCellCount">
      <xsl:with-param name="cells" select="$table/n1:thead/n1:tr[position() = 1]/n1:th" />
    </xsl:call-template>
  </xsl:when>
  <xsl:when test="$table/n1:tbody/n1:tr[position() = 1]/n1:td">
    <xsl:call-template name="calculateCellCount">
      <xsl:with-param name="cells" select="$table/n1:tbody/n1:tr[position() = 1]/n1:td" />
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="calculateCellCount">
      <xsl:with-param name="cells" select="$table/n1:tr[position() = 1]/n1:td" />
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

        <!-- recursive calculate cell count -->
<xsl:template name="calculateCellCount">
<xsl:param name="cells" />
<xsl:param name="totalCellCount" select="0" />

<xsl:variable name="currentCell" select="$cells[1]" />
<xsl:variable name="nextCell" select="$cells[position()>1]" />

<xsl:variable name="currentCellCount">
  <xsl:choose>
    <xsl:when test="$currentCell/@colspan">
      <xsl:value-of select="$currentCell/@colspan" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="1" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:choose>
  <xsl:when test="not($nextCell)">
    <xsl:value-of select="$currentCellCount + $totalCellCount" />
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="calculateCellCount">
      <xsl:with-param name="cells" select="$nextCell" />
      <xsl:with-param name="totalCellCount" select="$currentCellCount + $totalCellCount" />
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="calculateCellCountWithoutStyleCode">
<xsl:param name="cells" />
<xsl:param name="totalCellCount" select="0" />
<xsl:param name="emptyCells" />

<xsl:variable name="currentCell" select="$cells[1]" />
<xsl:variable name="nextCell" select="$cells[position()>1]" />

<xsl:variable name="currentCellCount">
  <xsl:choose>
    <xsl:when test="$currentCell[@styleCode]">
      <xsl:value-of select="0" />
    </xsl:when>
    <xsl:when test="$currentCell[not(@styleCode) and @colspan]">
      <xsl:value-of select="$currentCell/@colspan" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="1" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:choose>
  <xsl:when test="not($nextCell)">
    <xsl:value-of select="$currentCellCount + $totalCellCount + $emptyCells" />
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="calculateCellCountWithoutStyleCode">
      <xsl:with-param name="cells" select="$nextCell" />
      <xsl:with-param name="totalCellCount" select="$currentCellCount + $totalCellCount" />
      <xsl:with-param name="emptyCells" select="$emptyCells" />
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="getMaxCellsInRowFromTable">
<xsl:param name="table" />
<xsl:param name="totalRowCount" />
<xsl:param name="currentRowIndex" select="1" />
<xsl:param name="maxCellCount" select="0" />

<xsl:variable name="currentRow" select="($table/*[self::n1:tbody or self::n1:tfoot]/n1:tr | $table/n1:thead/n1:th | $table/n1:tr)[$currentRowIndex]" />

<xsl:variable name="currentCellCount">
  <xsl:choose>
    <xsl:when test="$currentRow/n1:td">
      <xsl:call-template name="calculateCellCount">
        <xsl:with-param name="cells" select="$currentRow/n1:td" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="getNumHeaderCells">
        <xsl:with-param name="table" select="$table" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="newMaxCellCount">
  <xsl:choose>
    <xsl:when test="$currentCellCount &gt; $maxCellCount">
      <xsl:value-of select="$currentCellCount" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$maxCellCount" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:choose>

  <xsl:when test="$currentRowIndex &lt; $totalRowCount">
    <xsl:call-template name="getMaxCellsInRowFromTable">
      <xsl:with-param name="table" select="$table" />
      <xsl:with-param name="totalRowCount" select="$totalRowCount" />
      <xsl:with-param name="currentRowIndex" select="$currentRowIndex + 1" />
      <xsl:with-param name="maxCellCount" select="$newMaxCellCount" />
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:value-of select="$newMaxCellCount" />
  </xsl:otherwise>
</xsl:choose>

</xsl:template>

<xsl:template match="n1:colgroup">
<colgroup>
  <xsl:apply-templates/>
</colgroup>
</xsl:template>

<xsl:template match="n1:col">
<col>
  <xsl:apply-templates/>
</col>
</xsl:template>

<xsl:template name="getCellWidth">
<xsl:param name="parentRow" />
<xsl:param name="showInfoButton" />
<xsl:param name="maxCellCount" />
<xsl:param name="cellCountInCurrentRow" />

<!-- sum up all given widths -->
<xsl:variable name="sum">
  <xsl:call-template name="sumgivenwidths">
    <xsl:with-param name="widths" select="$parentRow" />
  </xsl:call-template>
</xsl:variable>

<!-- calculate table width -->
<xsl:variable name="tablewidth">
  <xsl:call-template name="calctablewidth">
    <xsl:with-param name="widths" select="$parentRow" />
    <xsl:with-param name="parent" select="$parentRow" />
    <xsl:with-param name="sumgivenwidths" select="$sum" />
  </xsl:call-template>
</xsl:variable>

<!-- get cell count in row without stylecode-->
<xsl:variable name="cellCountWithoutStyleCode">
  <xsl:call-template name="calculateCellCountWithoutStyleCode">
    <xsl:with-param name="cells" select="$parentRow" />
    <xsl:with-param name="emptyCells" select="$maxCellCount - $cellCountInCurrentRow" />
  </xsl:call-template>
</xsl:variable>

<!-- override given width when sum of table width > 100 % -->
<xsl:variable name="overrideGivenWidth">
  <xsl:choose>
    <xsl:when test="$sum &gt; 100">
      <xsl:value-of select="1" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="0" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- get cell count in row -->
<xsl:variable name="cellCount">
  <xsl:value-of select="$maxCellCount" />
</xsl:variable>

<!-- width calculating -->
<xsl:variable name="cWidth">
  <xsl:choose>
    <xsl:when test="@styleCode != '' and $overrideGivenWidth=0">
      <xsl:choose>
        <xsl:when test="substring-after(@styleCode, ':') &lt; 0">
          <xsl:value-of select="substring-after(@styleCode, ':-')" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-after(@styleCode, ':')" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="$overrideGivenWidth=1">
      <xsl:choose>
        <xsl:when test="@colspan">
          <xsl:value-of select="100 div $cellCount * @colspan" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="100 div $cellCount" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="@colspan">
          <xsl:value-of select="(100 - $sum) div $cellCountWithoutStyleCode * @colspan" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="(100 - $sum) div $cellCountWithoutStyleCode" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="cWidthWithoutPercentSign">
  <xsl:choose>
    <xsl:when test="contains($cWidth, '%')">
      <xsl:value-of select="substring-before($cWidth, '%')" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$cWidth" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- 100 percent scaling -->
<xsl:variable name="normalizedWidth">
  <xsl:choose>
    <xsl:when test="$overrideGivenWidth=0">
      <xsl:value-of select="$cWidthWithoutPercentSign * 100 div $tablewidth" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$cWidthWithoutPercentSign" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="normalizedWidthWithInfoButton">
  <xsl:choose>
    <xsl:when test="$showInfoButton != ''">
      <xsl:value-of select="100 div 104 * $normalizedWidth" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$normalizedWidth" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:value-of select="concat($normalizedWidthWithInfoButton, '%')" />

</xsl:template>

        <!-- recursive loop through all given widths -->
<xsl:template name="sumgivenwidths">
<xsl:param name="widths" />
<xsl:param name="sum" select="0" />

<xsl:variable name="current" select="$widths[1]" />
<xsl:variable name="next" select="$widths[position()>1]" />
<xsl:variable name="currentwidth">
  <xsl:choose>
    <xsl:when test="substring-after($current/@styleCode,'xELGA_colw:') != ''">
      <!-- absolute value -->
      <xsl:choose>
        <xsl:when test="substring-after($current/@styleCode, 'xELGA_colw:') &lt; 0">
          <xsl:value-of select="substring-after($current/@styleCode, 'xELGA_colw:') * -1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-after($current/@styleCode, 'xELGA_colw:')" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="0" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:choose>
  <xsl:when test="not($next)">
    <xsl:value-of select="$currentwidth + $sum" />
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="sumgivenwidths">
      <xsl:with-param name="widths" select="$next" />
      <xsl:with-param name="sum" select="$currentwidth + $sum" />
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

        <!-- recursive calculation of table width -->
<xsl:template name="calctablewidth">
<xsl:param name="widths" />
<xsl:param name="parent" />
<xsl:param name="sumgivenwidths" />
<xsl:param name="sum" select="0" />

<xsl:variable name="current" select="$widths[1]" />
<xsl:variable name="next" select="$widths[position()>1]" />

<xsl:variable name="currentwidth">
  <xsl:choose>
    <xsl:when test="substring-after($current/@styleCode, 'xELGA_colw:') != ''">
      <!-- absolute value -->
      <xsl:choose>
        <xsl:when test="substring-after($current/@styleCode, 'xELGA_colw:') &lt; 0">
          <xsl:value-of select="substring-after($current/@styleCode, 'xELGA_colw:') * -1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-after($current/@styleCode, 'xELGA_colw:')" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="(100 - $sumgivenwidths) div count($parent[not(@styleCode != '')])" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="currentwidthWithoutPercentSign">
  <xsl:choose>
    <xsl:when test="contains($currentwidth, '%')">
      <xsl:value-of select="substring-before($currentwidth, '%')" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$currentwidth" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:choose>
  <xsl:when test="not($next)">
    <xsl:value-of select="$currentwidthWithoutPercentSign + $sum" />
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="calctablewidth">
      <xsl:with-param name="widths" select="$next" />
      <xsl:with-param name="parent" select="$parent" />
      <xsl:with-param name="sumgivenwidths" select="$sumgivenwidths" />
      <xsl:with-param name="sum" select="$currentwidthWithoutPercentSign + $sum" />
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>


        <!--    Stylecode processing
          Supports Bold, Underline, Italics and xELGA_* display
          It also additionally supports Heading1 to Heading3
          -->
<xsl:template match="//n1:*[@styleCode and not(@listType) and local-name() != 'th' and local-name() != 'td' and local-name() != 'table' and local-name() != 'tr' and local-name() != 'content']">

<!-- Stylecode case sensitive processing -->

<xsl:variable name="transformed_stylecode" select="translate(@styleCode, $lc, $uc)" />

<xsl:if test="contains($transformed_stylecode,'COMMENT')">
  <xsl:if test="contains($transformed_stylecode,'REPORTCOMMENT')">
    <table width="100%" cellspacing="0" cellpadding="0">
      <tbody>
        <tr>
          <td>Befundkommentar: </td>
          <td>
            <xsl:apply-templates/>
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:if>
</xsl:if>
<xsl:if test="contains($transformed_stylecode,'HEADING')">
  <xsl:if test="contains($transformed_stylecode,'HEADING1')">
    <xsl:element name="h1">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode,'HEADING2')">
    <xsl:element name="h2">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode,'HEADING3')">
    <xsl:element name="h3">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:if>
</xsl:if>
<xsl:if test="contains($transformed_stylecode,'XELGA_H')">
  <xsl:if test="contains($transformed_stylecode,'XELGA_H1')">
    <xsl:element name="h1">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode,'XELGA_H2')">
    <xsl:element name="h2">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:if>
  <xsl:if test="contains($transformed_stylecode,'XELGA_H3')">
    <xsl:element name="h3">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:if>
</xsl:if>

<xsl:call-template name="applyStyleCode">
  <xsl:with-param name="transformed_stylecode" select="$transformed_stylecode" />
</xsl:call-template>

</xsl:template>

<xsl:template name="applyStyleCode">
<xsl:param name="transformed_stylecode" />

<!-- start ELGA styleCode processing  -->
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:apply-templates/>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="span">
    <xsl:attribute name="class">xblue</xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="span">
    <xsl:attribute name="class">xred</xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="span">
    <xsl:attribute name="class">xblue</xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="span">
    <xsl:attribute name="class">smallcaps</xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="span">
    <xsl:attribute name="class">smallcaps</xsl:attribute>
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="span">
    <xsl:attribute name="class">smallcaps</xsl:attribute>
    <xsl:element name="span">
      <xsl:attribute name="class">xred</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="span">
    <xsl:attribute name="class">smallcaps</xsl:attribute>
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="u">
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">xred</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xred</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="u">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">xred</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xred</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">xred</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xred</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and not(contains($transformed_stylecode, 'BOLD')) and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="i">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:apply-templates/>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">xred</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">xblue</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xred</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="span">
      <xsl:attribute name="class">smallcaps</xsl:attribute>
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">xred</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xred</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and not(contains($transformed_stylecode, 'ITALICS')) and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="u">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">xred</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">xblue</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xred</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and not(contains($transformed_stylecode, 'UNDERLINE')) and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">xred</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and not(contains($transformed_stylecode, 'EMPHASIS')) and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">xblue</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">smallcaps</xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and not(contains($transformed_stylecode, 'XELGA_RED')) and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">smallcaps</xsl:attribute>
          <xsl:element name="span">
            <xsl:attribute name="class">xblue</xsl:attribute>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and not(contains($transformed_stylecode, 'XELGA_BLUE'))">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">smallcaps</xsl:attribute>
          <xsl:element name="span">
            <xsl:attribute name="class">xred</xsl:attribute>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<xsl:if test="not(contains($transformed_stylecode, 'HEADING')) and not(contains($transformed_stylecode, 'XELGA_H')) and contains($transformed_stylecode, 'BOLD') and contains($transformed_stylecode, 'ITALICS') and contains($transformed_stylecode, 'UNDERLINE') and contains($transformed_stylecode, 'EMPHASIS') and contains($transformed_stylecode, 'XELGA_RED') and contains($transformed_stylecode, 'XELGA_BLUE')">
  <xsl:element name="strong">
    <xsl:element name="i">
      <xsl:element name="u">
        <xsl:element name="span">
          <xsl:attribute name="class">smallcaps</xsl:attribute>
          <xsl:element name="span">
            <xsl:attribute name="class">xblue</xsl:attribute>
            <xsl:apply-templates/>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:if>
<!-- end ELGA styleCode processing -->
</xsl:template>

<!--   RenderMultiMedia -->
<xsl:template match="n1:renderMultiMedia">

<xsl:variable name="imageRef" select="@referencedObject"/>

<xsl:variable name="altText">
  <xsl:choose>
    <xsl:when test="./n1:caption">
      <xsl:value-of select="./n1:caption" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>Keine alternative Bildbeschreibung vorhanden.</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="titleText">
  <xsl:choose>
    <xsl:when test="./n1:caption">
      <xsl:value-of select="./n1:caption" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>Kein Titel vorhanden.</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:choose>
  <xsl:when test="//n1:regionOfInterest[@ID=$imageRef]">
    <!-- Here is where the Region of Interest image referencing goes -->
    <xsl:if test="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value[@mediaType='image/gif' or @mediaType='image/jpeg' or @mediaType='image/png']">
      <br class="clearer" ></br>
      <xsl:variable name="image-uri" select="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value/n1:reference/@value" />
      <xsl:choose>
        <xsl:when test="contains($image-uri, ':') or starts-with($image-uri, '\\')">
          <p>Externe Bildpfade sind nicht erlaubt.</p>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="img">
            <xsl:attribute name="alt"><xsl:value-of select="$altText"/></xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$image-uri"/></xsl:attribute>
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:when>
  <xsl:otherwise>
    <xsl:if test="//n1:observationMedia[@ID=$imageRef]/n1:value[@mediaType='image/gif' or @mediaType='image/jpeg' or @mediaType='image/png']">
      <xsl:choose>
        <!-- image data inline B64 coded -->
        <xsl:when test="//n1:observationMedia[@ID=$imageRef]/n1:value[@representation='B64']">
          <br class="clearer" ></br>
          <xsl:element name="img">
            <xsl:attribute name="alt"><xsl:value-of select="$altText"/></xsl:attribute>
            <xsl:attribute name="class">inlineimg</xsl:attribute>
            <xsl:attribute name="src">data:
              <xsl:value-of select="//n1:observationMedia[@ID=$imageRef]/n1:value/@mediaType"/>;base64,
              <xsl:value-of select="//n1:observationMedia[@ID=$imageRef]/n1:value"/></xsl:attribute>
          </xsl:element>
        </xsl:when>
        <!-- image ref -->
        <xsl:otherwise>
          <br class="clearer" ></br>
          <xsl:variable name="image-uri" select="//n1:observationMedia[@ID=$imageRef]/n1:value/n1:reference/@value" />
          <xsl:choose>
            <xsl:when test="contains($image-uri, ':') or starts-with($image-uri, '\\')">
              <p>Externe Bildpfade sind nicht erlaubt.</p>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$image-uri" />
              <xsl:element name="img">
                <xsl:attribute name="alt"><xsl:value-of select="$altText"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="$image-uri"/></xsl:attribute>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <!-- PDF, Audio and Video download -->

    <xsl:if test="//n1:observationMedia[@ID=$imageRef]/n1:value/@mediaType='application/dicom'
                      or //n1:observationMedia[@ID=$imageRef]/n1:value/@mediaType='application/pdf'
                      or //n1:observationMedia[@ID=$imageRef]/n1:value/@mediaType='audio/mpeg'
                      or //n1:observationMedia[@ID=$imageRef]/n1:value/@mediaType='text/xml'
                      or //n1:observationMedia[@ID=$imageRef]/n1:value/@mediaType='video/mpeg'">
      <xsl:call-template name="generateMultimediaDownloadLink">
        <xsl:with-param name="text" select="//n1:observationMedia[@ID=$imageRef]/n1:value" />
        <xsl:with-param name="filename" select="$imageRef" />
      </xsl:call-template>
    </xsl:if>

  </xsl:otherwise>
</xsl:choose>

<xsl:if test="n1:caption">
  <div style="font-size: 14px;"><xsl:value-of select="n1:caption" /></div>
</xsl:if>

</xsl:template>

        <!-- linkHtml rendering -->
<xsl:template match="n1:linkHtml">
<xsl:variable name="url">
  <xsl:choose>
    <xsl:when test="contains(@href, 'http://') or contains(@href, 'https://')">
      <xsl:value-of select="@href" />
    </xsl:when>
    <xsl:otherwise>http://<xsl:value-of select="@href" /></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<a>
  <xsl:attribute name="href">
    <xsl:value-of select="$url" />
  </xsl:attribute>
  <xsl:attribute name="target">
    <xsl:text>_blank</xsl:text>
  </xsl:attribute>
  <xsl:apply-templates/>
</a>
</xsl:template>

<xsl:template name="renderAuthenticatorContainer">
  <xsl:param name="node" />
  <xsl:param name="title" />

  <xsl:variable name="moreInfo">
    <xsl:choose>
      <xsl:when test="$node/n1:assignedEntity/n1:telecom or $node/n1:assignedEntity/n1:representedOrganization">
        <xsl:value-of select="1" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="0" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="styleClass">
    <xsl:choose>
      <xsl:when test="$moreInfo='1'">
        <xsl:text>collapseTrigger</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>collapseTriggerWithoutHover</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <div class="authenticatorContainer" >
    <div class="{$styleClass}" onclick="toggleCollapseable(this);" id="IDAuthenticatorContainer">
      <div style="float: left; width: 240px;">
          <xsl:if test="$moreInfo='1'">
              <xsl:call-template name="collapseTrigger"/>
          </xsl:if>
          <h1><xsl:value-of select="$title" /></h1>
      </div>
      <div class="authenticatorShortInfo">
        <p class="name">
          <xsl:call-template name="getName">
            <xsl:with-param name="name" select="$node/n1:assignedEntity/n1:assignedPerson/n1:name"/>
          </xsl:call-template>
        </p>
        <xsl:if test="$node/n1:time/@value">
          <p>
            <xsl:text>Unterzeichnet am: </xsl:text>
            <xsl:call-template name="formatDate">
              <xsl:with-param name="date" select="$node/n1:time" />
            </xsl:call-template>
          </p>
        </xsl:if>
      </div>
      <div class="clearer"></div>
    </div>
    <div class="collapsable">
      <div class="leftsmall">
        <p class="name">
          <xsl:call-template name="getName">
            <xsl:with-param name="name" select="$node/n1:assignedEntity/n1:assignedPerson/n1:name"/>
          </xsl:call-template>
        </p>
        <xsl:call-template name="getContactInfo">
          <xsl:with-param name="contact" select="$node/n1:assignedEntity"/>
        </xsl:call-template>
      </div>
      <div class="leftwide">
        <p class="organisationName">
          <xsl:call-template name="getName">
            <xsl:with-param name="name" select="$node/n1:assignedEntity/n1:representedOrganization/n1:name"/>
          </xsl:call-template>
        </p>
        <xsl:call-template name="getContactInfo">
          <xsl:with-param name="contact" select="$node/n1:assignedEntity/n1:representedOrganization"/>
        </xsl:call-template>
      </div>
      <div class="clearer"></div>
    </div>
  </div>
</xsl:template>

<!-- nonXMLBody -->
<xsl:template match="n1:component/n1:nonXMLBody">
<hr />
<xsl:variable name="simple-sanitizer-match"><xsl:text>&#10;&#13;&#34;&#39;&#58;&#59;&#63;&#96;&#123;&#125;&#8220;&#8221;&#8222;&#8218;&#8217;</xsl:text></xsl:variable>
<xsl:variable name="simple-sanitizer-replace" select="'***************'"/>
<xsl:choose>
  <!-- if there is a reference, use that in an IFRAME -->
  <xsl:when test="n1:text/n1:reference">
    <xsl:variable name="source" select="string(n1:text/n1:reference/@value)"/>
    <xsl:variable name="lcSource" select="translate($source, $uc, $lc)"/>
    <xsl:variable name="scrubbedSource" select="translate($source, $simple-sanitizer-match, $simple-sanitizer-replace)"/>
    <xsl:choose>
      <xsl:when test="contains($lcSource,'javascript')">
        <p>Eingebettete Inhalte mit Javascript können nicht dargestellt werden.</p>
      </xsl:when>
      <xsl:when test="not($source = $scrubbedSource)">
        <p>Eingebettete Inhalte mit Javascript können nicht dargestellt werden. <xsl:value-of select="$scrubbedSource" /></p>
      </xsl:when>
      <xsl:otherwise>
        <IFRAME name='nonXMLBody' id='nonXMLBody' WIDTH='80%' HEIGHT='600' src='{$source}'/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:when>
  <xsl:when test="n1:text/@mediaType='text/plain'">
    <pre>
      <xsl:value-of select="n1:text/text()"/>
    </pre>
  </xsl:when>
  <!-- create PDF link -->
  <xsl:when test="n1:text/@mediaType='application/pdf'">
    <xsl:call-template name="generateMultimediaDownloadLink">
      <xsl:with-param name="text" select="n1:text" />
      <xsl:with-param name="filename" select="ELGA" />
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <CENTER>Cannot display the text</CENTER>
  </xsl:otherwise>
</xsl:choose>
<hr />
</xsl:template>

<!-- Generate Multimedia download link -->
<xsl:template name="generateMultimediaDownloadLink">
<xsl:param name="text" select="n1:text" />
<xsl:param name="filename" select="filename" />

<xsl:choose>
  <xsl:when test="$base64DecoderServiceUrl=''">
    <xsl:text><![CDATA[Für das Generieren von Multimedia-Download-Links muss ein Servlet zur Decodierung von Base64-codierten Multimediadateien (PDF, Audio, Video) bereitgestellt werden. Codebeispiele für das Servlet finden Sie auf www.elga.gv.at]]></xsl:text>
  </xsl:when>
  <xsl:otherwise>

    <form method="post" action="{$base64DecoderServiceUrl}">
      <input type="hidden" name="mediaType" value="{$text/@mediaType}" />
      <input type="hidden" name="filename" value="{$filename}" />
      <input type="hidden" name="data" value="{$text}" />

      <xsl:choose>
        <xsl:when test="$text/@mediaType='application/dicom'">
          <input class="multimediaSubmit multimediaSubmitVarious" type="submit" value="Dicom Dokument anzeigen" />
        </xsl:when>
        <xsl:when test="$text/@mediaType='application/pdf'">
          <input class="multimediaSubmit multimediaSubmitPDF" type="submit" value="Dokument anzeigen" />
        </xsl:when>
        <xsl:when test="$text/@mediaType='audio/mpeg'">
          <input class="multimediaSubmit multimediaSubmitAudio" type="submit" value="Audiodatei anzeigen" />
        </xsl:when>
        <xsl:when test="$text/@mediaType='text/xml'">
          <input class="multimediaSubmit multimediaSubmitVarious" type="submit" value="XML-Datei anzeigen" />
        </xsl:when>
        <xsl:when test="$text/@mediaType='video/mpeg'">
          <input class="multimediaSubmit multimediaSubmitVideo" type="submit" value="Videodatei anzeigen" />
        </xsl:when>

        <xsl:otherwise>
          <xsl:text>Unbekannter Medientyp: </xsl:text><xsl:value-of select="$text/@mediaType" />
        </xsl:otherwise>
      </xsl:choose>
    </form>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="checkDocumentValid">
  <xsl:for-each select="//n1:table">
    <xsl:variable name="numHeaderCells">
      <xsl:call-template name="getNumHeaderCells">
        <xsl:with-param name="table" select="." />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tableValid">
      <xsl:call-template name="checkTableValid">
        <xsl:with-param name="table" select="." />
        <xsl:with-param name="numHeaderCells" select="$numHeaderCells" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:value-of select="$tableValid" />
  </xsl:for-each>
</xsl:template>


<xsl:variable name="videoIcon">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowMTgwMTE3NDA3MjA2ODExOEE2RDkwNDBBMUIzNTNDQiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo2MTQ3MjMwRTQwODcxMUUyQjg0RUEzOUQxOEIzNTE0NCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2MTQ3MjMwRDQwODcxMUUyQjg0RUEzOUQxOEIzNTE0NCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjA3ODAxMTc0MDcyMDY4MTE4QTZEOTA0MEExQjM1M0NCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAxODAxMTc0MDcyMDY4MTE4QTZEOTA0MEExQjM1M0NCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+DM5/MwAAALhJREFUeNpi/P//PwMlgAmN3w/E//HhiPBwFA2MaC7439TYyHDt2jUY/y8QM4MYK1auZABpBtEgfbhcgKyZAaYZGUBdALeVhQTvFgJt70d2LcglGF5A9yMagHnpL9AwEM3IhEMRVgDVhAKweiEuPp7By8sLzu/u6mIoLSvDGjZMDBQCig3AFoh/sUUfclqAsXEFIk6ALYYwDNDW1mYiEI0MWlpaSG4GegEJ9/8nHoDUYoQB/WMBIMAAjkB//5fiW0oAAAAASUVORK5CYII=</xsl:variable>

<xsl:variable name="audioIcon">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowMTgwMTE3NDA3MjA2ODExOEE2RDkwNDBBMUIzNTNDQiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3MEE0RTIyNTQwODgxMUUyQjg0RUEzOUQxOEIzNTE0NCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3MEE0RTIyNDQwODgxMUUyQjg0RUEzOUQxOEIzNTE0NCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjA3ODAxMTc0MDcyMDY4MTE4QTZEOTA0MEExQjM1M0NCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAxODAxMTc0MDcyMDY4MTE4QTZEOTA0MEExQjM1M0NCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8++oKnOgAAANJJREFUeNqkU90NgyAQPrDTyDNLuIBdo5EF7LOGNeoCLOE72xDKNdCcSKnGSy54we+7735g3nu4YjyLdXBf83vfbwAsU+Cf4wjW2hS74A1+vJYFEIwn4n4poGBIYGpRwTfr7US5j5BdU7WoZFcCrVFKCeu60vtUkgtkeDJeyOQSeFBqcxFB1SlACRwbR5vYVAnyzMYYmOb50B58bJ6mTdx1HahhOE6AjaMkqbFpF/4SlEgoUZVACMEpSWlCbduSwYc9IK79ccN/d2/h8ms8bW8BBgAMMpNo7kF60gAAAABJRU5ErkJggg==</xsl:variable>

<xsl:variable name="pdfIcon">data:image/png;base64,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</xsl:variable>

<xsl:variable name="variousIcon">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDowMTgwMTE3NDA3MjA2ODExOEE2RDkwNDBBMUIzNTNDQiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDowQUU3N0JBQTQwNUYxMUUyOTNBQkI0RjFCQkZCREUwOCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowQUU3N0JBOTQwNUYxMUUyOTNBQkI0RjFCQkZCREUwOCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjA0ODAxMTc0MDcyMDY4MTE4QTZEOTA0MEExQjM1M0NCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAxODAxMTc0MDcyMDY4MTE4QTZEOTA0MEExQjM1M0NCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8++dOqUQAAAJNJREFUeNpi/P//PwMlgAmN3w/E//HhiPBwFA2MaC7439TYyHDt2jUY/y8QM4MYK1auZABpBtEgfbhcgKyZAaYZGUBdALeVhQTvFgJt70d2LcglGF5A9yMagHnpL9AwEM3IhEMRLsBMKBaIBcyUGsAwnA3Q1tZmIhCNDFpaWkgRD0wHSLj/P/EApBYjL9A/DAACDACJEW0HSbBD7wAAAABJRU5ErkJggg==</xsl:variable>

<xsl:variable name="infoButtonIcon">data:image/gif;base64,R0lGODlhEAAQAPefACJ3zgFyzgBtywBwzRd1zgBrySp6zv7+/////zl8zQBpx9Xi9Pj7/TV8zwBdvwBjwjh7zTF7zwBoxVmS1wBlxeDq9wBmxABdvgBpyfT2+/P3+wBcvSl70ht3y1SR2Cp4zcvc8WeY1y1+0fv8/mWW1r/S7/3+/wBuzQBqyABoyQBrxCJ50c/e8gBkwj+G0kKD0mWW1wBfv5y75BJzzfv8/evx+vL2+2yZ197p9/z9/gByzqnE5wBewQBuzJK25V6V1P7+/gBsyQBwzRtzxgJwzAVxzbfN7GqY16nC54Ku4hByxgJwyx93zyB2ziV5ziJ3zd7o9h91zABxzjp+zzx+zxNxxQBfvlOQ1wBkwgBnxfb4/ABcvvD0+1iU2T6Azzp7zTd8zlCR2C180Nfk9PX3/FCP1RJ1zg90y1CN006N02qb2rjQ7Q1xy1qU2TF5zWea2k6L1anF6yR2zPn6/QBqx2CY2y14zqG95QBsyt3o9i94zABtzQBrzMXX7zZ7zgBjxQBrxdHe8u3y+kSD0Sh5ztTh8wBgwQVzyV+S1bDJ6cvc8i96zujv+eTt+ABjwwBnx1mT2QBuzABxzZu95/D1+wBoxjR/0GiZ1gBkxiR2zQBnxhl2zWac3DR/zVWQ1v///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4wLWMwNjAgNjEuMTM0Nzc3LCAyMDEwLzAyLzEyLTE3OjMyOjAwICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RkE2NkQ1RUMzQUY4MTFFNzlEQjRERDdDNDEyMkJCM0MiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RkE2NkQ1RUQzQUY4MTFFNzlEQjRERDdDNDEyMkJCM0MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpGQTY2RDVFQTNBRjgxMUU3OURCNEREN0M0MTIyQkIzQyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpGQTY2RDVFQjNBRjgxMUU3OURCNEREN0M0MTIyQkIzQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgH//v38+/r5+Pf29fTz8vHw7+7t7Ovq6ejn5uXk4+Lh4N/e3dzb2tnY19bV1NPS0dDPzs3My8rJyMfGxcTDwsHAv769vLu6ubi3trW0s7KxsK+urayrqqmop6alpKOioaCfnp2cm5qZmJeWlZSTkpGQj46NjIuKiYiHhoWEg4KBgH9+fXx7enl4d3Z1dHNycXBvbm1sa2ppaGdmZWRjYmFgX15dXFtaWVhXVlVUU1JRUE9OTUxLSklIR0ZFRENCQUA/Pj08Ozo5ODc2NTQzMjEwLy4tLCsqKSgnJiUkIyIhIB8eHRwbGhkYFxYVFBMSERAPDg0MCwoJCAcGBQQDAgEAACH5BAEAAJ8ALAAAAAAQABAAQAj1AD8J/MSgEJIbJO4E0jLwU50TQiJGWqHhgAc+ESOGOfAmigEDhCzlYTThycdMcEZ8qmDIggQLhxggQONIQhYeLAYucOOHihcYIQZNAaOnhMA4kQgonSGCC402RZSaIeIDB6YCWFFsynCgzCOsQf4oGthHyYUYWzZYuaDCCIKGn6AcSZAAwpe6iBY0FPRhUYMILzQAUWPnr5wKnxqxAcAYgBNPE8Q0abxkAScpATJL4kAGAaQ9mQPo6DIphYDTeJhwvYLhtAAMSXK4oEBHQaUzNkykoaBAgaYOcwSucfAACyAQYzoVdyDjbUNKiS4NqfJjR42GAQEAOw==</xsl:variable>

  <!-- Superscript -->
  <xsl:template match="n1:sup">
    <sup>
      <xsl:apply-templates/>
    </sup>
  </xsl:template>

  <!-- Subscript -->
  <xsl:template match="n1:sub">
    <sub>
      <xsl:apply-templates/>
    </sub>
  </xsl:template>


  <!--   RenderLogo
    only handles PNG's and JPEG's.  It could, however,
  media type  @ID  =$imageRef  referencedObject
    -->
  <xsl:template name="renderLogo">
    <xsl:param name="logo"/>

    <xsl:if test="$logo/n1:value[@mediaType='image/png' or @mediaType='image/jpg' or @mediaType='image/jpeg']">
      <!-- image data inline B64 coded -->
      <xsl:if test="$logo/n1:value/@representation='B64'">
        <xsl:element name="img">
          <xsl:attribute name="src">data:
          <xsl:value-of select="$logo/n1:value/@mediaType"/>;base64,
          <xsl:value-of select="$logo/n1:value"/></xsl:attribute>
        </xsl:element>
      </xsl:if>
    </xsl:if>
  </xsl:template>



  <!--
    Contact Information
  different rendering for telecom and addresses
  -->
  <xsl:template name="getContactInfo">
    <xsl:param name="contact"/>
    <xsl:apply-templates select="$contact/n1:addr"/>
    <xsl:apply-templates select="$contact/n1:telecom"/>
  </xsl:template>

  <xsl:template name="getContactAddress">
    <xsl:param name="contact"/>
    <div class="contactAddress">
      <xsl:apply-templates select="$contact/n1:addr"/>
    </div>
  </xsl:template>

  <xsl:template name="getContactTelecom">
    <xsl:param name="contact"/>
    <xsl:apply-templates select="$contact/n1:telecom">
        <xsl:with-param name="asTable" select="false()" />
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template name="getContactTelecomTable">
    <xsl:param name="contact"/>
    <xsl:apply-templates select="$contact/n1:telecom">
        <xsl:with-param name="asTable" select="true()" />
    </xsl:apply-templates>
  </xsl:template>

  <!--
  get address
  -->
  <xsl:template match="n1:addr">
    <div class="address">
    <p class="addressRegion">
    <xsl:if test="@use">
      <!-- Wohnadresse etc. -->
      <xsl:call-template name="translateCode">
        <xsl:with-param name="code" select="@use"/>
      </xsl:call-template>
    </xsl:if>
    </p>
    <xsl:for-each select="n1:streetAddressLine">
      <p class="streetAddress"><xsl:value-of select="."/></p>
    </xsl:for-each>
    <p class="street">
    <xsl:if test="n1:streetName">
      <xsl:value-of select="n1:streetName"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="n1:houseNumber"/>
    </xsl:if>
    </p>
    <p class="city">
    <xsl:value-of select="n1:postalCode"/>
    <xsl:text> </xsl:text>
    <xsl:variable name="uppercase" >
    <xsl:if test="n1:country != 'Österreich' and n1:country != 'A' and n1:country != 'Austria' and n1:country != 'Oesterreich' and n1:country != 'AUT' " >
      uppercase
    </xsl:if>
    </xsl:variable>
    <span class="{$uppercase}"><xsl:value-of select="n1:city"/></span>
    <xsl:if test="n1:state and not(n1:state/@nullFlavor)">
      <xsl:text>, </xsl:text>
      <xsl:value-of select="n1:state"/>
    </xsl:if>
    </p>
    <xsl:if test="n1:country != 'Österreich' and n1:country != 'A' and n1:country != 'Austria' and n1:country != 'Oesterreich' and n1:country != 'AUT' ">
    <p class="country">
      <xsl:value-of select="n1:country"/>
    </p>
    </xsl:if>
    <xsl:value-of select="text()"/>
    </div>
  </xsl:template>

  <!--
    get telecom information (tel, www, ...)
  -->
  <xsl:template match="n1:telecom">
    <xsl:param name="asTable" />
    <xsl:variable name="type" select="substring-before(@value, ':')"/>
    <xsl:variable name="value" select="substring-after(@value, ':')"/>
    <xsl:if test="$type and not($asTable)">
      <p class="telecom">
        <xsl:call-template name="translateCode">
          <xsl:with-param name="code" select="$type"/>
        </xsl:call-template>
        <xsl:if test="@use">
          <span class="lighter"><xsl:text> (</xsl:text>
          <xsl:call-template name="translateCode">
            <xsl:with-param name="code" select="@use"/>
          </xsl:call-template>
          <xsl:text>)</xsl:text></span>
        </xsl:if>
        <xsl:text>  </xsl:text>
        <xsl:choose>
          <!-- is url -->
          <xsl:when test="$type='http'">
            <a href="{@value}" target="_blank">
              <xsl:call-template name="uriDecode">
                <xsl:with-param name="uri" select="@value" />
              </xsl:call-template>
            </a>
          </xsl:when>
          <!-- is mail -->
          <xsl:when test="$type='mailto'">
            <a href="{@value}" target="_blank">
              <xsl:call-template name="uriDecode">
                <xsl:with-param name="uri" select="$value" />
              </xsl:call-template>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="uriDecode">
              <xsl:with-param name="uri" select="$value" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </p>
    </xsl:if>
    <xsl:if test="$type and $asTable">
      <tr class="telecom">
        <td class="firstrow">
        <xsl:call-template name="translateCode">
          <xsl:with-param name="code" select="$type"/>
        </xsl:call-template>
        <xsl:if test="@use">
          <span class="lighter"><xsl:text> (</xsl:text>
          <xsl:call-template name="translateCode">
            <xsl:with-param name="code" select="@use"/>
          </xsl:call-template>
          <xsl:text>)</xsl:text></span>
        </xsl:if>
        </td>
        <td>
        <xsl:choose>
          <!-- is url -->
          <xsl:when test="$type='http'">
            <a href="{@value}" target="_blank">
              <xsl:call-template name="uriDecode">
                <xsl:with-param name="uri" select="@value" />
              </xsl:call-template>
            </a>
          </xsl:when>
          <!-- is mail -->
          <xsl:when test="$type='mailto'">
            <a href="{@value}" target="_blank">
              <xsl:call-template name="uriDecode">
                <xsl:with-param name="uri" select="$value" />
              </xsl:call-template>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="uriDecode">
              <xsl:with-param name="uri" select="$value" />
            </xsl:call-template>
          </xsl:otherwise>          
        </xsl:choose>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getAddress">
    <xsl:param name="addr"/>
    <div class="address">
    <xsl:if test="$addr/n1:additionalLocator">
      <p class="locator"><xsl:value-of select="$addr/n1:additionalLocator"/></p>
    </xsl:if>
    <xsl:if test="$addr/n1:streetAddressLine">
      <p class="streetAddress"><xsl:value-of select="$addr/n1:streetAddressLine"/></p>
    </xsl:if>
    <p class="street">
    <xsl:if test="$addr/n1:streetName">
      <xsl:value-of select="$addr/n1:streetName"/>
    </xsl:if>
    <xsl:if test="$addr/n1:houseNumber">
      <xsl:text> </xsl:text>
      <xsl:value-of select="$addr/n1:houseNumber"/>
    </xsl:if>
    </p>
    <xsl:if test="$addr/n1:postalCode or $addr/n1:city">
      <p class="city">
      <xsl:value-of select="$addr/n1:postalCode"/>
      <xsl:text> </xsl:text>
    <xsl:variable name="uppercase" >
      <xsl:if test="$addr/n1:country != 'Österreich' and $addr/n1:country != 'A' and $addr/n1:country != 'Austria' and $addr/n1:country != 'Oesterreich' and n1:country != 'AUT' ">
      uppercase
      </xsl:if>
      </xsl:variable>
      <span class="{$uppercase}"><xsl:value-of select="$addr/n1:city"/></span>
      <xsl:if test="$addr/n1:state and not($addr/n1:state/@nullFlavor='UNK')">
        <xsl:text>, </xsl:text>
        <xsl:value-of select="$addr/n1:state"/>
      </xsl:if>
      </p>
      <xsl:if test="$addr/n1:country != 'Österreich' and $addr/n1:country != 'A' and $addr/n1:country != 'Austria' and $addr/n1:country != 'Oesterreich' and n1:country != 'AUT' ">
      <p class="country">
        <xsl:value-of select="$addr/n1:country"/>
      </p>
      </xsl:if>
    </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="getAuthor">
    <xsl:param name="author"/>
    <xsl:if test="$author/n1:assignedPerson/n1:name">
      <xsl:call-template name="getName">
        <xsl:with-param name="name" select="$author/n1:assignedPerson/n1:name"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$author/../n1:time/@value">
        (am
        <xsl:call-template name="formatDate">
        <xsl:with-param name="date" select="$author/../n1:time"/>
      </xsl:call-template>)
      </xsl:if>
    <xsl:if test="$author/n1:addr">
      <xsl:call-template name="getAddress">
        <xsl:with-param name="addr" select="$author/n1:addr"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$author/n1:telecom">
      <xsl:apply-templates select="$author/n1:telecom"/>
    </xsl:if>
    <br/>
  </xsl:template>

  <xsl:template name="getOrganization">
    <xsl:param name="organization"/>
    <xsl:param name="showMore"><xsl:value-of select="0"/></xsl:param>
      
    <xsl:if test="$organization/n1:name">
      <p class="organisationName"><xsl:value-of select="$organization/n1:name"/></p>
    </xsl:if>

    <xsl:if test="$organization/n1:addr">
      <xsl:call-template name="getAddress">
        <xsl:with-param name="addr" select="$organization/n1:addr"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="$organization/n1:telecom">
      <xsl:apply-templates select="$organization/n1:telecom"/>
    </xsl:if>
    <xsl:if test="$organization/n1:asOrganizationPartOf/n1:wholeOrganization">
      <xsl:call-template name="getOrganization">
        <xsl:with-param name="organization" select="$organization/n1:asOrganizationPartOf/n1:wholeOrganization"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:if test="count(/n1:ClinicalDocument/n1:author/n1:assignedAuthor[count(n1:assignedAuthoringDevice)=0]) &gt; 1">
      <xsl:if test="$showMore=1">
        <p class="telecom"><i>(mehrere Dokumentenverfasser)</i></p>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getIntendedRecipient">
    <xsl:param name="recipient"/>
    <p class="organisationName">
      <xsl:text>z.H.: </xsl:text>
      <xsl:if test="$recipient/n1:informationRecipient/n1:name">
        <xsl:call-template name="getName">
          <xsl:with-param name="name" select="$recipient/n1:informationRecipient/n1:name"/>
        </xsl:call-template>
      </xsl:if>
    </p>
    <div class="recipient">
      <xsl:if test="$recipient/n1:addr">
        <xsl:call-template name="getAddress">
          <xsl:with-param name="addr" select="$recipient/n1:addr"/>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="$recipient/n1:telecom">
        <xsl:apply-templates select="$recipient/n1:telecom"/>
      </xsl:if>
    </div>
  </xsl:template>
  
  <!--
    code translations for encounter description 
  -->
  <xsl:template name="getEncounter">
    <xsl:variable name="codeName" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:code/@code" />
    <xsl:choose>
      <xsl:when test="$codeName = 'AMB' or $codeName = 'HH'">Besuch</xsl:when>
      <xsl:when test="$codeName = 'EMER' or $codeName = 'FLD' or $codeName = 'VR'">Behandlung</xsl:when>
      <xsl:when test="$codeName = 'IMP' or $codeName = 'ACUTE' or $codeName = 'NONAC' or $codeName = 'PRENC' or $codeName = 'SS'">Aufenthalt</xsl:when>    
      <xsl:otherwise> </xsl:otherwise>  
    </xsl:choose>
  </xsl:template>
  
  <!--
    code translations for encounter case number 
  -->
  <xsl:template name="getEncounterCaseNumber">
    <xsl:variable name="codeName" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:code/@code" />
    <xsl:choose>
      <xsl:when test="$codeName = 'AMB' or $codeName = 'HH' or $codeName = 'EMER' or $codeName = 'FLD' or $codeName = 'VR'">Fallzahl: </xsl:when>    
      <xsl:when test="$codeName = 'IMP' or $codeName = 'ACUTE' or $codeName = 'NONAC' or $codeName = 'PRENC' or $codeName = 'SS'">Aufnahmezahl: </xsl:when>    
      <xsl:otherwise> </xsl:otherwise>  
    </xsl:choose>
  </xsl:template>

  <!--
    code translations for ambulantory description
  -->
  <xsl:template name="getAmbulatory">
    <xsl:param name="effectiveTime" />
    <xsl:param name="code" />
    <xsl:param name="date_shortmode" />
    <xsl:variable name="codeName" select="$code/@code" />
    <xsl:variable name="codeSys" select="$code/@codeSystem" />
    <xsl:variable name="prefix">
      <xsl:choose>
        <xsl:when test="$codeName = 'AMB' and $codeSys = '2.16.840.1.113883.5.4' ">Ambulant</xsl:when>
        <xsl:when test="$codeName = 'EMER' and $codeSys = '2.16.840.1.113883.5.4' ">Akutbehandlung</xsl:when>
        <xsl:when test="$codeName = 'FLD' and $codeSys = '2.16.840.1.113883.5.4' ">Notfall, Rettung, erste Hilfe</xsl:when>
        <xsl:when test="$codeName = 'HH' and $codeSys = '2.16.840.1.113883.5.4' ">Hausbesuch(e)</xsl:when>
        <xsl:when test="$codeName = 'IMP' and $codeSys = '2.16.840.1.113883.5.4' ">Stationär</xsl:when>
        <xsl:when test="$codeName = 'ACUTE' and $codeSys = '2.16.840.1.113883.5.4' ">Stationär</xsl:when>
        <xsl:when test="$codeName = 'NONAC' and $codeSys = '2.16.840.1.113883.5.4' ">Stationär</xsl:when>
        <xsl:when test="$codeName = 'PRENC' and $codeSys = '2.16.840.1.113883.5.4' ">Prästationär</xsl:when>
        <xsl:when test="$codeName = 'SS' and $codeSys = '2.16.840.1.113883.5.4' ">Tagesklinisch</xsl:when>
        <xsl:when test="$codeName = 'VR' and $codeSys = '2.16.840.1.113883.5.4' ">Behandlung</xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$prefix"/><xsl:text> von: </xsl:text>
        <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="$effectiveTime/n1:low"/>
	        <xsl:with-param name="date_shortmode"><xsl:value-of select="$date_shortmode" /></xsl:with-param>
        </xsl:call-template>
        <xsl:text> bis: </xsl:text>
        <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="$effectiveTime/n1:high"/>
            <xsl:with-param name="date_shortmode"><xsl:value-of select="$date_shortmode" /></xsl:with-param>
        </xsl:call-template>
  </xsl:template>



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAMaritalStatus">
        <xsl:param name="code" />
        
        <xsl:choose>
            <xsl:when test="$code='D'">Geschieden</xsl:when>
            <xsl:when test="$code='M'">Verheiratet</xsl:when>
            <xsl:when test="$code='S'">Ledig</xsl:when>
            <xsl:when test="$code='T'">In Lebenspartnerschaft</xsl:when>
            <xsl:when test="$code='W'">Verwitwet</xsl:when>
            <xsl:otherwise>unbekannter Ehestatus</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    


  <!--
    code translations for OIDs
  -->
  <xsl:template name="getNameFromOID">
    <xsl:for-each select="/n1:ClinicalDocument/n1:templateId">
      <xsl:variable name="oid">
        <xsl:value-of select="@root"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$oid = '1.2.40.0.34.11.1'">Allgemeiner Leitfaden</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.2'">, Entlassungsbrief (Ärztlich)</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.3'">, Entlassungsbrief (Pflege)</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.4'">, Laborbefund</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.5'">, Befund Bildgebende Diagnostik</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.8.1'">, e-Medikation (Rezept)</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.8.2'">, e-Medikation (Abgabe)</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.8.3'">, e-Medikation (Medikationsliste)</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.8.4'">, e-Medikation (Pharmazeutische Empfehlung)</xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:if test="not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.1') and 
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.2') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.3') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.4') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.5') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.8.1') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.8.2') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.8.3') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.8.4')">
      <xsl:text>(keine)</xsl:text>
    </xsl:if>
  </xsl:template>

  <!--
    ELGA Interoperabilitätsstufe
  -->
  <xsl:template name="getEISFromOID">
    <xsl:for-each select="/n1:ClinicalDocument/n1:templateId">
      <xsl:variable name="oid">
        <xsl:value-of select="@root"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$oid = '1.2.40.0.34.11.2.0.1'">Basic/Structured</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.2.0.2'">Enhanced</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.2.0.3'">Full support</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.3.0.1'">Basic/Structured</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.3.0.2'">Enhanced</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.3.0.3'">Full support</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.4.0.1'">Basic/Structured</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.4.0.2'">Enhanced</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.4.0.3'">Full support</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.5.0.1'">Basic</xsl:when>
        <xsl:when test="$oid = '1.2.40.0.34.11.5.0.3'">Full support</xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:if test="not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.2.0.1') and 
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.2.0.2') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.2.0.3') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.3.0.1') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.3.0.2') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.3.0.3') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.4.0.1') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.4.0.2') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.4.0.3') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.5.0.1') and
      not(/n1:ClinicalDocument/n1:templateId/@root='1.2.40.0.34.11.5.0.3')">
      <xsl:text>(keine)</xsl:text>
    </xsl:if>
  </xsl:template>



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAMedikationRezeptart">
        <xsl:param name="code" />
        
        <xsl:choose>
            <xsl:when test="$code='KASSEN'">Kassenrezept</xsl:when>
            <xsl:when test="$code='PRIVAT'">Privatrezept</xsl:when>
            <xsl:when test="$code='SUBST'">Substitutionsrezept</xsl:when>
            <xsl:otherwise>Unbekannter Rezepttyp</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    


  <!-- ServiceEvents -->
  <xsl:template name="getServiceEvents">
    <ul class="serviceeventlist">
    <xsl:for-each select="*/n1:serviceEvent/n1:code">
      <li>
      	<xsl:choose>
      	  <xsl:when test="@displayName='Microbiology studies (set)'">
      	  	<xsl:text>Mikrobiologie</xsl:text>
      	  </xsl:when>
      	  <xsl:otherwise>
            <xsl:value-of select="@displayName" />
      	  </xsl:otherwise>
      	</xsl:choose>
    	</li>
    </xsl:for-each>
    </ul>
  </xsl:template>



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getHL7ATXDSDokumentenklassen">
        <xsl:param name="code" />
        
        <xsl:choose>
            <xsl:when test="$code='18842-5'">Entlassungsbrief</xsl:when>
            <xsl:when test="$code='11490-0'">Entlassungsbrief Ärztlich</xsl:when>
            <xsl:when test="$code='34745-0'">Entlassungsbrief Pflege</xsl:when>
            <xsl:when test="$code='11502-2'">Laborbefund</xsl:when>
            <xsl:when test="$code='18748-4'">Befund bildgebende Diagnostik</xsl:when>
            <xsl:when test="$code='25045-6'">Computertomographie-Befund</xsl:when>
            <xsl:when test="$code='25056-3'">Magnetresonanztomographie-Befund</xsl:when>
            <xsl:when test="$code='25061-3'">Ultraschall-Befund</xsl:when>
            <xsl:when test="$code='49118-3'">Nuklearmedizinischer Befund</xsl:when>
            <xsl:when test="$code='44136-0'">Positronen-Emissions-Tomographie-Befund</xsl:when>
            <xsl:when test="$code='18745-0'">Herzkatheter-Befund</xsl:when>
            <xsl:when test="$code='42148-7'">Echokardiographie-Befund</xsl:when>
            <xsl:when test="$code='18782-3'">Radiologie-Befund</xsl:when>
            <xsl:when test="$code='18746-8'">Kolonoskopie-Befund</xsl:when>
            <xsl:when test="$code='18751-8'">Endoskopie-Befund</xsl:when>
            <xsl:when test="$code='11525-3'">Geburtshilfliche Ultraschalluntersuchung</xsl:when>
            <xsl:when test="$code='55113-5'">KOS Objekte</xsl:when>
            <xsl:when test="$code='52471-0'">Medikation</xsl:when>
            <xsl:when test="$code='57833-6'">Rezept</xsl:when>
            <xsl:when test="$code='60593-1'">Abgabe</xsl:when>
            <xsl:when test="$code='56445-0'">Medikationsliste</xsl:when>
            <xsl:when test="$code='61356-2'">Pharmazeutische Empfehlung</xsl:when>
            <xsl:when test="$code='11529-5'">Pathologiebefund</xsl:when>
            <xsl:when test="$code='18743-5'">Obduktionsbefund</xsl:when>
            <xsl:when test="$code='18725-2'">Mikrobiologie-Befund</xsl:when>
            <xsl:when test="$code='11504-8'">OP-Bericht</xsl:when>
            <xsl:when test="$code='57829-4'">Verordnung von Heilbehelfen und Hilfsmitteln</xsl:when>
            <xsl:when test="$code='64288-4'">Brillenverordnung</xsl:when>
            <xsl:when test="$code='51845-6'">Allgemeiner Facharztbefund</xsl:when>
            <xsl:when test="$code='34764-1'">Allgemeinmedizinischer Befund</xsl:when>
            <xsl:when test="$code='34803-7'">Arbeitsmedizinischer Befund</xsl:when>
            <xsl:when test="$code='34807-8'">Augenbefund</xsl:when>
            <xsl:when test="$code='33720-4'">Immunhämatologischer Befund</xsl:when>
            <xsl:when test="$code='34847-4'">Chirurgischer Befund</xsl:when>
            <xsl:when test="$code='34758-3'">Dermatologiebefund</xsl:when>
            <xsl:when test="$code='34760-9'">Diabetologischer Befund</xsl:when>
            <xsl:when test="$code='34879-7'">Endokrinologiebefund</xsl:when>
            <xsl:when test="$code='34761-7'">Gastroenterologiebefund</xsl:when>
            <xsl:when test="$code='34853-2'">Gefäßchirurgischer Befund</xsl:when>
            <xsl:when test="$code='34776-5'">Geriatriebefund</xsl:when>
            <xsl:when test="$code='34777-3'">Gynäkologie-Befund</xsl:when>
            <xsl:when test="$code='34779-9'">Hämatologie-Befund</xsl:when>
            <xsl:when test="$code='34816-9'">HNO-Befund</xsl:when>
            <xsl:when test="$code='34781-5'">Infektiologiebefund</xsl:when>
            <xsl:when test="$code='34099-2'">Kardiologiebefund</xsl:when>
            <xsl:when test="$code='68881-2'">Kinder- und Jugendchirurgischer Befund</xsl:when>
            <xsl:when test="$code='34812-8'">Mund-, Kiefer- und Gesichtschirurgischer Befund</xsl:when>
            <xsl:when test="$code='34795-5'">Nephrologischer befund</xsl:when>
            <xsl:when test="$code='34798-9'">Neurochirurgischer Befund</xsl:when>
            <xsl:when test="$code='34797-1'">Neurologischer Befund</xsl:when>
            <xsl:when test="$code='34805-2'">Onkologiebefund</xsl:when>
            <xsl:when test="$code='34814-4'">Orthopädischer/Orthopädisch-Chirurgischer Befund</xsl:when>
            <xsl:when test="$code='68818-4'">Pädiatrischer Befund</xsl:when>
            <xsl:when test="$code='34822-7'">Physikalisch-Medizinischer Befund</xsl:when>
            <xsl:when test="$code='34826-8'">Plastisch-Chirurgischer Befund</xsl:when>
            <xsl:when test="$code='34788-0'">Psychiatrischer Befund</xsl:when>
            <xsl:when test="$code='34103-2'">Pulmologischer Befund</xsl:when>
            <xsl:when test="$code='34839-1'">Rheumatologischer Befund</xsl:when>
            <xsl:when test="$code='34831-8'">Strahlentherapeutisch-Radioonkologischer Befund</xsl:when>
            <xsl:when test="$code='34849-0'">Thoraxchirurgischer Befund</xsl:when>
            <xsl:when test="$code='34851-6'">Urologischer Befund</xsl:when>
            <xsl:when test="$code='28651-8'">Pflegesituationsbericht</xsl:when>
            <xsl:when test="$code='46215-0'">Wunddokumentation</xsl:when>
            <xsl:when test="$code='57016-8'">Patienteneinverständniserklärung</xsl:when>
            <xsl:when test="$code='42348-3'">Patientenverfügung</xsl:when>
            <xsl:when test="$code='64298-3'">Vorsorgevollmacht</xsl:when>
            <xsl:when test="$code='34855-7'">Ergotherapeutischer Bericht</xsl:when>
            <xsl:when test="$code='34845-8'">Logopädischer Bericht</xsl:when>
            <xsl:when test="$code='34841-7'">Sozialpädagogischer Bericht</xsl:when>
            <xsl:when test="$code='34791-4'">Psychologischer Bericht</xsl:when>
            <xsl:when test="$code='34800-3'">Diätologie-Bericht</xsl:when>
            <xsl:when test="$code='34824-3'">Physiotherapiebericht</xsl:when>
            <xsl:when test="$code='57057-2'">Geburtsbericht (ärztlich)</xsl:when>
            <xsl:when test="$code='59268-3'">Geburtsbericht (Hebamme)</xsl:when>
            <xsl:when test="$code='34810-2'">Optometrischer Bericht</xsl:when>
            <xsl:when test="$code='29749-9'">Dialysebericht</xsl:when>
            <xsl:when test="$code='72134-0'">Krebsregistermeldung</xsl:when>
            <xsl:when test="$code='57830-2'">Einweisungsbericht</xsl:when>
            <xsl:when test="$code='57834-4'">Anforderung für Patiententransport</xsl:when>
            <xsl:when test="$code='11524-6'">EKG-Bericht</xsl:when>
            <xsl:when test="$code='46209-3'">Anforderung / Auftrag</xsl:when>
            <xsl:when test="$code='11488-4'">Befund</xsl:when>
            <xsl:when test="$code='60591-5'">Patient Summary</xsl:when>
            <xsl:when test="$code='34133-9'">Krankengeschichte</xsl:when>
            <xsl:otherwise>unbestätigte Dokumentenklasse</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAReligiousAffiliation">
        <xsl:param name="religiousAffiliation" />
        
        <xsl:choose>
            <xsl:when test="$religiousAffiliation/@code='100'">Katholische Kirche (o.n.A.)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='101'">Römisch-Katholisch</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='102'">Griechisch-Katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='103'">Armenisch-Katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='104'">Bulgarisch-Katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='105'">Rumänische griechisch-katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='106'">Russisch-Katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='107'">Syrisch-Katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='108'">Ukrainische Griechisch-Katholische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='109'">Katholische Ostkirche (ohne nähere Angabe)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='110'">Griechisch-Orientalische Kirchen</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='111'">Orthodoxe Kirchen (o.n.A.)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='112'">Griechisch-Orthodoxe Kirche (Hl.Dreifaltigkeit)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='113'">Griechisch-Orthodoxe Kirche (Hl.Georg)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='114'">Bulgarisch-Orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='115'">Rumänisch-griechisch-orientalische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='116'">Russisch-Orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='117'">Serbisch-griechisch-Orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='118'">Ukrainisch-Orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='119'">Orientalisch-Orthodoxe Kirchen</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='120'">Armenisch-apostolische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='121'">Syrisch-orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='122'">Syrisch-orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='123'">Koptisch-orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='124'">Armenisch-apostolische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='125'">Äthiopisch-Orthodoxe Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='126'">Evangelische Kirchen Österreich</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='127'">Evangelische Kirche (o.n.A.)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='128'">Evangelische Kirche A.B.</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='129'">Evangelische Kirche H.B.</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='130'">Andere Christliche Kirchen</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='131'">Altkatholische Kirche Österreichs</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='132'">Anglikanische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='133'">Evangelisch-methodistische Kirche (EmK)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='134'">Sonstige Christliche Gemeinschaften</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='135'">Baptisten</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='136'">Bund evangelikaler Gemeinden in Österreich</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='137'">Freie Christengemeinde/Pfingstgemeinde</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='138'">Mennonitische Freikirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='139'">Kirche der Siebenten-Tags-Adventisten</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='140'">Christengemeinschaft</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='141'">Jehovas Zeugen</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='142'">Neuapostolische Kirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='143'">Mormonen</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='144'">Sonstige Christliche Gemeinschaften (O.n.A.)</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='145'">ELAIA Christengemeinden</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='146'">Pfingstkirche Gemeinde Gottes</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='148'">Nicht-christliche Gemeinschaften</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='149'">Israelitische Religionsgesellschaft</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='150'">Islamische Glaubensgemeinschaft</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='151'">Alevitische Religionsgesellschaft</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='152'">Buddhistische Religionsgesellschaft</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='153'">Baha` i</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='154'">Hinduistische Religionsgesellschaft</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='155'">Sikh</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='156'">Shintoismus</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='157'">Vereinigungskirche</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='162'">Pastafarianismus</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='158'">Andere religiöse Bekenntnisgemeinschaften</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='159'">Konfessionslos, ohne Angabe</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='160'">Konfessionslos</xsl:when>
            <xsl:when test="$religiousAffiliation/@code='161'">Ohne Angabe</xsl:when>
            <xsl:otherwise><xsl:value-of select="$religiousAffiliation/@displayName" /></xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    


  <xsl:key name="languageCodeGrouping" match="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:languageCommunication" use="n1:languageCode/@code" />

  <xsl:template name="getLanguageAbility">
  <xsl:param name="patient" />

  <xsl:if test="not($patient/n1:languageCommunication)">
    unbekannt
  </xsl:if>

  <xsl:for-each select="$patient/n1:languageCommunication[generate-id() = generate-id(key('languageCodeGrouping', n1:languageCode/@code))]">

    <xsl:call-template name="getELGAHumanLanguage">
      <xsl:with-param name="code" select="n1:languageCode/@code" />
    </xsl:call-template>
    <xsl:text> </xsl:text>

    <xsl:if test="contains(n1:languageCode/@code, '-')">
      <xsl:text> (</xsl:text>
      <xsl:value-of select="n1:languageCode/@code" />
      <xsl:text>)</xsl:text>
    </xsl:if>

    <xsl:if test="n1:modeCode/@code or n1:proficiencyLevelCode/@code">

      <xsl:text> (</xsl:text>

      <xsl:call-template name="getLanguageAbilityForLanguage">
        <xsl:with-param name="code" select="n1:languageCode/@code" />
        <xsl:with-param name="patient" select="$patient" />
      </xsl:call-template>

      <xsl:text>)</xsl:text>

    </xsl:if>

    <xsl:if test="n1:preferenceInd/@value='true'">
      <xsl:text>, bevorzugt</xsl:text>
    </xsl:if>


    <br />
  </xsl:for-each>

  </xsl:template>

  <xsl:template name="getLanguageAbilityForLanguage">
  <xsl:param name="code" />
  <xsl:param name="patient" />

  <xsl:for-each select="$patient/n1:languageCommunication/n1:languageCode[@code=$code]">

    <xsl:if test="../n1:languageCode/@code=$code">

      <xsl:if test="../n1:modeCode/@code">
        <xsl:call-template name="getELGALanguageAbilityMode">
          <xsl:with-param name="code" select="../n1:modeCode/@code" />
        </xsl:call-template>
        <xsl:text>: </xsl:text>
      </xsl:if>

      <xsl:if test="../n1:proficiencyLevelCode/@code">
        <xsl:call-template name="getELGAProficiencyLevelCode">
          <xsl:with-param name="code" select="../n1:proficiencyLevelCode/@code" />
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="position() &lt; count($patient/n1:languageCommunication/n1:languageCode[@code=$code])">
        <xsl:text>, </xsl:text>
      </xsl:if>

    </xsl:if>
  </xsl:for-each>

  </xsl:template>



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAProficiencyLevelCode">
        <xsl:param name="code" />
        
        <xsl:choose>
            <xsl:when test="$code='E'">ausgezeichnet</xsl:when>
            <xsl:when test="$code='F'">ausreichend</xsl:when>
            <xsl:when test="$code='G'">gut</xsl:when>
            <xsl:when test="$code='P'">mangelhaft</xsl:when>
            <xsl:otherwise>unbekannter Code (<xsl:value-of select="$code" />)</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGALanguageAbilityMode">
        <xsl:param name="code" />
        
        <xsl:choose>
            <xsl:when test="$code='ESP'">spricht</xsl:when>
            <xsl:when test="$code='EWR'">schreibt</xsl:when>
            <xsl:when test="$code='RSP'">versteht gesprochen</xsl:when>
            <xsl:when test="$code='RWR'">versteht geschrieben</xsl:when>
            <xsl:otherwise>unbekannter Code (<xsl:value-of select="$code" />)</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAHumanLanguage">
        <xsl:param name="code" />
        
        <xsl:variable name="trimmedCode">
            <xsl:choose>
              <xsl:when test="contains($code, '-')">
                <xsl:value-of select="substring-before($code,'-')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$code" />
              </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$trimmedCode='aa'">Danakil-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ab'">Abchasisch</xsl:when>
            <xsl:when test="$trimmedCode='ace'">Aceh-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ach'">Acholi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ada'">Adangme-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ady'">Adygisch</xsl:when>
            <xsl:when test="$trimmedCode='ae'">Avestisch</xsl:when>
            <xsl:when test="$trimmedCode='af'">Afrikaans</xsl:when>
            <xsl:when test="$trimmedCode='afa'">Hamitosemitische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='afh'">Afrihili</xsl:when>
            <xsl:when test="$trimmedCode='ain'">Ainu-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ak'">Akan-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='akk'">Akkadisch</xsl:when>
            <xsl:when test="$trimmedCode='ale'">Aleutisch</xsl:when>
            <xsl:when test="$trimmedCode='alg'">Algonkin-Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='alt'">Altaisch</xsl:when>
            <xsl:when test="$trimmedCode='am'">Amharisch</xsl:when>
            <xsl:when test="$trimmedCode='an'">Aragonesisch</xsl:when>
            <xsl:when test="$trimmedCode='ang'">Altenglisch</xsl:when>
            <xsl:when test="$trimmedCode='anp'">Anga-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='apa'">Apachen-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='ar'">Arabisch</xsl:when>
            <xsl:when test="$trimmedCode='arc'">Aramäisch</xsl:when>
            <xsl:when test="$trimmedCode='arn'">Arauka-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='arp'">Arapaho-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='art'">Kunstsprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='arw'">Arawak-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='as'">Assamesisch</xsl:when>
            <xsl:when test="$trimmedCode='ast'">Asturisch</xsl:when>
            <xsl:when test="$trimmedCode='ath'">Athapaskische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='aus'">Australische Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='av'">Awarisch</xsl:when>
            <xsl:when test="$trimmedCode='awa'">Awadhi</xsl:when>
            <xsl:when test="$trimmedCode='ay'">Aymará-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='az'">Aserbeidschanisch</xsl:when>
            <xsl:when test="$trimmedCode='ba'">Baschkirisch</xsl:when>
            <xsl:when test="$trimmedCode='bad'">Banda-Sprachen (Ubangi-Sprachen)</xsl:when>
            <xsl:when test="$trimmedCode='bai'">Bamileke-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='bal'">Belutschisch</xsl:when>
            <xsl:when test="$trimmedCode='ban'">Balinesisch</xsl:when>
            <xsl:when test="$trimmedCode='bas'">Basaa-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='bat'">Baltische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='be'">Weißrussisch</xsl:when>
            <xsl:when test="$trimmedCode='bej'">Bedauye</xsl:when>
            <xsl:when test="$trimmedCode='bem'">Bemba-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ber'">Berbersprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='bg'">Bulgarisch</xsl:when>
            <xsl:when test="$trimmedCode='bh'">Bihari (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='bho'">Bhojpuri</xsl:when>
            <xsl:when test="$trimmedCode='bi'">Beach-la-mar</xsl:when>
            <xsl:when test="$trimmedCode='bik'">Bikol-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='bin'">Edo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='bla'">Blackfoot-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='bm'">Bambara-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='bn'">Bengali</xsl:when>
            <xsl:when test="$trimmedCode='bnt'">Bantusprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='bo'">Tibetisch</xsl:when>
            <xsl:when test="$trimmedCode='br'">Bretonisch</xsl:when>
            <xsl:when test="$trimmedCode='bra'">Braj-Bhakha</xsl:when>
            <xsl:when test="$trimmedCode='bs'">Bosnisch</xsl:when>
            <xsl:when test="$trimmedCode='btk'">Batak-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='bua'">Burjatisch</xsl:when>
            <xsl:when test="$trimmedCode='bug'">Bugi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='byn'">Bilin-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ca'">Katalanisch</xsl:when>
            <xsl:when test="$trimmedCode='cad'">Caddo-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='cai'">Indianersprachen, Zentralamerika (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='car'">Karibische Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='cau'">Kaukasische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='ce'">Tschetschenisch</xsl:when>
            <xsl:when test="$trimmedCode='ceb'">Cebuano</xsl:when>
            <xsl:when test="$trimmedCode='cel'">Keltische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='ch'">Chamorro-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='chb'">Chibcha-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='chg'">Tschagataisch</xsl:when>
            <xsl:when test="$trimmedCode='chk'">Trukesisch</xsl:when>
            <xsl:when test="$trimmedCode='chm'">Tscheremissisch</xsl:when>
            <xsl:when test="$trimmedCode='chn'">Chinook-Jargon</xsl:when>
            <xsl:when test="$trimmedCode='cho'">Choctaw-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='chp'">Chipewyan-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='chr'">Cherokee-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='chy'">Cheyenne-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='cmc'">Cham-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='co'">Korsisch</xsl:when>
            <xsl:when test="$trimmedCode='cop'">Koptisch</xsl:when>
            <xsl:when test="$trimmedCode='cpe'">Kreolisch-Englisch (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='cpf'">Kreolisch-Französisch (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='cpp'">Kreolisch-Portugiesisch (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='cr'">Cree-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='crh'">Krimtatarisch</xsl:when>
            <xsl:when test="$trimmedCode='crp'">Kreolische Sprachen, Pidginsprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='cs'">Tschechisch</xsl:when>
            <xsl:when test="$trimmedCode='csb'">Kaschubisch</xsl:when>
            <xsl:when test="$trimmedCode='cu'">Kirchenslawisch</xsl:when>
            <xsl:when test="$trimmedCode='cus'">Kuschitische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='cv'">Tschuwaschisch</xsl:when>
            <xsl:when test="$trimmedCode='cy'">Kymrisch</xsl:when>
            <xsl:when test="$trimmedCode='da'">Dänisch</xsl:when>
            <xsl:when test="$trimmedCode='dak'">Dakota-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='dar'">Darginisch</xsl:when>
            <xsl:when test="$trimmedCode='day'">Dajakisch</xsl:when>
            <xsl:when test="$trimmedCode='de'">Deutsch</xsl:when>
            <xsl:when test="$trimmedCode='del'">Delaware-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='den'">Slave-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='dgr'">Dogrib-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='din'">Dinka-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='doi'">Dogri</xsl:when>
            <xsl:when test="$trimmedCode='dra'">Drawidische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='dsb'">Niedersorbisch</xsl:when>
            <xsl:when test="$trimmedCode='dua'">Duala-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='dum'">Mittelniederländisch</xsl:when>
            <xsl:when test="$trimmedCode='dv'">Maledivisch</xsl:when>
            <xsl:when test="$trimmedCode='dyu'">Dyula-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='dz'">Dzongkha</xsl:when>
            <xsl:when test="$trimmedCode='ee'">Ewe-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='efi'">Efik</xsl:when>
            <xsl:when test="$trimmedCode='egy'">Ägyptisch</xsl:when>
            <xsl:when test="$trimmedCode='eka'">Ekajuk</xsl:when>
            <xsl:when test="$trimmedCode='el'">Neugriechisch</xsl:when>
            <xsl:when test="$trimmedCode='elx'">Elamisch</xsl:when>
            <xsl:when test="$trimmedCode='en'">Englisch</xsl:when>
            <xsl:when test="$trimmedCode='enm'">Mittelenglisch</xsl:when>
            <xsl:when test="$trimmedCode='eo'">Esperanto</xsl:when>
            <xsl:when test="$trimmedCode='es'">Spanisch</xsl:when>
            <xsl:when test="$trimmedCode='et'">Estnisch</xsl:when>
            <xsl:when test="$trimmedCode='eu'">Baskisch</xsl:when>
            <xsl:when test="$trimmedCode='ewo'">Ewondo</xsl:when>
            <xsl:when test="$trimmedCode='fa'">Persisch</xsl:when>
            <xsl:when test="$trimmedCode='fan'">Pangwe-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='fat'">Fante-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ff'">Ful</xsl:when>
            <xsl:when test="$trimmedCode='fi'">Finnisch</xsl:when>
            <xsl:when test="$trimmedCode='fil'">Pilipino</xsl:when>
            <xsl:when test="$trimmedCode='fiu'">Finnougrische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='fj'">Fidschi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='fo'">Färöisch</xsl:when>
            <xsl:when test="$trimmedCode='fon'">Fon-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='fr'">Französisch</xsl:when>
            <xsl:when test="$trimmedCode='frm'">Mittelfranzösisch</xsl:when>
            <xsl:when test="$trimmedCode='fro'">Altfranzösisch</xsl:when>
            <xsl:when test="$trimmedCode='frr'">Nordfriesisch</xsl:when>
            <xsl:when test="$trimmedCode='frs'">Ostfriesisch</xsl:when>
            <xsl:when test="$trimmedCode='fur'">Friulisch</xsl:when>
            <xsl:when test="$trimmedCode='fy'">Friesisch</xsl:when>
            <xsl:when test="$trimmedCode='ga'">Irisch</xsl:when>
            <xsl:when test="$trimmedCode='gaa'">Ga-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='gay'">Gayo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='gba'">Gbaya-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='gd'">Gälisch-Schottisch</xsl:when>
            <xsl:when test="$trimmedCode='gem'">Germanische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='gez'">Altäthiopisch</xsl:when>
            <xsl:when test="$trimmedCode='gil'">Gilbertesisch</xsl:when>
            <xsl:when test="$trimmedCode='gl'">Galicisch</xsl:when>
            <xsl:when test="$trimmedCode='gmh'">Mittelhochdeutsch</xsl:when>
            <xsl:when test="$trimmedCode='gn'">Guaraní-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='goh'">Althochdeutsch</xsl:when>
            <xsl:when test="$trimmedCode='gon'">Gondi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='gor'">Gorontalesisch</xsl:when>
            <xsl:when test="$trimmedCode='got'">Gotisch</xsl:when>
            <xsl:when test="$trimmedCode='grb'">Grebo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='grc'">Griechisch</xsl:when>
            <xsl:when test="$trimmedCode='gsw'">Schweizerdeutsch</xsl:when>
            <xsl:when test="$trimmedCode='gu'">Gujarati-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='gv'">Manx</xsl:when>
            <xsl:when test="$trimmedCode='gwi'">Kutchin-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ha'">Haussa-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='hai'">Haida-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='haw'">Hawaiisch</xsl:when>
            <xsl:when test="$trimmedCode='he'">Hebräisch</xsl:when>
            <xsl:when test="$trimmedCode='hi'">Hindi</xsl:when>
            <xsl:when test="$trimmedCode='hil'">Hiligaynon-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='him'">Himachali</xsl:when>
            <xsl:when test="$trimmedCode='hit'">Hethitisch</xsl:when>
            <xsl:when test="$trimmedCode='hmn'">Miao-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='ho'">Hiri-Motu</xsl:when>
            <xsl:when test="$trimmedCode='hr'">Kroatisch</xsl:when>
            <xsl:when test="$trimmedCode='hsb'">Obersorbisch</xsl:when>
            <xsl:when test="$trimmedCode='ht'">Haïtien (Haiti-Kreolisch)</xsl:when>
            <xsl:when test="$trimmedCode='hu'">Ungarisch</xsl:when>
            <xsl:when test="$trimmedCode='hup'">Hupa-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='hy'">Armenisch</xsl:when>
            <xsl:when test="$trimmedCode='hz'">Herero-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ia'">Interlingua</xsl:when>
            <xsl:when test="$trimmedCode='iba'">Iban-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='id'">Bahasa Indonesia</xsl:when>
            <xsl:when test="$trimmedCode='ie'">Interlingue</xsl:when>
            <xsl:when test="$trimmedCode='ig'">Ibo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ii'">Lalo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ijo'">Ijo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ik'">Inupik</xsl:when>
            <xsl:when test="$trimmedCode='ilo'">Ilokano-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='inc'">Indoarische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='ine'">Indogermanische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='inh'">Inguschisch</xsl:when>
            <xsl:when test="$trimmedCode='io'">Ido</xsl:when>
            <xsl:when test="$trimmedCode='ira'">Iranische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='iro'">Irokesische Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='is'">Isländisch</xsl:when>
            <xsl:when test="$trimmedCode='it'">Italienisch</xsl:when>
            <xsl:when test="$trimmedCode='iu'">Inuktitut</xsl:when>
            <xsl:when test="$trimmedCode='ja'">Japanisch</xsl:when>
            <xsl:when test="$trimmedCode='jbo'">Lojban</xsl:when>
            <xsl:when test="$trimmedCode='jpr'">Jüdisch-Persisch</xsl:when>
            <xsl:when test="$trimmedCode='jrb'">Jüdisch-Arabisch</xsl:when>
            <xsl:when test="$trimmedCode='jv'">Javanisch</xsl:when>
            <xsl:when test="$trimmedCode='ka'">Georgisch</xsl:when>
            <xsl:when test="$trimmedCode='kaa'">Karakalpakisch</xsl:when>
            <xsl:when test="$trimmedCode='kab'">Kabylisch</xsl:when>
            <xsl:when test="$trimmedCode='kac'">Kachin-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kam'">Kamba-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kar'">Karenisch</xsl:when>
            <xsl:when test="$trimmedCode='kaw'">Kawi</xsl:when>
            <xsl:when test="$trimmedCode='kbd'">Kabardinisch</xsl:when>
            <xsl:when test="$trimmedCode='kg'">Kongo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kha'">Khasi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='khi'">Khoisan-Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='kho'">Sakisch</xsl:when>
            <xsl:when test="$trimmedCode='ki'">Kikuyu-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kj'">Kwanyama-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kk'">Kasachisch</xsl:when>
            <xsl:when test="$trimmedCode='kl'">Grönländisch</xsl:when>
            <xsl:when test="$trimmedCode='km'">Kambodschanisch</xsl:when>
            <xsl:when test="$trimmedCode='kmb'">Kimbundu-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kn'">Kannada</xsl:when>
            <xsl:when test="$trimmedCode='ko'">Koreanisch</xsl:when>
            <xsl:when test="$trimmedCode='kok'">Konkani</xsl:when>
            <xsl:when test="$trimmedCode='kos'">Kosraeanisch</xsl:when>
            <xsl:when test="$trimmedCode='kpe'">Kpelle-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kr'">Kanuri-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='krc'">Karatschaiisch-Balkarisch</xsl:when>
            <xsl:when test="$trimmedCode='krl'">Karelisch</xsl:when>
            <xsl:when test="$trimmedCode='kro'">Kru-Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='kru'">Oraon-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ks'">Kaschmiri</xsl:when>
            <xsl:when test="$trimmedCode='ku'">Kurdisch</xsl:when>
            <xsl:when test="$trimmedCode='kum'">Kumükisch</xsl:when>
            <xsl:when test="$trimmedCode='kut'">Kutenai-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kv'">Komi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='kw'">Kornisch</xsl:when>
            <xsl:when test="$trimmedCode='ky'">Kirgisisch</xsl:when>
            <xsl:when test="$trimmedCode='la'">Latein</xsl:when>
            <xsl:when test="$trimmedCode='lad'">Judenspanisch</xsl:when>
            <xsl:when test="$trimmedCode='lah'">Lahnda</xsl:when>
            <xsl:when test="$trimmedCode='lam'">Lamba-Sprache (Bantusprache)</xsl:when>
            <xsl:when test="$trimmedCode='lb'">Luxemburgisch</xsl:when>
            <xsl:when test="$trimmedCode='lez'">Lesgisch</xsl:when>
            <xsl:when test="$trimmedCode='lg'">Ganda-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='li'">Limburgisch</xsl:when>
            <xsl:when test="$trimmedCode='ln'">Lingala</xsl:when>
            <xsl:when test="$trimmedCode='lo'">Laotisch</xsl:when>
            <xsl:when test="$trimmedCode='lol'">Mongo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='loz'">Rotse-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='lt'">Litauisch</xsl:when>
            <xsl:when test="$trimmedCode='lu'">Luba-Katanga-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='lua'">Lulua-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='lui'">Luiseño-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='lun'">Lunda-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='luo'">Luo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='lus'">Lushai-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='lv'">Lettisch</xsl:when>
            <xsl:when test="$trimmedCode='mad'">Maduresisch</xsl:when>
            <xsl:when test="$trimmedCode='mag'">Khotta</xsl:when>
            <xsl:when test="$trimmedCode='mai'">Maithili</xsl:when>
            <xsl:when test="$trimmedCode='mak'">Makassarisch</xsl:when>
            <xsl:when test="$trimmedCode='man'">Malinke-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='map'">Austronesische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='mas'">Massai-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mdf'">Mokscha-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mdr'">Mandaresisch</xsl:when>
            <xsl:when test="$trimmedCode='men'">Mende-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mg'">Malagassi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mga'">Mittelirisch</xsl:when>
            <xsl:when test="$trimmedCode='mh'">Marschallesisch</xsl:when>
            <xsl:when test="$trimmedCode='mi'">Maori-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mic'">Micmac-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='min'">Minangkabau-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mis'">Einzelne andere Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='mk'">Makedonisch</xsl:when>
            <xsl:when test="$trimmedCode='mkh'">Mon-Khmer-Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='ml'">Malayalam</xsl:when>
            <xsl:when test="$trimmedCode='mn'">Mongolisch</xsl:when>
            <xsl:when test="$trimmedCode='mnc'">Mandschurisch</xsl:when>
            <xsl:when test="$trimmedCode='mni'">Meithei-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mno'">Manobo-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='moh'">Mohawk-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mos'">Mossi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='mr'">Marathi</xsl:when>
            <xsl:when test="$trimmedCode='ms'">Malaiisch</xsl:when>
            <xsl:when test="$trimmedCode='mt'">Maltesisch</xsl:when>
            <xsl:when test="$trimmedCode='mul'">Mehrere Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='mun'">Mundasprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='mus'">Muskogisch</xsl:when>
            <xsl:when test="$trimmedCode='mwl'">Mirandesisch</xsl:when>
            <xsl:when test="$trimmedCode='mwr'">Marwari</xsl:when>
            <xsl:when test="$trimmedCode='my'">Birmanisch</xsl:when>
            <xsl:when test="$trimmedCode='myn'">Maya-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='myv'">Erza-Mordwinisch</xsl:when>
            <xsl:when test="$trimmedCode='na'">Nauruanisch</xsl:when>
            <xsl:when test="$trimmedCode='nah'">Nahuatl</xsl:when>
            <xsl:when test="$trimmedCode='nai'">Indianersprachen, Nordamerika (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='nap'">Neapel / Mundart</xsl:when>
            <xsl:when test="$trimmedCode='nb'">Bokmål</xsl:when>
            <xsl:when test="$trimmedCode='nd'">Ndebele-Sprache (Simbabwe)</xsl:when>
            <xsl:when test="$trimmedCode='nds'">Niederdeutsch</xsl:when>
            <xsl:when test="$trimmedCode='ne'">Nepali</xsl:when>
            <xsl:when test="$trimmedCode='new'">Newari</xsl:when>
            <xsl:when test="$trimmedCode='ng'">Ndonga</xsl:when>
            <xsl:when test="$trimmedCode='nia'">Nias-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nic'">Nigerkordofanische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='niu'">Niue-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nl'">Niederländisch</xsl:when>
            <xsl:when test="$trimmedCode='nn'">Nynorsk</xsl:when>
            <xsl:when test="$trimmedCode='no'">Norwegisch</xsl:when>
            <xsl:when test="$trimmedCode='nog'">Nogaisch</xsl:when>
            <xsl:when test="$trimmedCode='non'">Altnorwegisch</xsl:when>
            <xsl:when test="$trimmedCode='nqo'">N'Ko</xsl:when>
            <xsl:when test="$trimmedCode='nr'">Ndebele-Sprache (Transvaal)</xsl:when>
            <xsl:when test="$trimmedCode='nso'">Pedi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nub'">Nubische Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='nv'">Navajo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nwc'">Alt-Newari</xsl:when>
            <xsl:when test="$trimmedCode='ny'">Nyanja-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nym'">Nyamwezi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nyn'">Nkole-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nyo'">Nyoro-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='nzi'">Nzima-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='oc'">Okzitanisch</xsl:when>
            <xsl:when test="$trimmedCode='oj'">Ojibwa-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='om'">Galla-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='or'">Oriya-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='os'">Ossetisch</xsl:when>
            <xsl:when test="$trimmedCode='osa'">Osage-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ota'">Osmanisch</xsl:when>
            <xsl:when test="$trimmedCode='oto'">Otomangue-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='pa'">Pandschabi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='paa'">Papuasprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='pag'">Pangasinan-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='pal'">Mittelpersisch</xsl:when>
            <xsl:when test="$trimmedCode='pam'">Pampanggan-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='pap'">Papiamento</xsl:when>
            <xsl:when test="$trimmedCode='pau'">Palau-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='peo'">Altpersisch</xsl:when>
            <xsl:when test="$trimmedCode='phi'">Philippinisch-Austronesisch (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='phn'">Phönikisch</xsl:when>
            <xsl:when test="$trimmedCode='pi'">Pali</xsl:when>
            <xsl:when test="$trimmedCode='pl'">Polnisch</xsl:when>
            <xsl:when test="$trimmedCode='pon'">Ponapeanisch</xsl:when>
            <xsl:when test="$trimmedCode='pra'">Prakrit</xsl:when>
            <xsl:when test="$trimmedCode='pro'">Altokzitanisch</xsl:when>
            <xsl:when test="$trimmedCode='ps'">Paschtu</xsl:when>
            <xsl:when test="$trimmedCode='pt'">Portugiesisch</xsl:when>
            <xsl:when test="$trimmedCode='qaa'">Reserviert für lokale Verwendung</xsl:when>
            <xsl:when test="$trimmedCode='qu'">Quechua-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='raj'">Rajasthani</xsl:when>
            <xsl:when test="$trimmedCode='rap'">Osterinsel-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='rar'">Rarotonganisch</xsl:when>
            <xsl:when test="$trimmedCode='rm'">Rätoromanisch</xsl:when>
            <xsl:when test="$trimmedCode='rn'">Rundi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ro'">Rumänisch</xsl:when>
            <xsl:when test="$trimmedCode='roa'">Romanische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='rom'">Romani (Sprache)</xsl:when>
            <xsl:when test="$trimmedCode='ru'">Russisch</xsl:when>
            <xsl:when test="$trimmedCode='rup'">Aromunisch</xsl:when>
            <xsl:when test="$trimmedCode='rw'">Rwanda-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sa'">Sanskrit</xsl:when>
            <xsl:when test="$trimmedCode='sad'">Sandawe-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sah'">Jakutisch</xsl:when>
            <xsl:when test="$trimmedCode='sai'">Indianersprachen, Südamerika (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='sal'">Salish-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sam'">Samaritanisch</xsl:when>
            <xsl:when test="$trimmedCode='sas'">Sasak</xsl:when>
            <xsl:when test="$trimmedCode='sat'">Santali</xsl:when>
            <xsl:when test="$trimmedCode='sc'">Sardisch</xsl:when>
            <xsl:when test="$trimmedCode='scn'">Sizilianisch</xsl:when>
            <xsl:when test="$trimmedCode='sco'">Schottisch</xsl:when>
            <xsl:when test="$trimmedCode='sd'">Sindhi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='se'">Nordsaamisch</xsl:when>
            <xsl:when test="$trimmedCode='sel'">Selkupisch</xsl:when>
            <xsl:when test="$trimmedCode='sem'">Semitische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='sg'">Sango-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sga'">Altirisch</xsl:when>
            <xsl:when test="$trimmedCode='sgn'">Zeichensprachen</xsl:when>
            <xsl:when test="$trimmedCode='shn'">Schan-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='si'">Singhalesisch</xsl:when>
            <xsl:when test="$trimmedCode='sid'">Sidamo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sio'">Sioux-Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='sit'">Sinotibetische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='sk'">Slowakisch</xsl:when>
            <xsl:when test="$trimmedCode='sl'">Slowenisch</xsl:when>
            <xsl:when test="$trimmedCode='sla'">Slawische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='sm'">Samoanisch</xsl:when>
            <xsl:when test="$trimmedCode='sma'">Südsaamisch</xsl:when>
            <xsl:when test="$trimmedCode='smi'">Saamisch</xsl:when>
            <xsl:when test="$trimmedCode='smj'">Lulesaamisch</xsl:when>
            <xsl:when test="$trimmedCode='smn'">Inarisaamisch</xsl:when>
            <xsl:when test="$trimmedCode='sms'">Skoltsaamisch</xsl:when>
            <xsl:when test="$trimmedCode='sn'">Schona-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='snk'">Soninke-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='so'">Somali</xsl:when>
            <xsl:when test="$trimmedCode='sog'">Sogdisch</xsl:when>
            <xsl:when test="$trimmedCode='son'">Songhai-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sq'">Albanisch</xsl:when>
            <xsl:when test="$trimmedCode='sr'">Serbisch</xsl:when>
            <xsl:when test="$trimmedCode='srn'">Sranantongo</xsl:when>
            <xsl:when test="$trimmedCode='srr'">Serer-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ss'">Swasi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ssa'">Nilosaharanische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='st'">Süd-Sotho-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='su'">Sundanesisch</xsl:when>
            <xsl:when test="$trimmedCode='suk'">Sukuma-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='sus'">Susu</xsl:when>
            <xsl:when test="$trimmedCode='sux'">Sumerisch</xsl:when>
            <xsl:when test="$trimmedCode='sv'">Schwedisch</xsl:when>
            <xsl:when test="$trimmedCode='sw'">Swahili</xsl:when>
            <xsl:when test="$trimmedCode='syc'">Syrisch</xsl:when>
            <xsl:when test="$trimmedCode='syr'">Neuostaramäisch</xsl:when>
            <xsl:when test="$trimmedCode='ta'">Tamil</xsl:when>
            <xsl:when test="$trimmedCode='tai'">Thaisprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='te'">Telugu-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tem'">Temne-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ter'">Tereno-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tet'">Tetum-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tg'">Tadschikisch</xsl:when>
            <xsl:when test="$trimmedCode='th'">Thailändisch</xsl:when>
            <xsl:when test="$trimmedCode='ti'">Tigrinja-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tig'">Tigre-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tiv'">Tiv-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tk'">Turkmenisch</xsl:when>
            <xsl:when test="$trimmedCode='tkl'">Tokelauanisch</xsl:when>
            <xsl:when test="$trimmedCode='tl'">Tagalog</xsl:when>
            <xsl:when test="$trimmedCode='tlh'">Klingonisch</xsl:when>
            <xsl:when test="$trimmedCode='tli'">Tlingit-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tmh'">Tamaeq</xsl:when>
            <xsl:when test="$trimmedCode='tn'">Tswana-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='to'">Tongaisch</xsl:when>
            <xsl:when test="$trimmedCode='tog'">Tonga (Bantusprache, Sambia)</xsl:when>
            <xsl:when test="$trimmedCode='tpi'">Neumelanesisch</xsl:when>
            <xsl:when test="$trimmedCode='tr'">Türkisch</xsl:when>
            <xsl:when test="$trimmedCode='ts'">Tsonga-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tsi'">Tsimshian-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tt'">Tatarisch</xsl:when>
            <xsl:when test="$trimmedCode='tum'">Tumbuka-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tup'">Tupi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='tut'">Altaische Sprachen (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='tvl'">Elliceanisch</xsl:when>
            <xsl:when test="$trimmedCode='tw'">Twi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ty'">Tahitisch</xsl:when>
            <xsl:when test="$trimmedCode='tyv'">Tuwinisch</xsl:when>
            <xsl:when test="$trimmedCode='udm'">Udmurtisch</xsl:when>
            <xsl:when test="$trimmedCode='ug'">Uigurisch</xsl:when>
            <xsl:when test="$trimmedCode='uga'">Ugaritisch</xsl:when>
            <xsl:when test="$trimmedCode='uk'">Ukrainisch</xsl:when>
            <xsl:when test="$trimmedCode='umb'">Mbundu-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='und'">Nicht zu entscheiden</xsl:when>
            <xsl:when test="$trimmedCode='ur'">Urdu</xsl:when>
            <xsl:when test="$trimmedCode='uz'">Usbekisch</xsl:when>
            <xsl:when test="$trimmedCode='vai'">Vai-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ve'">Venda-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='vi'">Vietnamesisch</xsl:when>
            <xsl:when test="$trimmedCode='vo'">Volapük</xsl:when>
            <xsl:when test="$trimmedCode='vot'">Wotisch</xsl:when>
            <xsl:when test="$trimmedCode='wa'">Wallonisch</xsl:when>
            <xsl:when test="$trimmedCode='wak'">Wakash-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='wal'">Walamo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='war'">Waray</xsl:when>
            <xsl:when test="$trimmedCode='was'">Washo-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='wen'">Sorbisch (Andere)</xsl:when>
            <xsl:when test="$trimmedCode='wo'">Wolof-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='xal'">Kalmückisch</xsl:when>
            <xsl:when test="$trimmedCode='xh'">Xhosa-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='yao'">Yao-Sprache (Bantusprache)</xsl:when>
            <xsl:when test="$trimmedCode='yap'">Yapesisch</xsl:when>
            <xsl:when test="$trimmedCode='yi'">Jiddisch</xsl:when>
            <xsl:when test="$trimmedCode='yo'">Yoruba-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='ypk'">Ypik-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='za'">Zhuang</xsl:when>
            <xsl:when test="$trimmedCode='zap'">Zapotekisch</xsl:when>
            <xsl:when test="$trimmedCode='zbl'">Bliss-Symbol</xsl:when>
            <xsl:when test="$trimmedCode='zen'">Zenaga</xsl:when>
            <xsl:when test="$trimmedCode='zgh'">Tamazight</xsl:when>
            <xsl:when test="$trimmedCode='zh'">Chinesisch</xsl:when>
            <xsl:when test="$trimmedCode='znd'">Zande-Sprachen</xsl:when>
            <xsl:when test="$trimmedCode='zu'">Zulu-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='zun'">Zuñi-Sprache</xsl:when>
            <xsl:when test="$trimmedCode='zxx'">Kein linguistischer Inhalt</xsl:when>
            <xsl:when test="$trimmedCode='zza'">Zazaki</xsl:when>
            <xsl:otherwise>unbekannter Code (<xsl:value-of select="$trimmedCode" />)</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    


  <!--  Bottomline (additional information to the document)  -->
  <xsl:template name="bottomline">

  <!-- responsible contact (Fachlicher Ansprechpartner) -->
  <xsl:for-each select="/n1:ClinicalDocument/n1:participant">
    <xsl:if test="@typeCode = 'CALLBCK' and not(n1:functionCode/@code) and n1:associatedEntity/@classCode= 'PROV' ">
        <xsl:call-template name="participantIdentification">
          <xsl:with-param name="typecode" select="@typeCode"/>
          <xsl:with-param name="functioncode" select="n1:functionCode/@code"/>
          <xsl:with-param name="classcode" select="n1:associatedEntity/@classCode"/>
          <xsl:with-param name="participant" select="." />
        </xsl:call-template>
      <div class="responsibleContact" id="IDResponsibleContact">
        <div class="responsibleContactAddress">
          <p class="organisationName">
            <xsl:call-template name="getName">
              <xsl:with-param name="name" select="n1:associatedEntity/n1:associatedPerson/n1:name"/>
            </xsl:call-template>
          </p>
      <xsl:call-template name="getContactInfo">
            <xsl:with-param name="contact" select="n1:associatedEntity"/>
          </xsl:call-template>
          <xsl:call-template name="getOrganization">
            <xsl:with-param name="organization" select="n1:associatedEntity/n1:scopingOrganization"/>
          </xsl:call-template>
        </div>
      </div>
    </xsl:if>
  </xsl:for-each>

<!-- start unterzeichnet von -->
<xsl:if test="/n1:ClinicalDocument/n1:legalAuthenticator">
  <xsl:call-template name="renderAuthenticatorContainer">
    <xsl:with-param name="node" select="/n1:ClinicalDocument/n1:legalAuthenticator" />
    <xsl:with-param name="title"><xsl:text>Unterzeichnet von:</xsl:text></xsl:with-param>
  </xsl:call-template>
</xsl:if>
<!-- end unterzeichnet von -->

<!-- start weitere unterzeichner -->
<xsl:variable name="authenticatorTitle">
  <xsl:choose>
    <xsl:when test="//n1:ClinicalDocument/n1:code/@code='11502-2' or //n1:ClinicalDocument/n1:code/@code='18725-2'">
      <xsl:text>Validiert durch:</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>Unterzeichnet von:</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:for-each select="/n1:ClinicalDocument/n1:authenticator">
  <xsl:call-template name="renderAuthenticatorContainer">
    <xsl:with-param name="node" select="." />
    <xsl:with-param name="title" select="$authenticatorTitle" />
  </xsl:call-template>
</xsl:for-each>
<!-- end weitere unterzeichner -->

  <!--
  additional information about the document
  -->
  <div class="bottomline">
    <div class="collapseTrigger" onclick="toggleCollapseable(this);" id="IDBottomline">
      <xsl:call-template name="collapseTrigger"/>
      <h1><xsl:text>Zusätzliche Informationen über dieses Dokument</xsl:text></h1>
      <div class="clearer"></div>
    </div>
    <div class="bottomline_data collapsable">
      <xsl:for-each select="/n1:ClinicalDocument/n1:author">
        <div class="element" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
          <xsl:call-template name="collapseTrigger"/>
          <div class="leftsmall">
            <h2>
              <xsl:choose>
                <xsl:when test="n1:assignedAuthor/n1:assignedAuthoringDevice/n1:manufacturerModelName or
                  n1:assignedAuthor/n1:assignedAuthoringDevice/n1:softwareName">
                  <xsl:text>Erzeugt mit:</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>Dokumentverfasser(in):</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </h2>
            <p class="date">
              <xsl:call-template name="formatDate">
                <xsl:with-param name="date" select="n1:time"/>
              </xsl:call-template>
            </p>
          </div>
          <div class="leftwide">
            <p class="organisationName">
              <xsl:if test="n1:assignedAuthor/n1:assignedPerson/n1:name">
                <xsl:call-template name="getName">
                  <xsl:with-param name="name" select="n1:assignedAuthor/n1:assignedPerson/n1:name"/>
                </xsl:call-template>
              </xsl:if>
            </p>

            <xsl:if test="n1:functionCode or n1:assignedAuthor/n1:code">
              <p class="telecom">
                <xsl:call-template name="getELGAAuthorSpeciality">
                  <xsl:with-param name="code" select="n1:assignedAuthor/n1:code/@code"/>
                </xsl:call-template>
                <xsl:if test="n1:functionCode/@displayName">
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="n1:functionCode/@displayName" />
                  <xsl:text>)</xsl:text>
                </xsl:if>
              </p>
            </xsl:if>
            
            <xsl:if test="n1:assignedAuthor/n1:telecom">
              <xsl:call-template name="getContactInfo">
                <xsl:with-param name="contact" select="n1:assignedAuthor"/>
              </xsl:call-template>
            </xsl:if>
            
            <xsl:if test="n1:assignedAuthor/n1:assignedAuthoringDevice/n1:manufacturerModelName">
              <p class="organisationName">
                Hersteller/Gerät: <xsl:value-of select="n1:assignedAuthor/n1:assignedAuthoringDevice/n1:manufacturerModelName"/>
              </p>
            </xsl:if>
            
            <xsl:if test="n1:assignedAuthor/n1:assignedAuthoringDevice/n1:softwareName">
              <p class="organisationName">
                Software: <xsl:value-of select="n1:assignedAuthor/n1:assignedAuthoringDevice/n1:softwareName"/>
              </p>
            </xsl:if>            
            
            <p class="organisationName">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="n1:assignedAuthor/n1:representedOrganization/n1:name"/>
              </xsl:call-template>
            </p>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="n1:assignedAuthor/n1:representedOrganization"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="clearer"></div>
        </div>
      </xsl:for-each>
      <xsl:for-each select="/n1:ClinicalDocument/n1:informant">
        <div class="element" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
          <xsl:call-template name="collapseTrigger"/>
          <div class="leftsmall">
            <h2><xsl:text>Informiert</xsl:text></h2>
          </div>
          <div class="leftwide">
            <xsl:if test="n1:assignedEntity/n1:assignedPerson|n1:relatedEntity/n1:relatedPerson">
              <p class="organisationName">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name|n1:relatedEntity/n1:relatedPerson/n1:name"/>
              </xsl:call-template>
              <xsl:if test="n1:relatedEntity/n1:code">
                <xsl:text> (</xsl:text>
                <xsl:call-template name="translateCode">
                  <xsl:with-param name="code" select="n1:relatedEntity/n1:code"/>
                </xsl:call-template>
                <xsl:text>)</xsl:text>
              </xsl:if>
              </p>
            </xsl:if>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="n1:assignedEntity|n1:relatedEntity"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="clearer"></div>
        </div>
      </xsl:for-each>
      <xsl:for-each select="/n1:ClinicalDocument/n1:authenticator">
        <div class="element" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
          <xsl:call-template name="collapseTrigger"/>
          <div class="leftsmall">
            <h2><xsl:text>Validiert durch</xsl:text></h2>
            <p class="date">
              <xsl:call-template name="formatDate">
                <xsl:with-param name="date" select="n1:time"/>
              </xsl:call-template>
            </p>
          </div>
          <div class="leftwide">
            <p class="organisationName">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
              </xsl:call-template>
            </p>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="n1:assignedEntity"/>
            </xsl:call-template>
            <xsl:if test="n1:assignedEntity/n1:representedOrganization">
            <xsl:call-template name="getOrganization">
              <xsl:with-param name="organization" select="n1:assignedEntity/n1:representedOrganization"/>
            </xsl:call-template>
            </xsl:if>
          </div>
        </div>
        <div class="clearer"></div>
        </div>
      </xsl:for-each>

      <xsl:for-each select="/n1:ClinicalDocument/n1:dataEnterer">
        <div class="element" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
          <xsl:call-template name="collapseTrigger"/>
          <div class="leftsmall">
            <h2><xsl:text>Eingegeben von</xsl:text></h2>
            <p class="date">
              <xsl:call-template name="formatDate">
                <xsl:with-param name="date" select="n1:time"/>
              </xsl:call-template>
            </p>
          </div>
          <div class="leftwide">
            <p class="organisationName">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
              </xsl:call-template>
            </p>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="n1:assignedEntity"/>
            </xsl:call-template>
            <xsl:if test="n1:assignedEntity/n1:representedOrganization">
            <xsl:call-template name="getOrganization">
              <xsl:with-param name="organization" select="n1:assignedEntity/n1:representedOrganization"/>
            </xsl:call-template>
            </xsl:if>
          </div>
        </div>
        <div class="clearer"></div>
        </div>
      </xsl:for-each>
      <xsl:for-each select="/n1:ClinicalDocument/n1:informationRecipient">
        <div class="element" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
          <xsl:call-template name="collapseTrigger"/>
          <div class="leftsmall">
            <h2><xsl:text>Kopie an </xsl:text>
              <xsl:choose>
                <xsl:when test="not(@typeCode) or @typeCode != 'TRC'">
                  <span class="lighter">(primär)</span>
                </xsl:when>
                <xsl:otherwise>
                  <span class="lighter">(sekundär)</span>
                </xsl:otherwise>
              </xsl:choose>
            </h2>
          </div>
          <div class="leftwide">
            <p class="organisationName">
            <xsl:if test="n1:intendedRecipient/n1:informationRecipient">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="n1:intendedRecipient/n1:informationRecipient/n1:name"/>
              </xsl:call-template>
              <xsl:if test="n1:intendedRecipient/n1:receivedOrganization">
                <br/>
                <xsl:value-of select="n1:intendedRecipient/n1:receivedOrganization/n1:name"/>
              </xsl:if>
            </xsl:if>
            </p>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="n1:intendedRecipient/n1:receivedOrganization"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="clearer"></div>
        </div>
      </xsl:for-each>

      <xsl:for-each select="/n1:ClinicalDocument/n1:participant">
        <!-- do not show signee and responsible contact again -->
        <xsl:if test="not(@typeCode = 'CALLBCK' and not(n1:functionCode/@code) and n1:associatedEntity/@classCode= 'PROV') ">

          <xsl:variable name="showFunctionCode">
            <xsl:if test="@typeCode = 'CON' and n1:associatedEntity/@classCode= 'PROV'">
              <!-- different layout for "weitere behandler" -->
              <xsl:value-of select="1" />
            </xsl:if>
          </xsl:variable>

          <xsl:call-template name="bottomlineElement" >
            <xsl:with-param name="participant" select="." />
            <xsl:with-param name="showFunctionCode" select="$showFunctionCode" />
          </xsl:call-template>

        </xsl:if>
      </xsl:for-each>

      <div class="element" onclick="toggleCollapseable(this);">
      <div class="bottomlineCollapseable">
          <xsl:call-template name="collapseTrigger"/>
          <div class="leftsmall">
              <h2><xsl:text>Verwahrer des Dokuments</xsl:text></h2>
          </div>
          <div class="leftwide">
            <p class="organisationName">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"/>
              </xsl:call-template>
            </p>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization"/>
            </xsl:call-template>
          </div>
      </div>
      <div class="clearer"></div>
      </div>
      
      
      <xsl:if test="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:code/@code='KASSEN' or 
      				/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:code/@code='PRIVAT' or 
      				/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:code/@code='SUBST'">
        <div class="element" style="cursor: default;" onclick="toggleCollapseable(this);">
          <div class="bottomlineCollapseable">
            <div class="leftsmall" style="padding-left: 3em; display: block">
              <h2>
                  <xsl:call-template name="getELGAMedikationRezeptart">
                      <xsl:with-param name="code" select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:code/@code" />
                  </xsl:call-template>
                  <xsl:text> gültig bis</xsl:text>
              </h2>
            </div>
            <div class="leftwide">
              <div class="address" style="display: block;">
		  	    <xsl:call-template name="formatDate">
			      <xsl:with-param name="date" select="*/n1:serviceEvent/n1:effectiveTime/n1:high" />
				  <xsl:with-param name="date_shortmode">false</xsl:with-param>
			    </xsl:call-template>
              </div>
            </div>
          </div>
          <div class="clearer"></div>
        </div>      
      </xsl:if>

      <div class="element" style="cursor: default;" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
          <div class="leftsmall" style="padding-left: 3em; display: block">
            <h2><xsl:text>Schlagwörter (Services)</xsl:text></h2>
          </div>
          <div class="leftwide">
            <div class="address" style="display: block;">
              <xsl:call-template name="getServiceEvents" />
            </div>
          </div>
        </div>
        <div class="clearer"></div>
      </div>
      
      <div class="element" onclick="toggleCollapseable(this);">
        <div class="bottomlineCollapseable">
            <xsl:call-template name="collapseTrigger"/>
            <div class="leftsmall">
                <h2><xsl:text>Dokumentinformation</xsl:text></h2>
            </div>
            <div class="leftwide">
              <div class="telecom">
               <xsl:call-template name="getDocumentInformation" />
              </div>
            </div>
        </div>
        <div class="clearer"></div>
      </div>

    </div>
  </div>
  </xsl:template>

  <!--
  Element for participants shown in additional information of document
  -->
  <xsl:template name="bottomlineElement">
    <xsl:param name="participant" />
    <xsl:param name="showFunctionCode" select="0" />

    <div class="element" onclick="toggleCollapseable(this);">
      <div class="bottomlineCollapseable">
        <xsl:call-template name="collapseTrigger"/>
        <div class="leftsmall">
          <xsl:call-template name="participantIdentification">
            <xsl:with-param name="participant" select="$participant" />
          </xsl:call-template>
        </div>
        <div class="leftwide">
          <p class="organisationName">
          <!-- different insurance person -->
          <xsl:variable name="typecode" select="$participant/@typeCode" />
          <xsl:variable name="classcode" select="$participant/n1:associatedEntity/@classCode" />
          <xsl:variable name="code" select="$participant/n1:associatedEntity/n1:code/@code" />

          <xsl:if test="$typecode = 'HLD' and $classcode = 'POLHOLD' and $code = 'SELF'">
            <xsl:text>Versichert bei: </xsl:text>
          </xsl:if>
          <xsl:if test="$typecode = 'HLD' and $classcode = 'POLHOLD' and $code = 'FAMDEP'">
            <xsl:text>Mitversichert bei: </xsl:text>
          </xsl:if>
          <xsl:call-template name="getName">
            <xsl:with-param name="name" select="n1:associatedEntity/n1:associatedPerson/n1:name"/>
          </xsl:call-template>
          <!-- if urgency contact display relationship -->
          <xsl:if test="@typeCode = 'IND' and not(n1:functionCode/@code) and n1:associatedEntity/@classCode= 'ECON' ">
            <span class="relationship"><xsl:text> (</xsl:text>
            <xsl:call-template name="getELGAPersonalRelationship" >
              <xsl:with-param name="participant" select="$participant" />
            </xsl:call-template>
            <xsl:text>)</xsl:text></span>
            </xsl:if>
          </p>
          <xsl:if test="$showFunctionCode='1'">
            <xsl:if test="n1:functionCode">
              <p class="organisationName">
                <xsl:call-template name="getELGAAuthorSpeciality">
                  <xsl:with-param name="code" select="n1:functionCode/@code"/>
                </xsl:call-template>
              </p>
            </xsl:if>
          </xsl:if>
          <xsl:call-template name="getContactInfo">
            <xsl:with-param name="contact" select="n1:associatedEntity"/>
          </xsl:call-template>
          <xsl:if test="n1:associatedEntity/n1:scopingOrganization">
            <xsl:call-template name="getOrganization">
            <xsl:with-param name="organization" select="n1:associatedEntity/n1:scopingOrganization"/>
          </xsl:call-template>
          </xsl:if>
        </div>
        <div class="clearer"></div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="getDocumentInformation">
    <p class="subtitle_create">
      <xsl:call-template name="getHL7ATXDSDokumentenklassen">
        <xsl:with-param name="code" select="/n1:ClinicalDocument/n1:code/@code" />
      </xsl:call-template>
    </p>
    <p class="subtitle_create">
      <xsl:text>Dokument erzeugt am </xsl:text>
      <xsl:call-template name="formatDate">
        <xsl:with-param name="date" select="/n1:ClinicalDocument/n1:effectiveTime" />
        <xsl:with-param name="date_shortmode">false</xsl:with-param>
      </xsl:call-template>
    </p>
    <xsl:choose>
      <xsl:when test="*/n1:serviceEvent/n1:effectiveTime/n1:low/@value != '' and */n1:serviceEvent/n1:effectiveTime/n1:high/@value != ''">
        <p class="subtitle_create">
          <xsl:text>Leistungszeitraum von </xsl:text>
          <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="*/n1:serviceEvent/n1:effectiveTime/n1:low" />
            <xsl:with-param name="date_shortmode">false</xsl:with-param>
          </xsl:call-template><xsl:text> bis </xsl:text>
          <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="*/n1:serviceEvent/n1:effectiveTime/n1:high" />
            <xsl:with-param name="date_shortmode">false</xsl:with-param>
          </xsl:call-template>
        </p>
      </xsl:when>
      <xsl:when test="*/n1:serviceEvent/n1:effectiveTime/n1:low/@value != ''">
        <p class="subtitle_create">
          <xsl:text>Beginn der Leistung: </xsl:text>
          <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="*/n1:serviceEvent/n1:effectiveTime/n1:low" />
            <xsl:with-param name="date_shortmode">false</xsl:with-param>
          </xsl:call-template>
        </p>
      </xsl:when>
      <xsl:when test="*/n1:serviceEvent/n1:effectiveTime/n1:high/@value != ''">
        <p class="subtitle_create">
          <xsl:text>Ende der Leistung: </xsl:text>
          <xsl:call-template name="formatDate">
            <xsl:with-param name="date" select="*/n1:serviceEvent/n1:effectiveTime/n1:high" />
            <xsl:with-param name="date_shortmode">false</xsl:with-param>
          </xsl:call-template>
        </p>
      </xsl:when>
      <xsl:otherwise>
        <p class="subtitle_create">Leistungszeitraum nicht angegeben</p>
      </xsl:otherwise>
    </xsl:choose>
    <p class="subtitle_create"><xsl:text>Dokument-ID: </xsl:text>{<xsl:value-of select="/n1:ClinicalDocument/n1:id/@root" />}&#160;<xsl:value-of select="/n1:ClinicalDocument/n1:id/@extension" /></p>
    <p class="subtitle_create">
      <xsl:text>Set ID: </xsl:text>
      <xsl:choose>
        <xsl:when test="/n1:ClinicalDocument/n1:setId/@root">
          {<xsl:value-of select="/n1:ClinicalDocument/n1:setId/@root" />}
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>unbekannt</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text> </xsl:text>
      <xsl:if test="/n1:ClinicalDocument/n1:setId/@extension">
        <xsl:value-of select="/n1:ClinicalDocument/n1:setId/@extension" />
      </xsl:if>
    </p>
    <p class="subtitle_create">
      <xsl:text>Dokumentversion: </xsl:text><xsl:value-of select="/n1:ClinicalDocument/n1:versionNumber/@value" />
    </p>
    <p class="subtitle_create"><xsl:text>Angezeigt mit </xsl:text><xsl:value-of select="document('')/xsl:stylesheet/@id" /></p>
    <p class="subtitle_create"><xsl:text>Dieses Dokument entspricht den Vorgaben von: </xsl:text>
      <xsl:call-template name="getNameFromOID" /><xsl:text>; ELGA Interoperabilitätsstufe: </xsl:text><xsl:call-template name="getEISFromOID" />
    </p>
    <p class="subtitle_create">
      <xsl:variable name="params">
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">showrevisionmarks</xsl:with-param>
          <xsl:with-param name="paramValue" select="$showrevisionmarks" />
          <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">isStrictModeDisabled</xsl:with-param>
          <xsl:with-param name="paramValue" select="$isStrictModeDisabled" />
          <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">hideheader</xsl:with-param>
          <xsl:with-param name="paramValue" select="$hideheader" />
          <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">useexternalcss</xsl:with-param>
          <xsl:with-param name="paramValue" select="$useexternalcss" />
          <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">externalcssname</xsl:with-param>
          <xsl:with-param name="paramValue" select="$externalcssname" />
          <xsl:with-param name="paramDefaultValue"/>
        </xsl:call-template>
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">printiconvisibility</xsl:with-param>
          <xsl:with-param name="paramValue" select="$printiconvisibility" />
          <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="renderParamWithValue">
          <xsl:with-param name="paramName">isdeprecated</xsl:with-param>
          <xsl:with-param name="paramValue" select="$isdeprecated" />
          <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
        </xsl:call-template>
<xsl:call-template name="renderParamWithValue">
    <xsl:with-param name="paramName">showTableInBestGuess</xsl:with-param>
    <xsl:with-param name="paramValue" select="$showTableInBestGuess" />
    <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="renderParamWithValue">
    <xsl:with-param name="paramName">enableInfoButton</xsl:with-param>
    <xsl:with-param name="paramValue" select="$enableInfoButton" />
    <xsl:with-param name="paramDefaultValue">0</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="renderParamWithValue">
    <xsl:with-param name="paramName">LOINCResolutionUrl</xsl:with-param>
    <xsl:with-param name="paramValue" select="$LOINCResolutionUrl" />
    <xsl:with-param name="paramDefaultValue" select="'https://www.gesundheit.gv.at/linkaufloesung/applikation-flow?quelle=GHP&amp;flow=LO&amp;leistung=LA-GP-LO-'" />
</xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="$params != ''">
          <xsl:text>Dieses Dokument wurde mit folgenden Einstellungen erstellt: </xsl:text>
          <xsl:value-of select="substring($params, 1, string-length($params) - 2)" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>Dieses Dokument wurde mit den Standard-Einstellungen erstellt.</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:template>

  <xsl:template name="renderParamWithValue">
    <xsl:param name="paramName" />
    <xsl:param name="paramValue" />
    <xsl:param name="paramDefaultValue" />

    <xsl:if test="$paramValue != $paramDefaultValue">
      <xsl:value-of select="$paramName" />
      <xsl:text>: </xsl:text>
      <xsl:value-of select="$paramValue" />
      <xsl:text>, </xsl:text>
    </xsl:if>

  </xsl:template>

  <!--
  collapse triggers [+] [-] for document
  -->
  <xsl:template name="collapseTrigger">
    <span class="collapseLinks tooltipTrigger">
      <a class="collapseHide" href="#" onclick="return false;">
        <span class="tooltip">einklappen</span>
      </a>
      <a class="collapseShow" href="#" onclick="return false;">
        <span class="tooltip">ausklappen</span>
      </a>
    </span>
  </xsl:template>

  <xsl:template name="getPatientInformationData">
    <xsl:param name="sexName" />
    <xsl:param name="birthdate_long" />
    <xsl:param name="svnnumber" />
    <div class="data">
      <div class="leftsmall">
        <h2><xsl:text>Allgemeine Daten</xsl:text></h2>
      </div>
      <div class="leftwide">
        <table cellpadding="0" cellspacing="0">
          <tr>
            <td width="200px" class="firstrow"><xsl:text>Geschlecht</xsl:text></td>
            <td><xsl:value-of select="$sexName" /></td>
          </tr>

          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[@qualifier='SP']">
          <tr>
            <td class="firstrow"><xsl:text>Name vor Heirat</xsl:text></td>
            <td>
              <xsl:call-template name="renderListItems">
                <xsl:with-param name="list" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[@qualifier='SP']" />
              </xsl:call-template>
            </td>
          </tr>
          </xsl:if>
          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[@qualifier='AD']">
          <tr>
            <td class="firstrow"><xsl:text>Name vor Adoption</xsl:text></td>
            <td>
              <xsl:call-template name="renderListItems">
                <xsl:with-param name="list" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[@qualifier='AD']" />
              </xsl:call-template>
            </td>
          </tr>
          </xsl:if>
          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[@qualifier='BR']">
          <tr>
            <td class="firstrow"><xsl:text>Geburtsname</xsl:text></td>
            <td>
              <xsl:call-template name="renderListItems">
                <xsl:with-param name="list" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[@qualifier='BR']" />
              </xsl:call-template>
            </td>
          </tr>
          </xsl:if>

          <tr>
            <td class="firstrow"><xsl:text>Geburtsdatum</xsl:text></td>
            <td><xsl:value-of select="$birthdate_long" /></td>
          </tr>
          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthplace/n1:place/n1:addr">
          <tr>
            <td class="firstrow"><xsl:text>Geburtsort</xsl:text></td>
            <td>
              <xsl:apply-templates select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthplace/n1:place/n1:addr"/>
            </td>
          </tr>
          </xsl:if>
          <tr>
            <td class="firstrow"><xsl:text>SV-Nr</xsl:text></td>
            <td><xsl:value-of select="$svnnumber"/></td>
          </tr>
          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode">
          <tr>
            <td class="firstrow"><xsl:text>Familienstand</xsl:text></td>
            <td>
              <xsl:call-template name="getELGAMaritalStatus">
                <xsl:with-param name="code" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code" />
              </xsl:call-template>
            </td>
          </tr>
          </xsl:if>
          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:religiousAffiliationCode">
          <tr>
            <td class="firstrow"><xsl:text>Religionsgemeinschaft</xsl:text></td>
            <td>
              <xsl:call-template name="getELGAReligiousAffiliation">
                <xsl:with-param name="religiousAffiliation" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:religiousAffiliationCode" />
              </xsl:call-template>
            </td>
          </tr>
          </xsl:if>
          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:languageCommunication">
            <tr class="spacer">
              <td class="firstrow"><xsl:text>Gesprochene Sprachen</xsl:text></td>
              <td>
                <xsl:call-template name="getLanguageAbility">
                  <xsl:with-param name="patient" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient" />
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>

          <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:telecom">
            <!-- add empty table row as a spacer -->
            <tr class="spacer">
              <td />
              <td />
            </tr>
            <xsl:call-template name="getContactTelecomTable">
              <xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole"/>
            </xsl:call-template>
          </xsl:if>

        </table>
      </div>
      <div class="clearer"></div>
    </div>
  </xsl:template>

  <xsl:template name="getPatientAdress">
    <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr">
      <div class="addresses">
        <div class="leftsmall">
          <h2><xsl:text>Bekannte Adresse(n)</xsl:text></h2>
        </div>
        <div class="leftwide">
          <xsl:call-template name="getContactAddress">
            <xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole"/>
          </xsl:call-template>
        </div>
        <div class="clearer"></div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getPatientGuardian">
    <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian">
      <div class="guardian">
        <div class="leftsmall">
          <h2><xsl:text>Gesetzlicher Vertreter: Erwachsenenvertreter, Vormund, Obsorgeberechtigter</xsl:text></h2>
        </div>
        <div class="leftwide">
          <xsl:apply-templates select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian"/>
        </div>
        <div class="clearer"></div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getPatientStay">
    <xsl:if test="/n1:ClinicalDocument/n1:componentOf">
      <div class="collapsableStay" id="IDCollapseableStay">
      <h2>
        <xsl:call-template name="getEncounter" />
      </h2>
      <xsl:if test="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:id/@extension != ''">
        <div class="az">
          <p>
            <xsl:call-template name="getAmbulatory">
            <xsl:with-param name="code" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:code" />
            <xsl:with-param name="effectiveTime" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:effectiveTime" />
      <xsl:with-param name="date_shortmode">false</xsl:with-param>
            </xsl:call-template>
          </p>
          <p>
            <xsl:call-template name="getEncounterCaseNumber" />
            <xsl:apply-templates select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:id/@extension"/>
          </p>
        </div>
        </xsl:if>
        <div class="leftsmall">
          <xsl:call-template name="getOrganization">
            <xsl:with-param name="organization" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization "/>
          </xsl:call-template>
        </div>
        <div class="leftwide">
          <xsl:if test="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:responsibleParty/n1:assignedEntity">
            <p class="medic"><xsl:text>Verantwortliche Person</xsl:text></p>
            <p class="medicName">
              <xsl:call-template name="getName">
                <xsl:with-param name="name" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:responsibleParty/n1:assignedEntity/n1:assignedPerson/n1:name"/>
              </xsl:call-template>
            </p>
            <xsl:call-template name="getContactInfo">
              <xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/n1:responsibleParty/n1:assignedEntity"/>
            </xsl:call-template>
          </xsl:if>
        </div>
        <div class="clearer"></div>
      </div>
    </xsl:if>
  </xsl:template>

 <!--
  code translations for participants
    most common used in bottom section of document for additional information
  includes tooltips
  -->
  <xsl:template name="participantIdentification">
    <xsl:param name="participant" />
    <xsl:variable name="typecode" select="$participant/@typeCode" />
    <xsl:variable name="functioncode" select="$participant/n1:functionCode/@code" />
    <xsl:variable name="classcode" select="$participant/n1:associatedEntity/@classCode" />
    <xsl:variable name="signaturecode" select="$participant/*/n1:signatureCode/@code" />
    <xsl:variable name="code" select="$participant/n1:associatedEntity/n1:code/@code" />

    <xsl:choose>
      <xsl:when test="$typecode = 'RCT'"><h2 class="tooltipTrigger"><xsl:value-of select="$genderedpatient"/><span class="tooltip"><xsl:value-of select="$genderedpatient"/></span></h2></xsl:when>
      <xsl:when test="$typecode = 'AUT'"><h2 class="tooltipTrigger">Verfasser des Dokuments<span class="tooltip">Autor</span></h2></xsl:when>
      <xsl:when test="$typecode = 'ENT'"><h2 class="tooltipTrigger">Schreibkraft<span class="tooltip">Schreibkraft</span></h2></xsl:when>
      <xsl:when test="$typecode = 'CST'"><h2 class="tooltipTrigger">Originaldokument ist verfügbar bei<span class="tooltip">Gibt die Organisation an, die das originale Befunddokument verwahrt.</span></h2></xsl:when>
      <xsl:when test="$typecode = 'INF'"><h2 class="tooltipTrigger">Auskunftsperson zum Patienten<span class="tooltip">Person, die weitere Informationen über den Patienten geben kann</span></h2></xsl:when>
      <xsl:when test="$typecode = 'PRCP'"><h2 class="tooltipTrigger">An:<span class="tooltip">Empfänger des Dokuments</span></h2></xsl:when>
      <xsl:when test="$typecode = 'TRC'"><h2 class="tooltipTrigger">In Kopie an:<span class="tooltip">Weitere Empfänger des Dokuments</span></h2></xsl:when>
      <xsl:when test="$typecode = 'LA'"><h2 class="tooltipTrigger">Unterzeichner(in)<span class="tooltip">Person, die das Dokument unterzeichnet hat</span></h2></xsl:when>
      <xsl:when test="$typecode = 'LA' and $signaturecode='S'"><h2>Unterzeichner(in)</h2></xsl:when>
      <xsl:when test="$typecode = 'AUTHEN'"><h2 class="tooltipTrigger">Weitere Unterzeichner<span class="tooltip">Weitere Personen, die das Dokument unterzeichnet haben.</span></h2></xsl:when>
      <xsl:when test="$typecode = 'AUTHEN' and $signaturecode='S'"><h2>Weitere Unterzeichner</h2></xsl:when>
      <xsl:when test="$typecode = 'CALLBCK'"><h2 class="tooltipTrigger">Für Fragen kontaktieren Sie bitte:<span class="tooltip">Fachliche(r) Ansprechpartner(in) für dieses Dokument</span></h2></xsl:when>
      <xsl:when test="$typecode = 'REF'"><h2>Zuweiser(in)</h2></xsl:when>
      <xsl:when test="$typecode = 'REF' and $functioncode = 'ADMPHYS'"><h2>Einweisende(r)/Zuweisende(r) Arzt/Ärztin</h2></xsl:when>
      <xsl:when test="$typecode = 'IND'">
        <xsl:choose>
          <xsl:when test="$typecode = 'IND' and $functioncode = 'PCP'"><h2>Hausarzt/Hausärztin</h2></xsl:when>
          <xsl:when test="$typecode = 'IND' and $classcode = 'ECON'"><h2 class="tooltipTrigger">Notfall-Kontakt<span class="tooltip">Auskunftsberechtigte Person</span></h2></xsl:when>
          <xsl:when test="$typecode = 'IND' and $classcode = 'CAREGIVER'"><h2>Betreuende Organisation</h2></xsl:when>
          <xsl:when test="$typecode = 'IND' and $classcode = 'PRS'">
            <h2>
	      Angehörige(r)
              <xsl:call-template name="getELGAPersonalRelationship" >
                <xsl:with-param name="participant" select="$participant" />
              </xsl:call-template>
            </h2>
          </xsl:when>
          <xsl:otherwise><h2>Weitere Beteiligte</h2></xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$typecode = 'HLD' and $classcode = 'POLHOLD' and $code = 'SELF'"><h2>Versicherungsinhaber(in) und Versicherungsgesellschaft</h2></xsl:when>
      <xsl:when test="$typecode = 'HLD' and $classcode = 'POLHOLD' and $code = 'FAMDEP'"><h2>Versicherungsinhaber(in) und Versicherungsgesellschaft</h2></xsl:when>
      <xsl:when test="$typecode = 'CON' and $classcode = 'PROV'"><h2>Weitere Behandler</h2></xsl:when>
      <xsl:otherwise>-</xsl:otherwise>
    </xsl:choose>
  </xsl:template>




    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAPersonalRelationship">
        <xsl:param name="participant" />
        
        <xsl:variable name="code"><xsl:value-of select="$participant/*/n1:code/@code"/></xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$code='FAMMEMB'">Familienmitglied</xsl:when>
            <xsl:when test="$code='SPS'">Ehepartner</xsl:when>
            <xsl:when test="$code='HUSB'">Ehemann</xsl:when>
            <xsl:when test="$code='WIFE'">Ehefrau</xsl:when>
            <xsl:when test="$code='PRN'">Elternteil</xsl:when>
            <xsl:when test="$code='FTH'">Vater</xsl:when>
            <xsl:when test="$code='MTH'">Mutter</xsl:when>
            <xsl:when test="$code='NPRN'">leibliches Elternteil</xsl:when>
            <xsl:when test="$code='NFTH'">leiblicher Vater</xsl:when>
            <xsl:when test="$code='NMTH'">leibliche Mutther</xsl:when>
            <xsl:when test="$code='PRNINLAW'">Schwiegereltern</xsl:when>
            <xsl:when test="$code='FTHINLAW'">Schwiegervater</xsl:when>
            <xsl:when test="$code='MTHINLAW'">Schwiegermutter</xsl:when>
            <xsl:when test="$code='STPPRN'">Stiefelternteil</xsl:when>
            <xsl:when test="$code='STPFTH'">Stiefvater</xsl:when>
            <xsl:when test="$code='STPMTH'">Stiefmutter</xsl:when>
            <xsl:when test="$code='SIB'">Geschwister</xsl:when>
            <xsl:when test="$code='BRO'">Bruder</xsl:when>
            <xsl:when test="$code='SIS'">Schwester</xsl:when>
            <xsl:when test="$code='HSIB'">Halbgeschwister</xsl:when>
            <xsl:when test="$code='HBRO'">Halbbruder</xsl:when>
            <xsl:when test="$code='HSIS'">Halbschwester</xsl:when>
            <xsl:when test="$code='NSIB'">leibliche Geschwister</xsl:when>
            <xsl:when test="$code='NBRO'">leiblicher Bruder</xsl:when>
            <xsl:when test="$code='NSIS'">leibliche Schwester</xsl:when>
            <xsl:when test="$code='SIBINLAW'">Schwager/ Schwägerin</xsl:when>
            <xsl:when test="$code='BROINLAW'">Schwager</xsl:when>
            <xsl:when test="$code='SISINLAW'">Schwägerin</xsl:when>
            <xsl:when test="$code='STPSIB'">Stiefgeschwister</xsl:when>
            <xsl:when test="$code='STPBRO'">Stiefbruder</xsl:when>
            <xsl:when test="$code='STPSIS'">Stiefschwester</xsl:when>
            <xsl:when test="$code='CHILD'">Kind</xsl:when>
            <xsl:when test="$code='NCHILD'">leibliches Kind</xsl:when>
            <xsl:when test="$code='CHLDADOPT'">Adoptivkind</xsl:when>
            <xsl:when test="$code='CHLDFOST'">Pflegekind</xsl:when>
            <xsl:when test="$code='CHLDINLAW'">Schwiegerkind</xsl:when>
            <xsl:when test="$code='STPCHLD'">Stiefkind</xsl:when>
            <xsl:when test="$code='DAUC'">Tochter</xsl:when>
            <xsl:when test="$code='DAU'">leibliche Tochter</xsl:when>
            <xsl:when test="$code='DAUADOPT'">Adoptivtocher</xsl:when>
            <xsl:when test="$code='DAUFOST'">Pflegetochter</xsl:when>
            <xsl:when test="$code='DAUINLAW'">Schwiegertochter</xsl:when>
            <xsl:when test="$code='STPDAU'">Stieftochter</xsl:when>
            <xsl:when test="$code='SONC'">Sohn</xsl:when>
            <xsl:when test="$code='SON'">leiblicher Sohn</xsl:when>
            <xsl:when test="$code='SONADOPT'">Adoptivsohn</xsl:when>
            <xsl:when test="$code='SONFOST'">Pflegesohn</xsl:when>
            <xsl:when test="$code='SONINLAW'">Schwiegersohn</xsl:when>
            <xsl:when test="$code='STPSON'">Stiefsohn</xsl:when>
            <xsl:when test="$code='GRPRN'">Großelternteil</xsl:when>
            <xsl:when test="$code='GRFTH'">Großvater</xsl:when>
            <xsl:when test="$code='GRMTH'">Großmutter</xsl:when>
            <xsl:when test="$code='GGRPRN'">Urgroßelternteil</xsl:when>
            <xsl:when test="$code='GGRFTH'">Urgroßvater</xsl:when>
            <xsl:when test="$code='GGRMTH'">Urgroßmutter</xsl:when>
            <xsl:when test="$code='GRNDCHILD'">Enkelkind</xsl:when>
            <xsl:when test="$code='GRNDDAU'">Enkeltochter</xsl:when>
            <xsl:when test="$code='GRNDSON'">Enkelsohn</xsl:when>
            <xsl:when test="$code='AUNT'">Tante</xsl:when>
            <xsl:when test="$code='UNCLE'">Onkel</xsl:when>
            <xsl:when test="$code='NIENEPH'">Nichte/Neffe</xsl:when>
            <xsl:when test="$code='COUSN'">Cousine/Cousin</xsl:when>
            <xsl:when test="$code='FRND'">Bekannte/Bekannter</xsl:when>
            <xsl:when test="$code='SIGOTHR'">wichtige Bezugsperson (z.B. Lebensgefährte)</xsl:when>
            <xsl:when test="$code='ROOM'">MitbewohnerIn</xsl:when>
            <xsl:when test="$code='DOMPART'">LebenspartnerIn</xsl:when>
            <xsl:when test="$code='NBOR'">NachbarIn</xsl:when>
            <xsl:when test="$code='SPON'">Pflegeperson</xsl:when>
            <xsl:when test="$code='GUARD'">SachwalterIn</xsl:when>
            <xsl:when test="$code='SELF'">Patient selbst</xsl:when>
            <xsl:otherwise><xsl:value-of select="$code" />)</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    


  <!--
  code translations for telecom
  also found in addr tags
  -->
  <xsl:template name="translateCode">
    <xsl:param name="code"/>
    <xsl:choose>
      <!-- lookup table Telecom URI -->
      <xsl:when test="$code='fax'"><xsl:text>Fax</xsl:text></xsl:when>
      <xsl:when test="$code='file'"><xsl:text>Datei</xsl:text></xsl:when>
      <xsl:when test="$code='ftp'"><xsl:text>FTP</xsl:text></xsl:when>
      <xsl:when test="$code='http'"><xsl:text>www</xsl:text></xsl:when>
      <xsl:when test="$code='mailto'"><xsl:text>Email</xsl:text></xsl:when>
      <xsl:when test="$code='me'"><xsl:text>ME-Nummer</xsl:text></xsl:when>
      <xsl:when test="$code='mllp'"><xsl:text>MLLP</xsl:text></xsl:when>
      <xsl:when test="$code='modem'"><xsl:text>Modem</xsl:text></xsl:when>
      <xsl:when test="$code='nfs'"><xsl:text>NFS</xsl:text></xsl:when>
      <xsl:when test="$code='tel'"><xsl:text>Telefon</xsl:text></xsl:when>
      <xsl:when test="$code='telnet'"><xsl:text>Telnet</xsl:text></xsl:when>
      <!-- addr oder telecom use -->
      <xsl:when test="$code='AS'"><xsl:text>Anrufbeantworter</xsl:text></xsl:when>
      <xsl:when test="$code='EC'"><xsl:text>Im Notfall erreichbar unter</xsl:text></xsl:when>
      <xsl:when test="$code='H'"><xsl:text>Wohnort</xsl:text></xsl:when>
      <xsl:when test="$code='HP'"><xsl:text>Hauptwohnsitz</xsl:text></xsl:when>
      <xsl:when test="$code='HV'"><xsl:text>Ferienwohnort</xsl:text></xsl:when>
      <xsl:when test="$code='MC'"><xsl:text>Mobiltelefon</xsl:text></xsl:when>
      <xsl:when test="$code='PG'"><xsl:text>Pager</xsl:text></xsl:when>
      <xsl:when test="$code='WP'"><xsl:text>Geschäftlich</xsl:text></xsl:when>
      <xsl:when test="$code='PUB'"><xsl:text>Geschäftlich</xsl:text></xsl:when>
      <xsl:when test="$code='TMP'"><xsl:text>Pflegeadresse</xsl:text></xsl:when>
      <xsl:otherwise><xsl:value-of select="$code" /></xsl:otherwise>
    </xsl:choose>
  </xsl:template>



    <!-- AUTO GENERATED TEMPLATE. DO NOT MODIFY! -->
    
    <xsl:template name="getELGAAuthorSpeciality">
        <xsl:param name="code" />
        
        <xsl:choose>
            <xsl:when test="$code='10'">Rollen für Personen</xsl:when>
            <xsl:when test="$code='100'">Ärztin/Arzt für Allgemeinmedizin</xsl:when>
            <xsl:when test="$code='101'">Approbierte Ärztin/Approbierter Arzt</xsl:when>
            <xsl:when test="$code='158'">Fachärztin/Facharzt</xsl:when>
            <xsl:when test="$code='102'">Fachärztin/Facharzt für Anästhesiologie und Intensivmedizin</xsl:when>
            <xsl:when test="$code='103'">Fachärztin/Facharzt für Anatomie</xsl:when>
            <xsl:when test="$code='104'">Fachärztin/Facharzt für Arbeitsmedizin</xsl:when>
            <xsl:when test="$code='105'">Fachärztin/Facharzt für Augenheilkunde und Optometrie</xsl:when>
            <xsl:when test="$code='106'">Fachärztin/Facharzt für Blutgruppenserologie und Transfusionsmedizin</xsl:when>
            <xsl:when test="$code='107'">Fachärztin/Facharzt für Chirurgie</xsl:when>
            <xsl:when test="$code='108'">Fachärztin/Facharzt für Frauenheilkunde und Geburtshilfe</xsl:when>
            <xsl:when test="$code='109'">Fachärztin/Facharzt für Gerichtsmedizin</xsl:when>
            <xsl:when test="$code='110'">Fachärztin/Facharzt für Hals-, Nasen- und Ohrenkrankheiten</xsl:when>
            <xsl:when test="$code='111'">Fachärztin/Facharzt für Haut- und Geschlechtskrankheiten</xsl:when>
            <xsl:when test="$code='112'">Fachärztin/Facharzt für Herzchirurgie</xsl:when>
            <xsl:when test="$code='113'">Fachärztin/Facharzt für Histologie und Embryologie</xsl:when>
            <xsl:when test="$code='114'">Fachärztin/Facharzt für Hygiene und Mikrobiologie</xsl:when>
            <xsl:when test="$code='115'">Fachärztin/Facharzt für Immunologie</xsl:when>
            <xsl:when test="$code='116'">Fachärztin/Facharzt für Innere Medizin</xsl:when>
            <xsl:when test="$code='117'">Fachärztin/Facharzt für Kinder- und Jugendchirurgie</xsl:when>
            <xsl:when test="$code='118'">Fachärztin/Facharzt für Kinder- und Jugendheilkunde</xsl:when>
            <xsl:when test="$code='119'">Fachärztin/Facharzt für Kinder- und Jugendpsychiatrie</xsl:when>
            <xsl:when test="$code='120'">Fachärztin/Facharzt für Lungenkrankheiten</xsl:when>
            <xsl:when test="$code='121'">Fachärztin/Facharzt für Medizinische Biologie</xsl:when>
            <xsl:when test="$code='122'">Fachärztin/Facharzt für Medizinische Biophysik</xsl:when>
            <xsl:when test="$code='123'">Fachärztin/Facharzt für Medizinische Genetik</xsl:when>
            <xsl:when test="$code='124'">Fachärztin/Facharzt für Medizinische und Chemische Labordiagnostik</xsl:when>
            <xsl:when test="$code='125'">Fachärztin/Facharzt für Medizinische Leistungsphysiologie</xsl:when>
            <xsl:when test="$code='126'">Fachärztin/Facharzt für Mikrobiologisch-Serologische Labordiagnostik</xsl:when>
            <xsl:when test="$code='127'">Fachärztin/Facharzt für Mund-, Kiefer- und Gesichtschirurgie</xsl:when>
            <xsl:when test="$code='128'">Fachärztin/Facharzt für Neurobiologie</xsl:when>
            <xsl:when test="$code='129'">Fachärztin/Facharzt für Neurochirurgie</xsl:when>
            <xsl:when test="$code='130'">Fachärztin/Facharzt für Neurologie</xsl:when>
            <xsl:when test="$code='131'">Fachärztin/Facharzt für Neurologie und Psychiatrie</xsl:when>
            <xsl:when test="$code='132'">Fachärztin/Facharzt für Neuropathologie</xsl:when>
            <xsl:when test="$code='133'">Fachärztin/Facharzt für Nuklearmedizin</xsl:when>
            <xsl:when test="$code='134'">Fachärztin/Facharzt für Orthopädie und Orthopädische Chirurgie</xsl:when>
            <xsl:when test="$code='135'">Fachärztin/Facharzt für Pathologie</xsl:when>
            <xsl:when test="$code='136'">Fachärztin/Facharzt für Pathophysiologie</xsl:when>
            <xsl:when test="$code='137'">Fachärztin/Facharzt für Pharmakologie und Toxikologie</xsl:when>
            <xsl:when test="$code='138'">Fachärztin/Facharzt für Physikalische Medizin und Allgemeine Rehabilitation</xsl:when>
            <xsl:when test="$code='139'">Fachärztin/Facharzt für Physiologie</xsl:when>
            <xsl:when test="$code='140'">Fachärztin/Facharzt für Plastische, Ästhetische und Rekonstruktive Chirurgie</xsl:when>
            <xsl:when test="$code='141'">Fachärztin/Facharzt für Psychiatrie</xsl:when>
            <xsl:when test="$code='142'">Fachärztin/Facharzt für Psychiatrie und Neurologie</xsl:when>
            <xsl:when test="$code='143'">Fachärztin/Facharzt für Psychiatrie und Psychotherapeutische Medizin</xsl:when>
            <xsl:when test="$code='144'">Fachärztin/Facharzt für Radiologie</xsl:when>
            <xsl:when test="$code='145'">Fachärztin/Facharzt für Sozialmedizin</xsl:when>
            <xsl:when test="$code='146'">Fachärztin/Facharzt für Spezifische Prophylaxe und Tropenmedizin</xsl:when>
            <xsl:when test="$code='147'">Fachärztin/Facharzt für Strahlentherapie-Radioonkologie</xsl:when>
            <xsl:when test="$code='148'">Fachärztin/Facharzt für Theoretische Sonderfächer</xsl:when>
            <xsl:when test="$code='149'">Fachärztin/Facharzt für Thoraxchirurgie</xsl:when>
            <xsl:when test="$code='150'">Fachärztin/Facharzt für Tumorbiologie</xsl:when>
            <xsl:when test="$code='151'">Fachärztin/Facharzt für Unfallchirurgie</xsl:when>
            <xsl:when test="$code='152'">Fachärztin/Facharzt für Urologie</xsl:when>
            <xsl:when test="$code='153'">Fachärztin/Facharzt für Virologie</xsl:when>
            <xsl:when test="$code='154'">Fachärztin/Facharzt für Zahn-, Mund- und Kieferheilkunde</xsl:when>
            <xsl:when test="$code='155'">Zahnärztin/Zahnarzt</xsl:when>
            <xsl:when test="$code='156'">Dentistin/Dentist</xsl:when>
            <xsl:when test="$code='200'">Psychotherapeutin/Psychotherapeut</xsl:when>
            <xsl:when test="$code='201'">Klinische Psychologin/Klinischer Psychologe</xsl:when>
            <xsl:when test="$code='202'">Gesundheitspsychologin/Gesundheitspsychologe</xsl:when>
            <xsl:when test="$code='203'">Musiktherapeutin/Musiktherapeut</xsl:when>
            <xsl:when test="$code='204'">Hebamme</xsl:when>
            <xsl:when test="$code='205'">Physiotherapeutin/Physiotherapeut</xsl:when>
            <xsl:when test="$code='206'">Biomedizinische Analytikerin/Biomedizinischer Analytiker</xsl:when>
            <xsl:when test="$code='207'">Radiologietechnologin/Radiologietechnologe</xsl:when>
            <xsl:when test="$code='208'">Diätologin/Diätologe</xsl:when>
            <xsl:when test="$code='209'">Ergotherapeutin/Ergotherapeut</xsl:when>
            <xsl:when test="$code='210'">Logopädin/Logopäde</xsl:when>
            <xsl:when test="$code='211'">Orthoptistin/Orthoptist</xsl:when>
            <xsl:when test="$code='212'">Diplomierte Gesundheits- und Krankenschwester/Diplomierter Gesundheits- und Krankenpfleger</xsl:when>
            <xsl:when test="$code='213'">Diplomierte Kinderkrankenschwester/Diplomierter Kinderkrankenpfleger</xsl:when>
            <xsl:when test="$code='214'">Diplomierte psychiatrische Gesundheits- und Krankenschwester/Diplomierter psychiatrischer Gesundheits- und Krankenpfleger</xsl:when>
            <xsl:when test="$code='215'">Heilmasseurin/Heilmasseur</xsl:when>
            <xsl:when test="$code='216'">Diplomierte Kardiotechnikerin/Diplomierter Kardiotechniker</xsl:when>
            <xsl:when test="$code='20'">Teil 2: Rollen für Organisationen</xsl:when>
            <xsl:when test="$code='300'">Allgemeine Krankenanstalt</xsl:when>
            <xsl:when test="$code='301'">Sonderkrankenanstalt</xsl:when>
            <xsl:when test="$code='302'">Pflegeanstalt</xsl:when>
            <xsl:when test="$code='303'">Sanatorium</xsl:when>
            <xsl:when test="$code='304'">Selbstständiges Ambulatorium</xsl:when>
            <xsl:when test="$code='305'">Pflegeeinrichtung</xsl:when>
            <xsl:when test="$code='306'">Mobile Pflege</xsl:when>
            <xsl:when test="$code='307'">Kuranstalt</xsl:when>
            <xsl:when test="$code='309'">Straf- und Maßnahmenvollzug</xsl:when>
            <xsl:when test="$code='310'">Untersuchungsanstalt</xsl:when>
            <xsl:when test="$code='311'">Öffentliche Apotheke</xsl:when>
            <xsl:when test="$code='312'">Gewebebank</xsl:when>
            <xsl:when test="$code='313'">Blutspendeeinrichtung</xsl:when>
            <xsl:when test="$code='314'">Augen- und Kontaktlinsenoptik</xsl:when>
            <xsl:when test="$code='315'">Hörgeräteakustik</xsl:when>
            <xsl:when test="$code='316'">Orthopädische Produkte</xsl:when>
            <xsl:when test="$code='317'">Zahntechnik</xsl:when>
            <xsl:when test="$code='318'">Rettungsdienst</xsl:when>
            <xsl:when test="$code='319'">Zahnärztliche Gruppenpraxis</xsl:when>
            <xsl:when test="$code='320'">Ärztliche Gruppenpraxis</xsl:when>
            <xsl:when test="$code='321'">Gewebeentnahmeeinrichtung</xsl:when>
            <xsl:when test="$code='322'">Arbeitsmedizinisches Zentrum</xsl:when>
            <xsl:when test="$code='400'">Gesundheitsmanagement</xsl:when>
            <xsl:when test="$code='401'">Öffentlicher Gesundheitsdienst</xsl:when>
            <xsl:when test="$code='403'">ELGA-Ombudsstelle</xsl:when>
            <xsl:when test="$code='404'">Widerspruchstelle</xsl:when>
            <xsl:when test="$code='405'">Patientenvertretung</xsl:when>
            <xsl:when test="$code='406'">Sozialversicherung</xsl:when>
            <xsl:when test="$code='407'">Krankenfürsorge</xsl:when>
            <xsl:when test="$code='408'">Gesundheitsversicherung</xsl:when>
            <xsl:when test="$code='500'">IKT-Gesundheitsservice</xsl:when>
            <xsl:when test="$code='501'">Verrechnungsservice</xsl:when>
            <xsl:otherwise>Fachrichtung unbekannt</xsl:otherwise>
        
        </xsl:choose>
    
    </xsl:template>
    



  
  <xsl:template name="documentstate">
    <xsl:if test="$isdeprecated=1">
      <div class="deprecated">
        STORNIERT
      </div>
    </xsl:if>
  </xsl:template>

  <!-- base64 encoded images which are used more often -->
  <xsl:template name="getWarningIcon">
    <img alt="Symbol Risiko" height="25" width="25" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAYdJREFUeNrsVc1Nw1AMbisGyAhBLJArt2SChgkKE9AcORVOHGknCCO0
E5AbR7IAghHeBsWWPkvG8nsJUeGEJcuJ3s/3+bPjzGZ/YPPYwsXlY0ahJl+RF+SZWu7ID+T799e7
z0kgBLCmsDEXx+yBgO5/BEIALYVrh3WPdwZeIkshwWsVgYVBEAPABxs62CXklIyTQHMj0ZNifxVj
ZsCYVIvXLZ1pXBCw+kD6LiPac8RjZbMzBM9tMywQtb7NmAy00f4tBbl4Y9cFZCW6xmrAGcD7WJcp
wt/sDLFAPCTYdgMJ7VGbjOTLtWQL1ZYzlbJX4CO8jJDQEueeXGLhN8aKBSlOdG/wQETv5dRbScZa
Sdd7IFLwgos2EedWNYArl15oJ2YhDbFzQdBu0uclZtio74T2FopY57W6HZBvqvic3U3q60cGLT6B
gJEShkB484sC4gPPXDNhiJqVmBKl2lfZgqf+Jxnmz3pkSQYndur3mwOsjvwhWc7diHETB3EApbVD
TJZ/O4l9CTAA/M2f0jpaDeUAAAAASUVORK5CYII=" />
  </xsl:template>

  <xsl:template name="getLawIcon">
    <img alt="Symbol Patientenverfügung" height="20" width="20" src="data:image/png;base64,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" />
  </xsl:template>

  <xsl:template name="getQuestionIcon">
    <img alt="Symbol keine strukturiertes Dokument" height="20" width="20" src="data:image/png;base64,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
wMqEogAAAABJRU5ErkJggg==" />
  </xsl:template>

  <xsl:variable name="expandIcon">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAUCAYAAABmvqYOAAAAzUlEQVQ4y+3UvU4CQRTF8R9CNLEw0FFaWdDxBvoGtjI9tQ2xpLCyoOMBsDDGRqolJrY+0RQmQjZrgSQgHy4bK7Knm3uT/5l752QodVCqrFXOntq4KMD6xJsYZotC7Re4ig+cFrxsB8+Lw9FKK4YUd0gLgEcY717LfIJrvOA4J3iAnhiyv+Fzgyu8or4DmqEvhvt8D7pq0EKC8w3dFLdiGOZPy7pBExO0l6pTdMXwuF8UNxs0flZ0iS/ciGG8f863G5zgAe9iSMovotT/6huflSmgcdjGBgAAAABJRU5ErkJggg==</xsl:variable>

  <xsl:variable name="expandIconHover">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAUCAYAAABmvqYOAAABv0lEQVQ4y2NgGAX0BowwhoTxTNa3jzmL/v1ljGf4zyhBhlnvmZj/b+QS+NXw8XbyJwYGBgYWmMzbx5wdv38wFxnqCzCoqfKSbPK3738Ed+x6Ufj1PZsmAwODJ1xCzWMSE7PQko8swkv/f/n66z+5IDLl0H8GvqX/xfRnyTMwMDAwQc1n+s/AwPPnNwNDecN5hr9//5Ps8vlL7zCs3/SUgYGBgeHPbyYuZMPhYOrMOwzBcQcZfv76S7TBPZOvMiRnn2L48eMfijgTNsUbtzxj8Ajex/D+w0+8hv7/z8BQ23qBobTmIsN/LJ5lwqXxwKHXDDbuuxnuP/qCVf7v3/8MueWnGFq6ruG0nAmfy67d+MRg5bKL4dzFtyjiv37/Y0jKOc4wdeYdvD6DGf6fkYHhDzYFL17+YHDx28ew/8gLBgYGBoYfP/8yhCceZli07AFuQ5n//0HJRCwiizf8+cXkj0sDOxsTQ12lNsOhY68Zdu5+gdNgZtZ/NxSNPmjf2Z37D244n/I8kW8fWef+/c3k+/8/wlJSADPrvxPsXH/jvz1OuIXichiQMpsh9PMriwCpBrNx/v36/Ez6y9ESdWABACUE2xY6eQ1fAAAAAElFTkSuQmCC</xsl:variable>

  <xsl:variable name="collapseIcon">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAUCAYAAABmvqYOAAABy0lEQVQ4y2NgGAX0BowwhoTRTNa3TziL/v1ljGf4zyhBhlnvmZj/b+QS+N3w8XbSJwYGBgYWmMzbJ5wdv38wF+HSycfLyhDkJ8uwfPUDhp+//mFTIvj3D2Ph1/esmgwMDJ4MDAwMTAwMDAyqbpOZ//1hSsZlsAA/G8PW1Q4M86dZMGxb48ggwM+G0/l/fjO5i+rNkocbzsDAwPT/PwMPNsXiYhwMezc5MdhYijIwMDAwONmLM+zf6swgLsaB3fT/DIx//zBxIRuOFcjLcjMc2ObCYGQghCJuoCvIcGy3G4OGGh/eSMBpuIYaH8P+rc4MGqrYDVBS4GE4usuNwd5ajDTDDfUEGfZvcWZQlOfB6zIhQTaGneudGAJ9ZYkz3M5KjGHPJicGCXFOotIfOzsTw6qFNgxZKao4Df/PwMjwR0aKi2HPJicGIUF2khI4CzMjw9ReUwZDPUGIoUz//8DT+e1duX9YRBbvePbiu39JzXkGKUlOknPQ23c/Ga5c/8jAzPrvBp/Yz3tvkHMor9I8ke+fWOf+/c3k8/8//lSEI6//Z2b5d4KN82/C9ycJt1CyPwxImswQ+vWdWYBUs1nZ/319cS795WiJOrAAABs5egZU84nZAAAAAElFTkSuQmCC</xsl:variable>

  <xsl:variable name="collapseIconHover">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAUCAYAAABmvqYOAAAAvklEQVQ4y+3Ur0pEYRCH4UdRbINsURZBNBndvQCtVsF27sDs7Rin2PeAIGjRqsFsFAyW02wGd2FZWP38MMn5tfn3MswMQ69/pZXizMjAGVLXfJSUrBaCNzHBJdqp/QedR26hxXjO+4QTXfNW33nkLu4WwHCIB5EHdfCvwlssA+zjXuTx7+CRoyl474ehDXAt8rQMHnmEG2wX3tEGrkSef7/QyB28YL3ytMe65nFmrC0EX3GBYQX4Hc/96+hVp0+UDCIrOSFVbgAAAABJRU5ErkJggg==</xsl:variable>

  <xsl:variable name="warningIcon">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAUdJREFUeNrUlMFNxDAQRZOIAkwHIBoIR27ZDtIBpALIkdOyJ47ZDhAdbAfZG8e4gZXSwaYD+Ebf6Mc4SyLthZFGkSffzzP22ElyZkv/Etzcveb4GA77w8dzvxgIyBU+a3gpMG8O+A7wyywgYA/4NAKy8D3HOd3HK4DtJJCwNw538Doskdk7TQEf4LeqSQNhx0y2ENXy73uyZoOYg7oE9oivfDyTxdeE7RRGa7kNPwZNxbILwMsY0AfryF5v3EFE4l57PyqZrdGxLa6X9B3mHpnxpWZopCVikz7h7QTTamtl574pWZBZvrBcw/axIyD7yLnRE5thpZT9q2R/ig1XnpNdI10QvSkdy3YrrpD5cALWUju6BBeBthJhh4kbNvogoCf4I0/WanZTj4PeVX1hTPDybB0srCI9sUclb0ARvDyWoD75l/YlwABPxnnrYrQs5wAAAABJRU5ErkJggg==</xsl:variable>

  <xsl:variable name="warningIconHover">data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAQdJREFUeNpiYKAyYCSkQNmy3QBICUC5D+4er3xAsoFAQxSAVD0QByAZBgMgAxcCDW4gykCgYQlAqh+LQejgAhAnAg2+gNNAqGHzSQiyD0BsiBwMTGje7Memy9xIjkFTVRyblAC6A5iQ2PW4vLl0ShRDTYEzLlc6AB0TAOOwIEkE4NIxae4RhqfPP+LzejwQb4CHITRpnKcg+X0AhqMgspfxxuidYxUMS6dG4VMigC0MqQKYkBIrJeACioHQdPSAagZCwUIKDGzElVNAMW1AomETgD4sxBUpidDsRIpXG3HlFAZoRjcE4gPEuAyIHYF6PhBVHkKzEygHOCClswswVxEqFwcvAAgwAOH7S8mydL+yAAAAAElFTkSuQmCC</xsl:variable>

  <xsl:template name="uriDecode">
    <xsl:param name="uri" />
    
    <xsl:variable name="quot">"</xsl:variable>
    <xsl:variable name="apos">'</xsl:variable>

    <xsl:variable name="decodeP20">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$uri" />
        <xsl:with-param name="replace" select="'%20'" />
        <xsl:with-param name="by" select="' '" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP21">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP20" />
        <xsl:with-param name="replace" select="'%21'" />
        <xsl:with-param name="by" select="'!'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP22">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP21" />
        <xsl:with-param name="replace" select="'%22'" />
        <xsl:with-param name="by" select="$quot" />
      </xsl:call-template>
    </xsl:variable>    

    <xsl:variable name="decodeP23">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP22" />
        <xsl:with-param name="replace" select="'%23'" />
        <xsl:with-param name="by" select="'#'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodeP24">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP23" />
        <xsl:with-param name="replace" select="'%24'" />
        <xsl:with-param name="by" select="'$'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodeP25">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP24" />
        <xsl:with-param name="replace" select="'%25'" />
        <xsl:with-param name="by" select="'%'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodeP26">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP25" />
        <xsl:with-param name="replace" select="'%26'" />
        <xsl:with-param name="by" select="'&amp;'" />
      </xsl:call-template>
    </xsl:variable>    

    <xsl:variable name="decodeP27">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP26" />
        <xsl:with-param name="replace" select="'%27'" />
        <xsl:with-param name="by" select="$apos" />
      </xsl:call-template>
    </xsl:variable>    

    <xsl:variable name="decodeP28">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP27" />
        <xsl:with-param name="replace" select="'%28'" />
        <xsl:with-param name="by" select="'('" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP29">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP28" />
        <xsl:with-param name="replace" select="'%29'" />
        <xsl:with-param name="by" select="')'" />
      </xsl:call-template>
    </xsl:variable>    

    <xsl:variable name="decodeP2A">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP29" />
        <xsl:with-param name="replace" select="'%2A'" />
        <xsl:with-param name="by" select="'*'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP2B">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP2A" />
        <xsl:with-param name="replace" select="'%2B'" />
        <xsl:with-param name="by" select="'+'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP2C">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP2B" />
        <xsl:with-param name="replace" select="'%2C'" />
        <xsl:with-param name="by" select="','" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP2F">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP2C" />
        <xsl:with-param name="replace" select="'%2F'" />
        <xsl:with-param name="by" select="'/'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP3A">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP2F" />
        <xsl:with-param name="replace" select="'%3A'" />
        <xsl:with-param name="by" select="':'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP3B">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP3A" />
        <xsl:with-param name="replace" select="'%3B'" />
        <xsl:with-param name="by" select="';'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP3D">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP3B" />
        <xsl:with-param name="replace" select="'%3D'" />
        <xsl:with-param name="by" select="'='" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP3F">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP3D" />
        <xsl:with-param name="replace" select="'%3F'" />
        <xsl:with-param name="by" select="'?'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP40">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP3F" />
        <xsl:with-param name="replace" select="'%40'" />
        <xsl:with-param name="by" select="'@'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP5B">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP40" />
        <xsl:with-param name="replace" select="'%5B'" />
        <xsl:with-param name="by" select="'['" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodeP5D">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP5B" />
        <xsl:with-param name="replace" select="'%5D'" />
        <xsl:with-param name="by" select="']'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodePC3P84">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodeP5D" />
        <xsl:with-param name="replace" select="'%C3%84'" />
        <xsl:with-param name="by" select="'Ä'" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="decodePC3P96">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3P84" />
        <xsl:with-param name="replace" select="'%C3%96'" />
        <xsl:with-param name="by" select="'Ö'" />
      </xsl:call-template>
    </xsl:variable>    

    <xsl:variable name="decodePC3P9C">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3P96" />
        <xsl:with-param name="replace" select="'%C3%9C'" />
        <xsl:with-param name="by" select="'Ü'" />
      </xsl:call-template>
    </xsl:variable> 

    <xsl:variable name="decodePC3PA4">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3P9C" />
        <xsl:with-param name="replace" select="'%C3%A4'" />
        <xsl:with-param name="by" select="'ä'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodePC3PB6">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3PA4" />
        <xsl:with-param name="replace" select="'%C3%B6'" />
        <xsl:with-param name="by" select="'ö'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodePC3PBC">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3PB6" />
        <xsl:with-param name="replace" select="'%C3%BC'" />
        <xsl:with-param name="by" select="'ü'" />
      </xsl:call-template>
    </xsl:variable>      

    <xsl:variable name="decodePC3P9F">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3PBC" />
        <xsl:with-param name="replace" select="'%C3%9F'" />
        <xsl:with-param name="by" select="'&#223;'" />
      </xsl:call-template>
    </xsl:variable>   
    
    <xsl:variable name="decodePC4">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC3P9F" />
        <xsl:with-param name="replace" select="'%C4'" />
        <xsl:with-param name="by" select="'Ä'" />
      </xsl:call-template>
    </xsl:variable>    

    <xsl:variable name="decodePD6">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePC4" />
        <xsl:with-param name="replace" select="'%D6'" />
        <xsl:with-param name="by" select="'Ö'" />
      </xsl:call-template>
    </xsl:variable>   

    <xsl:variable name="decodePDC">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePD6" />
        <xsl:with-param name="replace" select="'%DC'" />
        <xsl:with-param name="by" select="'Ü'" />
      </xsl:call-template>
    </xsl:variable> 
    
    <xsl:variable name="decodePE4">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePDC" />
        <xsl:with-param name="replace" select="'%E4'" />
        <xsl:with-param name="by" select="'ä'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodePF6">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePE4" />
        <xsl:with-param name="replace" select="'%F6'" />
        <xsl:with-param name="by" select="'ö'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodePFC">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePF6" />
        <xsl:with-param name="replace" select="'%FC'" />
        <xsl:with-param name="by" select="'ü'" />
      </xsl:call-template>
    </xsl:variable>     

    <xsl:variable name="decodePDF">
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text" select="$decodePFC" />
        <xsl:with-param name="replace" select="'%DF'" />
        <xsl:with-param name="by" select="'&#223;'" />
      </xsl:call-template>
    </xsl:variable> 
                    
    <xsl:value-of select="$decodePDF" />
        
  </xsl:template>
  
  <!-- Source: http://geekswithblogs.net/Erik/archive/2008/04/01/120915.aspx -->
  <xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text" select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
