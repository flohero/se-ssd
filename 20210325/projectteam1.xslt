<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://www.fh-hagenberg.at/projectteam">

	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/">
			<html>
				<head>
					<title>Project Team</title>
				</head>
				<body>
					<h1>PROJECT TEAM</h1>
					<xsl:apply-templates 
					select="ProjectTeam/Person">
						<xsl:sort data-type="text" 
						order="ascending" select="LastName"/>
						<xsl:sort data-type="text" 
						order="ascending" select="FirstName"/>
					</xsl:apply-templates>
				</body>
			</html>
		</xsl:template>
		
		<xsl:template match="Person">
			<xsl:number/> Person: <br/>
			<xsl:apply-templates/>
			<hr/>
		</xsl:template>
		
		<xsl:template match="FirstName">
			Vorname:
			<xsl:value-of select="."/>
		</xsl:template>
		
		<xsl:template match="LastName">
			Vorname:
			<xsl:value-of select="."/>
		</xsl:template>
		<xsl:template match="MiddleName"/>
		<xsl:template match="BirthPlace"/>
</xsl:stylesheet>
