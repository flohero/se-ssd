<!-- StyleSheet:                                                            JH, 2019-03-21                   
 - Description: 
 	- Transforms the CourseCatalog.xslt and creates an initial HTML representation
 - Version Info: 
   - stylesheet version 1.0
 - Change Log: 
   - - 
 - Important / TODO:
   - Change the URLs/HREFs if the documents are stored in another location.
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head></head>
			<body>
				<h1>Kurskataloge</h1>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="DegreeProgramme">
		<table border="1">
			<thead style="background:#00B0F0">
				<tr>
					<th>Nr.</th>
					<th>Titel</th>
					<th>ECTS</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="Course">
		<tr>
			<td>
				<xsl:number level="any"/>
			</td>
			<xsl:apply-templates select="Title | Credit"/>
		</tr>
	</xsl:template>

	<xsl:template match="Title | Credit">
		<td>
			<xsl:value-of select="."/>
		</td>
	</xsl:template>
</xsl:stylesheet>
