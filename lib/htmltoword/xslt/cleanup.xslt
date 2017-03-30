<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                version="1.0"
                exclude-result-prefixes="java msxsl ext w o v WX aml w10"
                extension-element-prefixes="func">
  <xsl:output method="html" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="head"/>

  <!-- Elements not supported -->
  <xsl:template match="applet"/>
  <xsl:template match="area"/>
  <xsl:template match="audio"/>
  <xsl:template match="base"/>
  <xsl:template match="basefont"/>
  <xsl:template match="canvas"/>
  <xsl:template match="command"/>
  <xsl:template match="font"/>
  <xsl:template match="iframe"/>
  <xsl:template match="isindex"/>
  <xsl:template match="map"/>
  <xsl:template match="noframes"/>
  <xsl:template match="noscript"/>
  <xsl:template match="object"/>
  <xsl:template match="param"/>
  <xsl:template match="script"/>
  <xsl:template match="source"/>
  <xsl:template match="style"/>
  <xsl:template match="video"/>

  <!-- Elements currently being handled as normal text. Remove tags only -->
  <xsl:template match="abbr"><xsl:apply-templates/></xsl:template>
  <xsl:template match="acronym"><xsl:apply-templates/></xsl:template>
  <xsl:template match="bdi"><xsl:apply-templates/></xsl:template>
  <xsl:template match="bdo"><xsl:apply-templates/></xsl:template>
  <xsl:template match="big"><xsl:apply-templates/></xsl:template>
  <xsl:template match="code"><xsl:apply-templates/></xsl:template>
  <xsl:template match="kbd"><xsl:apply-templates/></xsl:template>
  <xsl:template match="samp"><xsl:apply-templates/></xsl:template>
  <xsl:template match="small"><xsl:apply-templates/></xsl:template>
  <xsl:template match="tt"><xsl:apply-templates/></xsl:template>
  <xsl:template match="var"><xsl:apply-templates/></xsl:template>

  <!-- Inline elements transformations -->
  <xsl:template match="cite"><i><xsl:apply-templates/></i></xsl:template>
  <xsl:template match="del"><s><xsl:apply-templates/></s></xsl:template>
  <xsl:template match="dfn"><i><xsl:apply-templates/></i></xsl:template>
  <xsl:template match="em"><i><xsl:apply-templates/></i></xsl:template>
  <xsl:template match="ins"><u><xsl:apply-templates/></u></xsl:template>
  <xsl:template match="mark"><span class="h" data-style="yellow"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="q">"<xsl:apply-templates/>"</xsl:template>
  <xsl:template match="strike"><s><xsl:apply-templates/></s></xsl:template>
  <xsl:template match="strong"><b><xsl:apply-templates/></b></xsl:template>

  <!-- Block elements transformations -->
  <xsl:template match="section"><div class="{@class}" style="{@style}"><xsl:apply-templates/></div></xsl:template>
  <xsl:template match="article"><div  class="{@class}" style="{@style}"><xsl:apply-templates/></div></xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
