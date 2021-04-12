<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="ISO8859-1" indent="yes"/>
    
	<xsl:template name="selectArzneimittelForDiagnose">
		<xsl:param name="diagnose"/>
		<xsl:for-each select="//Arzneimittel[@diagnose=$diagnose]">
			<xsl:value-of select="."/>
			<xsl:if test="position() != last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
