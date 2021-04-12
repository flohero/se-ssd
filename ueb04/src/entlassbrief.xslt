<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.fh-ooe.at/ssd4/entlassungsbrief" xpath-default-namespace="http://www.fh-ooe.at/ssd4/entlassungsbrief">
    <xsl:output method="html" encoding="ISO8859-1" indent="yes"/>
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
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="Entlassungsbrief">
        <h1>Entlassungsbrief</h1>
        Erzeugt am 
        <xsl:value-of select='format-dateTime(@erzeugt, "[D]. [MNn] [Y] um [H01]:[m01] Uhr", "de", (), ())'/>
        | Version: 
        <xsl:value-of select="@version"/>
        <hr/>

        <xsl:apply-templates/>
    </xsl:template>
	
	<!--TBD-->
	<xsl:template match="Entlassungsbrief">
		<strong>Erstellt von: </strong> <xsl:value-of select="./Ersteller"/> <br/>
		<strong>An: </strong> <xsl:value-of select="./Empfänger"/>
		<xsl:apply-templates select="Patient"/>
		<xsl:apply-templates select="Aufenthalt"/>
		<xsl:apply-templates select="Befundtext"/>
		<xsl:apply-templates select="Diagnosen"/>
		<xsl:apply-templates select="Medikation"/>
	</xsl:template>
	
	<xsl:template match="Patient">
		<h2>Patient:</h2>
		<xsl:value-of select="Titel[@position='vor']"/>
		<xsl:value-of select="Vorname"/> 
		<xsl:text> </xsl:text>
		<xsl:value-of select="Nachname"/>
		
		<xsl:if test="Titel[@position='nach']">
			<xsl:text>, </xsl:text>
		</xsl:if>
		
		<xsl:value-of select="string-join(Titel[@position='nach'], ', ')"/>
		<br/>
		<strong>Geschlecht: </strong>
		<xsl:value-of select="Geschlecht"/>
		<xsl:text> | </xsl:text>
		<strong>geboren am: </strong>
		<xsl:value-of select="format-date(Geburtsdatum, '[D] [MNn] [Y]')"/>
		<xsl:text> | </xsl:text>
		<strong>SVN: </strong>
		<xsl:value-of select="SVN"/>
	</xsl:template>
	
	<xsl:template match="Aufenthalt">
		<h2>Aufenthalt: </h2>
		<xsl:value-of select="."/>
		<br/>
		<strong>
			<xsl:value-of 
			select="concat(upper-case(substring(@art,1,1)), substring(@art, 2))"/> 
		</strong>
		
		<xsl:if test="@von">
			<strong> von </strong>
			<xsl:value-of select="format-date(@von, '[D] [MNn] [Y]')"/>
		</xsl:if>
		<xsl:if test="@bis">
			<strong> bis </strong>
			<xsl:value-of select="format-date(@bis, '[D] [MNn] [Y]')"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="Befundtext">
		<hr/>
		<xsl:value-of select="Anrede"/>
		<p/>
		<i>
			<xsl:value-of select="Text"/>
		</i>
		<hr/>
	</xsl:template>
	
	<xsl:template match="Diagnosen">
		<h2>Diagnosen bei Entlassung: </h2>
		<table class="t2">
			<thead>
				<tr>
					<th>Diagnose</th>
					<th>Datum von</th>
					<th>Datum bis</th>
					<th align="right">Status</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="./Diagnose"/>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="Diagnose">
		<tr>
			<td>
				<strong>
					<xsl:value-of select="@code"/>
				</strong>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="."/>
			</td>
			<td>
				<xsl:value-of select="format-date(@von, '[D].[M].[Y]')"/>
			</td>
			<td>
				<xsl:value-of select="format-date(@bis, '[D].[M].[Y]')"/>
			</td>
			<td align="right">
				<xsl:value-of select="@status"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="Medikation">
		<h2>Empfohlene Medikation</h2>
		<table class="t2">
			<thead>
				<tr>
					<th>Arzneimittel</th>
					<th>Einnahme</th>
					<th>Dosierung</th>
					<th align="right">Hinweis</th>
					<th>Diagnose</th>
					<th>Zusatzinformationen</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="./Arzneimittel"/>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="Arzneimittel">
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
				<xsl:value-of select="@diagnose"/>
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
	</xsl:template>
</xsl:stylesheet>
