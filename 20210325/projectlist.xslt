<?xml version="1.0" encoding="ISO-8859-1"?>

<!--	5.2. XSLT-Stylesheet zur Transformation von projectlist.xml in HTML-Ergebnisdokument -->


    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				                xpath-default-namespace="http://www.fh-hagenberg.at/projectteam"
                 version="2.0">
        
 
	 <xsl:output method="html" version="5.0" encoding="ISO-8859-1" indent="yes"/> 
	
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="ProjectList">
		<table border="1">
			<tbody>
				<tr bgcolor="lightblue">
					<th>Bezeichnung</th>
					<th>Projektstart</th>
					<th>Projektende</th>
					<th>Ort</th>
					<th>Land</th>
				</tr>
					<xsl:apply-templates>
						<xsl:sort data-type="text" order="descending" select="./@startdate"/>
					</xsl:apply-templates>
			</tbody>
		</table> 		
	</xsl:template>

	
	<xsl:template match="Project">
				<tr>
					<td align="left">
						<xsl:value-of select="Name"/>
					</td>
					<td align="left">
<!--						<xsl:value-of select="format-date(@startdate,'[F], [D].[M].[Y]')"/>-->
						<xsl:value-of select="format-date(@startdate,'[D].[M].[Y]')"/>
					</td>
					<td align="left">
<!--						<xsl:value-of select="format-date(@enddate,'[F], [D].[M].[Y]')"/>-->
						<xsl:value-of select="format-date(@enddate,'[D].[M].[Y]')"/>
					</td>
					<td align="left">
						<xsl:value-of select="Location"/>
					</td>
					<td align="left">
						<xsl:value-of select="Country"/>
					</td>
				</tr> 
	</xsl:template>
	
	
	<!-- Spezielles Template zur Ausgabe bestimmter Projekte - "selectedProjectsList" -->
	<xsl:template name="selectedProjectsList">
		<xsl:param name="selectedProjects"></xsl:param>
		<table border="1">
			<tbody>
				<tr bgcolor="lightblue">
					<th>Bezeichnung</th>
					<th>Projektstart</th>					
					<th>Projektende</th>
					<th>Ort</th>
					<th>Land</th>
				</tr>
				<xsl:for-each select="$selectedProjects">
					<xsl:sort data-type="text" order="descending" select="./@startdate"/>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table> 		
	</xsl:template>	
	
</xsl:stylesheet>
