<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                xmlns:o="urn:schemas-microsoft-com:office:office"
                xmlns:v="urn:schemas-microsoft-com:vml"
                xmlns:WX="http://schemas.microsoft.com/office/word/2003/auxHint"
                xmlns:aml="http://schemas.microsoft.com/aml/2001/core"
                xmlns:w10="urn:schemas-microsoft-com:office:word"
                xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:ext="http://www.xmllab.net/wordml2html/ext"
                xmlns:java="http://xml.apache.org/xalan/java"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                version="1.0"
                exclude-result-prefixes="java msxsl ext w o v WX aml w10"
                extension-element-prefixes="func">

  <!-- support function to return substring-before or everything -->
  <func:function name="func:substring-before-if-contains">
    <xsl:param name="arg"/>
    <xsl:param name="delim"/>
    <func:result>
      <xsl:choose>
        <xsl:when test="contains($arg, $delim)">
          <xsl:value-of select="substring-before($arg, $delim)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$arg"/>
        </xsl:otherwise>
      </xsl:choose>
    </func:result>
  </func:function>

  <!-- template as function used to return the relationship id of the element (currently links or images) -->
  <xsl:template name="relationship-id">rId<xsl:value-of select="count(preceding::a[starts-with(@href, 'http://') or starts-with(@href, 'https://')])+count(preceding::img)+8"/></xsl:template>
</xsl:stylesheet>
