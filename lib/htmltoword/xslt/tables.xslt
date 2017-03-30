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

  <!--XSLT support for tables -->

  <!-- Full width tables per default -->
  <xsl:template match="table">
    <w:tbl>
      <w:tblPr>
        <w:tblStyle w:val="TableGrid"/>
        <w:tblW w:w="5000" w:type="pct"/>
        <xsl:call-template name="tableborders"/>
        <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
      </w:tblPr>
      <xsl:apply-templates />
    </w:tbl>
  </xsl:template>

  <xsl:template match="tbody">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="thead">
    <xsl:choose>
      <xsl:when test="count(./tr) = 0">
        <w:tr><xsl:apply-templates /></w:tr>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tr">
    <xsl:if test="string-length(.) > 0">
      <w:tr>
        <xsl:apply-templates />
      </w:tr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="th">
    <w:tc>
      <xsl:call-template name="table-cell-properties"/>
      <w:p>
        <w:r>
          <w:rPr>
            <w:b />
          </w:rPr>
          <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
        </w:r>
      </w:p>
    </w:tc>
  </xsl:template>

  <xsl:template match="td">
    <w:tc>
      <xsl:call-template name="table-cell-properties"/>
      <xsl:call-template name="block">
        <xsl:with-param name="current" select="." />
        <xsl:with-param name="class" select="@class" />
        <xsl:with-param name="style" select="@style" />
      </xsl:call-template>
    </w:tc>
  </xsl:template>

  <xsl:template name="block">
    <xsl:param name="current" />
    <xsl:param name="class" />
    <xsl:param name="style" />
    <xsl:if test="count($current/*|$current/text()) = 0">
      <w:p/>
    </xsl:if>
    <xsl:for-each select="$current/*|$current/text()">
      <xsl:choose>
        <xsl:when test="name(.) = 'table'">
          <xsl:apply-templates select="." />
          <w:p/>
        </xsl:when>
        <xsl:when test="contains('|p|h1|h2|h3|h4|h5|h6|ul|ol|', concat('|', name(.), '|'))">
          <xsl:apply-templates select="." />
        </xsl:when>
        <xsl:when test="descendant::table|descendant::p|descendant::h1|descendant::h2|descendant::h3|descendant::h4|descendant::h5|descendant::h6|descendant::li">
          <xsl:call-template name="block">
            <xsl:with-param name="current" select="."/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <w:p>
            <xsl:call-template name="text-alignment">
              <xsl:with-param name="class" select="$class" />
              <xsl:with-param name="style" select="$style" />
            </xsl:call-template>
            <xsl:apply-templates select="." />
          </w:p>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="tableborders">
    <xsl:variable name="border">
      <xsl:choose>
        <xsl:when test="contains(concat(' ', @class, ' '), ' table-bordered ')">6</xsl:when>
        <xsl:when test="not(@border)">0</xsl:when>
        <xsl:otherwise><xsl:value-of select="./@border * 6"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="bordertype">
      <xsl:choose>
        <xsl:when test="$border=0">none</xsl:when>
        <xsl:otherwise>single</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <w:tblBorders>
      <w:top w:val="{$bordertype}" w:sz="{$border}" w:space="0" w:color="auto"/>
      <w:left w:val="{$bordertype}" w:sz="{$border}" w:space="0" w:color="auto"/>
      <w:bottom w:val="{$bordertype}" w:sz="{$border}" w:space="0" w:color="auto"/>
      <w:right w:val="{$bordertype}" w:sz="{$border}" w:space="0" w:color="auto"/>
      <w:insideH w:val="{$bordertype}" w:sz="{$border}" w:space="0" w:color="auto"/>
      <w:insideV w:val="{$bordertype}" w:sz="{$border}" w:space="0" w:color="auto"/>
    </w:tblBorders>
  </xsl:template>

  <xsl:template name="table-cell-properties">
    <w:tcPr>
      <xsl:if test="contains(@class, 'ms-border-')">
        <w:tcBorders>
          <xsl:for-each select="str:tokenize(@class, ' ')">
            <xsl:call-template name="define-border">
              <xsl:with-param name="class" select="." />
            </xsl:call-template>
          </xsl:for-each>
        </w:tcBorders>
      </xsl:if>
      <xsl:if test="contains(@class, 'ms-fill-')">
        <xsl:variable name="cell-bg" select="str:tokenize(substring-after(@class, 'ms-fill-'), ' ')[1]"/>
        <w:shd w:val="clear" w:color="auto" w:fill="{$cell-bg}" />
      </xsl:if>
      <xsl:if test="@colspan &gt; 1">
        <w:gridSpan w:val="{@colspan}"/>
      </xsl:if>
    </w:tcPr>
  </xsl:template>

  <xsl:template name="define-border">
    <xsl:param name="class" />
    <xsl:if test="contains($class, 'ms-border-')">
      <xsl:variable name="border" select="substring-after($class, 'ms-border-')"/>
      <xsl:variable name="border-properties" select="str:tokenize($border, '-')"/>
      <xsl:variable name="border-location" select="$border-properties[1]" />
      <xsl:variable name="border-value" select="$border-properties[2]" />
      <xsl:variable name="border-color">
        <xsl:choose>
          <xsl:when test="string-length($border-properties[3]) > 0"><xsl:value-of select="$border-properties[3]"/></xsl:when>
          <xsl:otherwise>000000</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="border-size">
        <xsl:choose>
          <xsl:when test="string-length($border-properties[4]) > 0"><xsl:value-of select="$border-properties[4] * 6"/></xsl:when>
          <xsl:otherwise>6</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:element name="w:{$border-location}">
        <xsl:attribute name="w:val"><xsl:value-of select="$border-value" /></xsl:attribute>
        <xsl:attribute name="w:sz"><xsl:value-of select="$border-size" /></xsl:attribute>
        <xsl:attribute name="w:space">0</xsl:attribute>
        <xsl:attribute name="w:color"><xsl:value-of select="$border-color" /></xsl:attribute>
      </xsl:element>
    </xsl:if>
  </xsl:template>


</xsl:stylesheet>
