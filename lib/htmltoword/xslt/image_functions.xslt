<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
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

  <!-- template as function used to return the file extension of an image. -->
  <xsl:template name="image-extension">
    <xsl:param name="data-filename" select="." />
    <xsl:param name="source" select="." />
    <xsl:variable name="filename">
      <xsl:call-template name="image-name">
        <xsl:with-param name="source" select="$source"/>
        <xsl:with-param name="data-filename" select="$data-filename"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="substring-after($filename,'.')"/>
  </xsl:template>

  <!-- template as function used to return the name of an image. -->
  <xsl:template name="image-name">
    <xsl:param name="data-filename" select="." />
    <xsl:param name="source" select="." />
    <xsl:choose>
      <xsl:when test="string-length($data-filename) > 0">
        <xsl:value-of select="$data-filename"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="extract-filename-from-path">
          <xsl:with-param name="path" select="$source"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- template as function used to extract the filename from the image source. Can't use tokenize or other functions which return a fragment tree as xpath can't process them. -->
  <xsl:template name="extract-filename-from-path">
      <xsl:param name="path" select="." />
      <xsl:choose>
        <xsl:when test="not(contains($path, '/'))">
            <xsl:value-of select="$path" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="extract-filename-from-path">
            <xsl:with-param name="path" select="substring-after($path, '/')" />
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <!--
    Returns the unqualified dimension from a length specification copied from:
  http://docbook.sourceforge.net/release/xsl/1.76.1/doc/lib/length-magnitude.html
   -->

  <xsl:template name="length-magnitude">
    <xsl:param name="length" select="'0pt'"></xsl:param>

    <xsl:choose>
      <xsl:when test="string-length($length) = 0"></xsl:when>
      <xsl:when test="substring($length,1,1) = '0' or substring($length,1,1) = '1'                                      or substring($length,1,1) = '2' or substring($length,1,1) = '3'                                      or substring($length,1,1) = '4' or substring($length,1,1) = '5'                                      or substring($length,1,1) = '6' or substring($length,1,1) = '7'                                      or substring($length,1,1) = '8' or substring($length,1,1) = '9'                                      or substring($length,1,1) = '.'">
        <xsl:value-of select="substring($length,1,1)"></xsl:value-of>
        <xsl:call-template name="length-magnitude">
          <xsl:with-param name="length" select="substring($length,2)"></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>




  <!-- Convert em and pixel sizes to inches. Inspired by from:
  http://docbook.sourceforge.net/release/xsl/1.76.1/doc/lib/length-in-points.html
  EMU info from:  https://startbigthinksmall.wordpress.com/2010/01/04/points-inches-and-emus-measuring-units-in-office-open-xml/
   -->
  <xsl:template name="length-in-emus">
    <xsl:param name="length" select="'0px'"/>
    <xsl:param name="em.size" select="6.02250006023"/>
    <xsl:param name="pixels.per.inch" select="90"/>
    <xsl:variable name="emus.per.inch" select="914400"/>

    <xsl:variable name="magnitude">
      <xsl:call-template name="length-magnitude">
        <xsl:with-param name="length" select="$length"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="units">
      <xsl:value-of select="substring($length, string-length($magnitude)+1)"/>
    </xsl:variable>

    <xsl:variable name="inches">
      <xsl:choose>
        <xsl:when test="$units = 'px'">
          <xsl:value-of select="$magnitude div $pixels.per.inch"/>
        </xsl:when>
        <xsl:when test="$units = 'em'">
          <xsl:value-of select="$magnitude div $em.size"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message>
            <xsl:text>Unrecognized unit of measure: </xsl:text>
            <xsl:value-of select="$units"></xsl:value-of>
            <xsl:text>.</xsl:text>
          </xsl:message>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:value-of select="$inches * $emus.per.inch"/>
  </xsl:template>

  <!-- template as function used to get the width or height of an image in points. -->
  <xsl:template name="image-dimention">
    <xsl:param name="style" />
    <xsl:param name="data-value" />
    <xsl:param name="type" />

    <xsl:variable name="size">
      <xsl:choose>
        <xsl:when test="string-length($data-value) > 0">
          <xsl:value-of select="$data-value" />
        </xsl:when>
        <xsl:when test="contains($style, concat($type,':'))">
          <xsl:value-of select="translate(str:tokenize(substring-after($style, concat($type,':')), ';')[1],'&#x20;&#x9;&#xD;&#xA;','')" />
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="length-in-emus">
      <xsl:with-param name="length" select="$size"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
