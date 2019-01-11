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
  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes" indent="yes" />
  <xsl:include href="./functions.xslt"/>
  <xsl:include href="./tables.xslt"/>
  <xsl:include href="./links.xslt"/>
  <xsl:include href="./images.xslt"/>
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="head" />

  <xsl:template match="body">
    <xsl:comment>
      KNOWN BUGS:
      div
        h2
        div
          textnode (WONT BE WRAPPED IN A W:P)
          div
            table
            span
              text
    </xsl:comment>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="body/*[not(*)]">
    <w:p>
      <xsl:call-template name="text-alignment" />
      <w:r>
        <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
      </w:r>
    </w:p>
  </xsl:template>


  <xsl:template match="br[not(ancestor::p) and not(ancestor::div) and not(ancestor::td|ancestor::li) or
                          (preceding-sibling::div or following-sibling::div or preceding-sibling::p or following-sibling::p)]">
    <w:p>
      <w:r></w:r>
    </w:p>
  </xsl:template>

  <xsl:template match="br[(ancestor::li or ancestor::td) and
                          (preceding-sibling::div or following-sibling::div or preceding-sibling::p or following-sibling::p)]">
    <w:r>
      <w:br />
    </w:r>
  </xsl:template>

  <xsl:template match="br">
    <w:r>
      <w:br />
    </w:r>
  </xsl:template>

  <xsl:template match="pre">
    <w:p>
      <xsl:apply-templates />
    </w:p>
  </xsl:template>

  <xsl:template match="div[not(ancestor::li) and not(ancestor::td) and not(ancestor::th) and not(ancestor::p) and not(ancestor::dl) and not(descendant::dl) and not(descendant::div) and not(descendant::p) and not(descendant::h1) and not(descendant::h2) and not(descendant::h3) and not(descendant::h4) and not(descendant::h5) and not(descendant::h6) and not(descendant::table) and not(descendant::li) and not (descendant::pre)]">
    <xsl:comment>Divs should create a p if nothing above them has and nothing below them will</xsl:comment>
    <w:p>
      <xsl:call-template name="text-alignment" />
      <xsl:apply-templates />
    </w:p>
  </xsl:template>

  <xsl:template match="div">
    <xsl:apply-templates />
  </xsl:template>

  <!-- TODO: make this prettier. Headings shouldn't enter in template from L51 -->
  <xsl:template match="body/h1|body/h2|body/h3|body/h4|body/h5|body/h6|h1|h2|h3|h4|h5|h6">
    <xsl:variable name="length" select="string-length(name(.))"/>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="Heading{substring(name(.),$length)}"/>
      </w:pPr>
      <w:r>
        <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
      </w:r>
    </w:p>
  </xsl:template>

  <xsl:template match="p[not(ancestor::li)]">
    <w:p>
      <xsl:call-template name="text-alignment" />
      <xsl:apply-templates />
    </w:p>
  </xsl:template>

  <xsl:template match="ol|ul">
    <xsl:param name="global_level" select="count(preceding::ol[not(ancestor::ol or ancestor::ul)]) + count(preceding::ul[not(ancestor::ol or ancestor::ul)]) + 1"/>
    <xsl:apply-templates>
      <xsl:with-param name="global_level" select="$global_level" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="listItem" match="li">
    <xsl:param name="global_level" />
    <xsl:param name="preceding-siblings" select="0"/>
    <xsl:for-each select="node()">
      <xsl:choose>
        <xsl:when test="self::br">
          <w:p>
            <w:pPr>
              <w:pStyle w:val="ListParagraph"></w:pStyle>
              <w:numPr>
                <w:ilvl w:val="0"/>
                <w:numId w:val="0"/>
              </w:numPr>
            </w:pPr>
            <w:r></w:r>
          </w:p>
        </xsl:when>
        <xsl:when test="self::ol|self::ul">
          <xsl:apply-templates>
            <xsl:with-param name="global_level" select="$global_level" />
          </xsl:apply-templates>
        </xsl:when>
        <xsl:when test="not(descendant::li)"> <!-- simpler div, p, headings, etc... -->
          <xsl:variable name="ilvl" select="count(ancestor::ol) + count(ancestor::ul) - 1"></xsl:variable>
          <xsl:choose>
            <xsl:when test="$preceding-siblings + count(preceding-sibling::*) > 0">
              <w:p>
                <w:pPr>
                  <w:pStyle w:val="ListParagraph"></w:pStyle>
                  <w:numPr>
                    <w:ilvl w:val="0"/>
                    <w:numId w:val="0"/>
                  </w:numPr>
                  <w:ind w:left="{720 * ($ilvl + 1)}"/>
                </w:pPr>
                <xsl:apply-templates/>
              </w:p>
            </xsl:when>
            <xsl:otherwise>
              <w:p>
                <w:pPr>
                  <w:pStyle w:val="ListParagraph"></w:pStyle>
                  <w:numPr>
                    <w:ilvl w:val="{$ilvl}"/>
                    <w:numId w:val="{$global_level}"/>
                  </w:numPr>
                </w:pPr>
                <xsl:apply-templates/>
              </w:p>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise> <!-- mixed things div having list and stuff content... -->
          <xsl:call-template name="listItem">
            <xsl:with-param name="global_level" select="$global_level" />
            <xsl:with-param name="preceding-siblings" select="$preceding-siblings + count(preceding-sibling::*)" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="dl">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dt">
    <w:p>
      <xsl:apply-templates/>
    </w:p>
  </xsl:template>

  <xsl:template match="dd">
    <w:p>
      <w:pPr>
        <w:ind w:left="720"/>
      </w:pPr>
      <xsl:apply-templates/>
    </w:p>
  </xsl:template>

  <xsl:template match="span[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |a[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |small[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |strong[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |em[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |i[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |b[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]
    |u[not(ancestor::td) and not(ancestor::li) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]">
    <xsl:comment>
        In the following situation:

        div
          h2
          span
            textnode
            span
              textnode
          p

        The div template will not create a w:p because the div contains a h2. Therefore we need to wrap the inline elements span|a|small in a p here.
      </xsl:comment>
    <w:p>
      <xsl:choose>
        <xsl:when test="self::a[starts-with(@href, 'http://') or starts-with(@href, 'https://')]">
          <xsl:call-template name="link" />
        </xsl:when>
        <xsl:when test="self::img">
          <xsl:comment>
            This template adds images.
          </xsl:comment>
          <xsl:call-template name="image"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </w:p>
  </xsl:template>

  <xsl:template match="text()[not(parent::li) and not(parent::td) and not(parent::pre) and (preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div)]">
    <xsl:comment>
        In the following situation:

        div
          h2
          textnode
          p

        The div template will not create a w:p because the div contains a h2. Therefore we need to wrap the textnode in a p here.
      </xsl:comment>
    <w:p>
      <w:r>
        <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
      </w:r>
    </w:p>
  </xsl:template>

  <xsl:template match="span[contains(concat(' ', @class, ' '), ' h ')]">
    <xsl:comment>
        This template adds MS Word highlighting ability.
      </xsl:comment>
    <xsl:variable name="color">
      <xsl:choose>
        <xsl:when test="./@data-style='pink'">magenta</xsl:when>
        <xsl:when test="./@data-style='blue'">cyan</xsl:when>
        <xsl:when test="./@data-style='orange'">darkYellow</xsl:when>
        <xsl:otherwise><xsl:value-of select="./@data-style"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="preceding-sibling::h1 or preceding-sibling::h2 or preceding-sibling::h3 or preceding-sibling::h4 or preceding-sibling::h5 or preceding-sibling::h6 or preceding-sibling::table or preceding-sibling::p or preceding-sibling::ol or preceding-sibling::ul or preceding-sibling::div or following-sibling::h1 or following-sibling::h2 or following-sibling::h3 or following-sibling::h4 or following-sibling::h5 or following-sibling::h6 or following-sibling::table or following-sibling::p or following-sibling::ol or following-sibling::ul or following-sibling::div">
        <w:p>
          <w:r>
            <w:rPr>
              <w:highlight w:val="{$color}"/>
            </w:rPr>
            <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
          </w:r>
        </w:p>
      </xsl:when>
      <xsl:otherwise>
        <w:r>
          <w:rPr>
            <w:highlight w:val="{$color}"/>
          </w:rPr>
          <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
        </w:r>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="div[contains(concat(' ', @class, ' '), ' -page-break ')]">
    <w:p>
      <w:r>
        <w:br w:type="page" />
      </w:r>
    </w:p>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="details" />

  <xsl:template match="text()">
    <xsl:if test="string-length(.) > 0">
      <w:r>
        <xsl:if test="ancestor::i">
          <w:rPr>
            <w:i />
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::b">
          <w:rPr>
            <w:b />
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::u">
          <w:rPr>
            <w:u w:val="single"/>
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::s">
          <w:rPr>
            <w:strike w:val="true"/>
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::sub">
          <w:rPr>
            <w:vertAlign w:val="subscript"/>
          </w:rPr>
        </xsl:if>
        <xsl:if test="ancestor::sup">
          <w:rPr>
            <w:vertAlign w:val="superscript"/>
          </w:rPr>
        </xsl:if>
        <xsl:if test="contains(../@class, 'ms-text-color-')">
          <w:rPr>
            <xsl:variable name="text-color" select="str:tokenize(substring-after(../@class, 'ms-text-color-'), ' ')[1]"/>
            <w:color w:val="{$text-color}"/>
          </w:rPr>
        </xsl:if>
        <w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
      </w:r>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template name="text-alignment">
    <xsl:param name="class" select="@class" />
    <xsl:param name="style" select="@style" />
    <xsl:variable name="alignment">
      <xsl:choose>
        <xsl:when test="contains(concat(' ', $class, ' '), ' center ') or contains(translate(normalize-space($style),' ',''), 'text-align:center')">center</xsl:when>
        <xsl:when test="contains(concat(' ', $class, ' '), ' right ') or contains(translate(normalize-space($style),' ',''), 'text-align:right')">right</xsl:when>
        <xsl:when test="contains(concat(' ', $class, ' '), ' left ') or contains(translate(normalize-space($style),' ',''), 'text-align:left')">left</xsl:when>
        <xsl:when test="contains(concat(' ', $class, ' '), ' justify ') or contains(translate(normalize-space($style),' ',''), 'text-align:justify')">both</xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length(normalize-space($alignment)) > 0">
      <w:pPr>
        <w:jc w:val="{$alignment}"/>
      </w:pPr>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
