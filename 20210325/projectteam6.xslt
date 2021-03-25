<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.fh-hagenberg.at/projectteam" xpath-default-namespace="http://www.fh-hagenberg.at/projectteam"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

<!--	6.4. xsl:output: definiert Merkmale des Ausgabedokuments -->	
	<xsl:output 	method="xml" 
						doctype-system="team.dtd"
						standalone="no"
						version="1.0" 
						encoding="ISO-8859-1" 
						indent="yes"/>
	
	<xsl:template match="/">
<!--	Etwaige Kommentare vor dem Wurzelknoten übernehmen -->		
		<xsl:apply-templates select="comment()"/>
<!-- 	6.1. Neues Wurzelelement <TeamOverview> erzeugen -->
		<xsl:element name="TeamOverview">
<!-- 	6.1. Attribut <nation> erzeugen -->
			<xsl:attribute name="creationTime" select="current-dateTime( )"/>
<!-- 	6.1. <ProjectTeam>-Teilbaum verarbeiten -->
			<xsl:apply-templates select="ProjectTeam"/>
		</xsl:element>
	</xsl:template>
	
<!--	6.1. Template Rule zur Verarbeitung von ProjectTeam -->
	<xsl:template match="ProjectTeam">
<!-- 	6.1. xsl:copy-of: Kopiert Teilbaum (=Fragment), der über einen im select-Attribut 
		spezifizierten XPath-Ausdruck selektiert wird ("deep copy"). -->
		<!--		
		<xsl:copy-of select="."></xsl:copy-of>
		-->
<!--	6.1 xsl:copy: Kopiert aktuellen Kontextknoten (ProjectTeam) und dessen Namensraum-
		Knoten in das Ergebnisdokument ("shallow copy"). Die Kinder des aktuellen Knotens 
		und etwaige zugehörige Attribute werden nicht kopiert. -->
		<xsl:copy>
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

<!-- 	6.2. Person-Element in Ergenbnisdokument übernehmen. -->	
	<xsl:template match="Person">
		<xsl:copy>
<!-- 	6.2. Attribute in Person-Element in Elemente umwandeln. -->	
			<xsl:for-each select="@* except @xsi:type">
				<xsl:element name="{name(.)}">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:for-each>
<!-- 	6.2. Kopiert Teilbaum, der über einen im select-Attribut spezifizierten
			XPath-Ausdruck (FirstName und LastName) gefunden wird. -->	
			<xsl:copy-of select="./*"></xsl:copy-of>
		</xsl:copy>
	</xsl:template>
	
<!-- 	6.3. Kommentare in Ergebnisdokument übernehmen 
		Built-In Template Rule überschreiben -->
	<xsl:template match="comment()">
		<xsl:comment>
			<xsl:value-of select="."/>
		</xsl:comment>
	</xsl:template>
	
<!-- 	6.3. Process Instruction in Ergebnisdokument übernehmen 
		Built-In Template Rule überschreiben -->
	<xsl:template match="processing-instruction()">
		<xsl:processing-instruction name="{name(.)}">
			<xsl:value-of select="."/>
		</xsl:processing-instruction>
	</xsl:template>
	
</xsl:stylesheet>
