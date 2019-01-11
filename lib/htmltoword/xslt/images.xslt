<xsl:stylesheet xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
                xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main"
                xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
                xmlns:mv="urn:schemas-microsoft-com:mac:vml"
                xmlns:o="urn:schemas-microsoft-com:office:office"
                xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
                xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
                xmlns:v="urn:schemas-microsoft-com:vml"
                xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
                xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
                xmlns:w10="urn:schemas-microsoft-com:office:word"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
                xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
                xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
                xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
                xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
                xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
                xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
                xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
                xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:WX="http://schemas.microsoft.com/office/word/2003/auxHint"
                xmlns:aml="http://schemas.microsoft.com/aml/2001/core"
                xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:ext="http://www.xmllab.net/wordml2html/ext"
                xmlns:java="http://xml.apache.org/xalan/java"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                mc:Ignorable="w14 w15 wp14 a14"
                version="1.0"
                exclude-result-prefixes="java msxsl ext w o v WX aml w10"
                extension-element-prefixes="func">

  <xsl:include href="./image_functions.xslt"/>

  <xsl:template match="img|body/img" name="image">
    <xsl:choose>
      <xsl:when test="not(@data-width) and not(@data-height) and not(contains(@style, 'width')) and not(contains(@style, 'height'))">
        <!-- Do not transfor images unless width and height are correctly specified -->
      </xsl:when>
      <xsl:otherwise>
        <w:drawing>
          <wp:inline distT="0" distB="0" distL="0" distR="0">
            <wp:extent>
              <xsl:call-template name="image-dimention-attributes"/>
            </wp:extent>
            <wp:effectExtent l="0" t="0" r="0" b="0"/>
            <wp:docPr>
              <xsl:attribute name="id"><xsl:value-of select="count(preceding::img)+1" /></xsl:attribute>
              <xsl:attribute name="name">Picture <xsl:value-of select="count(preceding::img)+1" /></xsl:attribute>
            </wp:docPr>
            <wp:cNvGraphicFramePr>
              <a:graphicFrameLocks noChangeAspect="1"/>
            </wp:cNvGraphicFramePr>
            <a:graphic>
              <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
                <pic:pic>
                  <pic:nvPicPr>
                    <pic:cNvPr>
                      <xsl:attribute name="id"><xsl:value-of select="count(preceding::img)+1" /></xsl:attribute>
                      <xsl:attribute name="title"><xsl:value-of select="@alt" /></xsl:attribute>
                      <xsl:attribute name="name"><xsl:call-template name="image-name">
                        <xsl:with-param name="source" select="@src"/>
                        <xsl:with-param name="data-filename" select="@data-filename"/>
                      </xsl:call-template></xsl:attribute>
                    </pic:cNvPr>
                    <pic:cNvPicPr/>
                  </pic:nvPicPr>
                  <pic:blipFill>
                    <a:blip>
                      <xsl:attribute name="r:embed"><xsl:call-template name="relationship-id"/></xsl:attribute>
                      <a:extLst>
                        <a:ext uri="{{28A0092B-C50C-407E-A947-70E740481C1C}}">
                          <a14:useLocalDpi val="0"/>
                        </a:ext>
                      </a:extLst>
                    </a:blip>
                    <a:stretch>
                      <a:fillRect/>
                    </a:stretch>
                  </pic:blipFill>
                  <pic:spPr>
                    <a:xfrm>
                      <a:off x="0" y="0"/>
                      <a:ext>
                        <xsl:call-template name="image-dimention-attributes"/>
                      </a:ext>
                    </a:xfrm>
                    <a:prstGeom prst="rect">
                      <a:avLst/>
                    </a:prstGeom>
                  </pic:spPr>
                </pic:pic>
              </a:graphicData>
            </a:graphic>
          </wp:inline>
        </w:drawing>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    A style specifiying the width and height is required to render an image correctly in word.
    Styles can be provided either via data attributes:
    img src="pathtosomeimage" data-width="200px" data-height="250px"

    or via the html style attribute
    img src="pathtosomeimage" style="width:150px;height:200px"

    If both a style and data attributes are provided then data attributes take president.
    e.g.
    img src="pathtosomeimage" data-width="200em" style="width:150px;height:200px"
    becomes: width:200em;height:200px

    Note: All sizes must be in pixles or em
  -->
  <xsl:template name="image-dimention-attributes">
    <xsl:attribute name="cx">
      <xsl:call-template name="image-dimention">
        <xsl:with-param name="style" select="@style" />
        <xsl:with-param name="data-value" select="@data-width" />
        <xsl:with-param name="type" select="'width'" />
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="cy">
      <xsl:call-template name="image-dimention">
        <xsl:with-param name="style" select="@style" />
        <xsl:with-param name="data-value" select="@data-height" />
        <xsl:with-param name="type" select="'height'" />
      </xsl:call-template>
    </xsl:attribute>
  </xsl:template>
</xsl:stylesheet>
