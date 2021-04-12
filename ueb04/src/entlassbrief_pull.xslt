<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.fh-ooe.at/ssd4/entlassungsbrief" xpath-default-namespace="http://www.fh-ooe.at/ssd4/entlassungsbrief">
	<xsl:output method="html" encoding="ISO8859-1" indent="yes"/>
	<xsl:include href="ArzneimittelForDiagnose.xslt"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Entlassungsbrief</title>
				<style type="text/css">
					table.t2 {
						border-collapse: collapse;
						font-family: Georgia;
					  }
					  .t2 caption {
						padding-bottom: 0.5em;
						font-weight: bold;
						font-size: 16px;
					  }
					  .t2 th, .t2 td {
						padding: 4px 8px;
						border: 2px solid #fff;
						background: #c4dfe6;
					  }
					  .t2 thead th {
						padding: 2px 8px;
						background: #66a5ad;
						text-align: left;
						font-weight: normal;
						font-size: 13px;
						color: #fff;
					  }
					  .t2 tbody tr:nth-child(odd) *:nth-child(even), .t2 tbody tr:nth-child(even) *:nth-child(odd) {
						background: #c4dfe6;
					  }
					  .t2 tr *:nth-child(3), .t2 tr *:nth-child(4) {
						text-align: right;
					  }
				</style>
			</head>
			<body>
				<xsl:call-template name="Entlassungsbrief"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="Entlassungsbrief">
		<h1>Entlassungsbrief</h1>
		Erzeugt am 
		<xsl:value-of select='format-dateTime(/Entlassungsbrief/@erzeugt, "[D]. [MNn] [Y] um [H01]:[m01] Uhr", "de", (), ())'/>
		| Version: 
		<xsl:value-of select="/Entlassungsbrief/@version"/>
		<xsl:call-template name="Formatierung"/>
		<xsl:call-template name="Ersteller"/>
		<xsl:call-template name="Empfänger"/>
		<xsl:call-template name="Patient"/>
		<xsl:call-template name="Aufenthalt"/>
		<xsl:call-template name="Befundtext"/>
		<xsl:call-template name="Diagnosen"/>
		<xsl:call-template name="Medikation"/>
	</xsl:template>
	
	<!--TBD-->
	<xsl:template name="Formatierung">
		<hr/>
	</xsl:template>
	
	<xsl:template name="Ersteller">
		<strong>Erstellt von: </strong>
		<xsl:value-of select="//Ersteller"/>
		<br/>
	</xsl:template>
	
	<xsl:template name="Empfänger">
		<strong>An: </strong>
		<xsl:value-of select="//Empfänger"/>
		<br/>
	</xsl:template>
	
	<xsl:template name="Patient">
		<h2>Patient: </h2>
		<xsl:variable name="patient" select="//Patient"/>
		<xsl:for-each select="$patient/Titel[@position='vor']">
			<xsl:value-of select="."/>
			<xsl:text> </xsl:text>
		</xsl:for-each>
		<xsl:for-each select="$patient/Vorname">
			<xsl:value-of select="."/>
			<xsl:text> </xsl:text>
		</xsl:for-each>
		<xsl:value-of select="$patient/Nachname"/>
		
		<xsl:variable name="titleAfter" select="$patient/Titel[@position='nach']"/>
		<xsl:if test="$titleAfter">
			<xsl:text>, </xsl:text>
			<xsl:for-each select="$titleAfter">
				<xsl:value-of select="."/>
				<xsl:if test="position() != last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		
		<br/>
				<strong>Geschlecht: </strong>
		<xsl:value-of select="$patient/Geschlecht"/>
		<xsl:text> | </xsl:text>
		<strong>geboren am: </strong>
		<xsl:value-of select="format-date($patient/Geburtsdatum, '[D]. [MNn] [Y]')"/>
		<xsl:text> | </xsl:text>
		<strong>SVN: </strong>
		<xsl:value-of select="$patient/SVN"/>
	</xsl:template>
	
	<xsl:template name="Aufenthalt">
		<xsl:variable name="auf" select="//Aufenthalt"/>
		<h2>Aufenthalt:</h2>
		<xsl:value-of select="$auf"/>
		<br/>
		<strong>
			<xsl:value-of 
			select="concat(upper-case(substring($auf/@art,1,1)), substring($auf/@art, 2))"/> 
		</strong>
		
		<xsl:if test="$auf/@von">
			<strong> von </strong>
			<xsl:value-of select="format-date($auf/@von, '[D] [MNn] [Y]')"/>
		</xsl:if>
		<xsl:if test="$auf/@bis">
			<strong> bis </strong>
			<xsl:value-of select="format-date($auf/@bis, '[D] [MNn] [Y]')"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="Befundtext">
		<xsl:variable name="txt" select="//Befundtext"/>
		<hr/>
		<xsl:value-of select="$txt/Anrede"/>
		<p/>
		<i>
			<xsl:value-of select="$txt/Text"/>
		</i>
		<hr/>
	</xsl:template>
	
	<xsl:template name="Diagnosen">
		<xsl:variable name="dias" select="//Diagnosen"/>
		<h2>aufrechte Diagnosen bei Entlassung</h2>
		<table class="t2">
			<thead>
				<tr>
					<th>Diagnose</th>
					<th>Datum von</th>
					<th>Datum bis</th>
					<th>Status</th>
					<th>verordnete Arzneimittel</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$dias/Diagnose[@status='offen']">
				<tr>
					<th>
						<xsl:value-of select="@code"/>
					</th>
					<td>
						<xsl:value-of select="format-date(@von, '[D].[M].[Y]')"/>
					</td>
					<td>
						<xsl:value-of select="format-date(@bis, '[D].[M].[Y]')"/>
					</td>
					<td>
						<xsl:value-of select="@status"/>
					</td>
					<td>
						<xsl:call-template name="selectArzneimittelForDiagnose">
							<xsl:with-param name="diagnose" select="@code"/>
						</xsl:call-template>
					</td>
				</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template name="Medikation">
		<xsl:variable name="meds" select="//Medikation"/>
		<xsl:if test="$meds">
			<h2>Empfohlene Medikation (ohne Diagnose)</h2>
			<table class="t2">
			<thead>
				<tr>
					<th>Arzneimittel</th>
					<th>Einnahme</th>
					<th>Dosierung</th>
					<th align="right">Hinweis</th>
					<th>Zusatzinformationen</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$meds/Arzneimittel[not(@diagnose)]">
					<tr>
						<td>
							<strong>
								<xsl:value-of select="."/>
							</strong>
						</td>
						<td>
							<xsl:value-of select="@einnahme"/>
						</td>
						<td>
							<xsl:value-of select="@dosierung"/>
						</td>
						<td align="right">
							<xsl:value-of select="@hinweis"/>
						</td>
						<td>
							<xsl:if test="@von">
								<strong>Start: </strong>
								<xsl:value-of select="format-date(@von, '[D].[M].[Y]')"/>
								<br/>
							</xsl:if>
							<xsl:if test="@bis">
								<strong>Ende: </strong>
								<xsl:value-of select="format-date(@bis, '[D].[M].[Y]')"/>
								<br/>
							</xsl:if>
							<strong>Anwendung: </strong>
							<xsl:value-of select="@anwendung"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
