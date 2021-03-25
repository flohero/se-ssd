<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://www.fh-hagenberg.at/projectteam">
	<xsl:output method="html" version="5.0" encoding="ISO-8859-1" indent="yes"/>
	
		<xsl:include href="projectlist.xslt"/>
		<xsl:template match="/">
			<html>
				<head>
					<title>Project Team</title>
				</head>
				<body>
					<h1>PROJECT TEAM</h1>
					<xsl:apply-templates/>
				</body>
			</html>
		</xsl:template>
		
		<xsl:template match="ProjectTeam">
			<xsl:for-each select="Person">
				<xsl:sort data-type="text" 
						order="ascending" select="LastName"/>
				<xsl:sort data-type="text" 
						order="ascending" select="FirstName"/>
						
				<xsl:value-of select="position()" />
						person (orig. <xsl:number/>): <br/>
						
				<xsl:variable name="nameVariable">
					<xsl:value-of select="LastName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="FirstName"/>
				</xsl:variable>
				
				<xsl:call-template name="Name">
					<xsl:with-param name="nameParam"	
						 			 select="$nameVariable"/>
				</xsl:call-template>
						
				<xsl:apply-templates/>
				
				<xsl:if test="@born">
					<xsl:text>(geboren am </xsl:text>
					<xsl:value-of select="@born"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
				
				
				<xsl:variable name="currentPerson" select="@id"/>
				<xsl:variable name="projectsForPerson" 		
	select="document('projectlist.xml')//Project[@leader=$currentPerson]"/>
            <xsl:if test="$projectsForPerson">
                <xsl:call-template name="selectedProjectsList">
                    <xsl:with-param name="selectedProjects" 
						select="$projectsForPerson"/>
                </xsl:call-template>
            </xsl:if>
				
				<hr/>
			</xsl:for-each>
		</xsl:template>
		
		<xsl:template name="Name">
		<xsl:param name="nameParam"/>
			<xsl:choose>
				<xsl:when test="@gender = 'female'">
					Sehr geehrte Frau 
				</xsl:when>
				<xsl:when test="@gender = 'male'">
					Sehr geehrter Herr 
				</xsl:when>
				<xsl:otherwise>Hallo!</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="$nameParam"/>
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
