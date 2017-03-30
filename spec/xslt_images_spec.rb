require 'spec_helper'

describe "XSLT to include images" do
  it "generates correct image wordml from html" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <p><img src="https://placehold.it/250x100.png" alt="Fancy image description" style="width: 250px; height: 100px"></p>
    <p><img src="https://placehold.it/250x100.png" data-filename="image.jpg" style="height:100px; width:250px; margin-left:10px"></p>
    <p><img src="https://placehold.it/150x100.png" data-width="150px" style="width:250px; height:100px"></p>
    <p><img src="https://placehold.it/250x150.png" data-height="150px" style="width:250px; height:100px"></p>
    <p><img src="https://placehold.it/150x150.png" data-width="150px" data-height="150px" style="width:250px; height:100px"></p>
    <p><img src="https://placehold.it/150x150.png" data-width="150px" data-height="150px"></p>
    </body>
  </html>
    EOL

    expected_wordml = <<-EOL
    <w:p>
    <w:drawing>
      <wp:inline distT="0" distB="0" distL="0" distR="0">
        <wp:extent cx="2540000" cy="1016000"/>
        <wp:effectExtent l="0" t="0" r="0" b="0"/>
        <wp:docPr id="1" name="Picture 1"/>
        <wp:cNvGraphicFramePr>
          <a:graphicFrameLocks noChangeAspect="1"/>
        </wp:cNvGraphicFramePr>
        <a:graphic>
          <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
            <pic:pic>
              <pic:nvPicPr>
                <pic:cNvPr id="1" title="Fancy image description" name="250x100.png"/>
                <pic:cNvPicPr/>
              </pic:nvPicPr>
              <pic:blipFill>
                <a:blip r:embed="rId8">
                  <a:extLst>
                    <a:ext uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
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
                  <a:ext cx="2540000" cy="1016000"/>
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
    </w:p>
    <w:p>
    <w:drawing>
      <wp:inline distT="0" distB="0" distL="0" distR="0">
        <wp:extent cx="2540000" cy="1016000"/>
        <wp:effectExtent l="0" t="0" r="0" b="0"/>
        <wp:docPr id="2" name="Picture 2"/>
        <wp:cNvGraphicFramePr>
          <a:graphicFrameLocks noChangeAspect="1"/>
        </wp:cNvGraphicFramePr>
        <a:graphic>
          <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
            <pic:pic>
              <pic:nvPicPr>
                <pic:cNvPr id="2" title="" name="image.jpg"/>
                <pic:cNvPicPr/>
              </pic:nvPicPr>
              <pic:blipFill>
                <a:blip r:embed="rId9">
                  <a:extLst>
                    <a:ext uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
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
                  <a:ext cx="2540000" cy="1016000"/>
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
    </w:p>
    <w:p>
    <w:drawing>
      <wp:inline distT="0" distB="0" distL="0" distR="0">
        <wp:extent cx="1524000" cy="1016000"/>
        <wp:effectExtent l="0" t="0" r="0" b="0"/>
        <wp:docPr id="3" name="Picture 3"/>
        <wp:cNvGraphicFramePr>
          <a:graphicFrameLocks noChangeAspect="1"/>
        </wp:cNvGraphicFramePr>
        <a:graphic>
          <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
            <pic:pic>
              <pic:nvPicPr>
                <pic:cNvPr id="3" title="" name="150x100.png"/>
                <pic:cNvPicPr/>
              </pic:nvPicPr>
              <pic:blipFill>
                <a:blip r:embed="rId10">
                  <a:extLst>
                    <a:ext uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
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
                  <a:ext cx="1524000" cy="1016000"/>
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
    </w:p>
    <w:p>
    <w:drawing>
      <wp:inline distT="0" distB="0" distL="0" distR="0">
        <wp:extent cx="2540000" cy="1524000"/>
        <wp:effectExtent l="0" t="0" r="0" b="0"/>
        <wp:docPr id="4" name="Picture 4"/>
        <wp:cNvGraphicFramePr>
          <a:graphicFrameLocks noChangeAspect="1"/>
        </wp:cNvGraphicFramePr>
        <a:graphic>
          <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
            <pic:pic>
              <pic:nvPicPr>
                <pic:cNvPr id="4" title="" name="250x150.png"/>
                <pic:cNvPicPr/>
              </pic:nvPicPr>
              <pic:blipFill>
                <a:blip r:embed="rId11">
                  <a:extLst>
                    <a:ext uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
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
                  <a:ext cx="2540000" cy="1524000"/>
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
    </w:p>
    <w:p>
    <w:drawing>
      <wp:inline distT="0" distB="0" distL="0" distR="0">
        <wp:extent cx="1524000" cy="1524000"/>
        <wp:effectExtent l="0" t="0" r="0" b="0"/>
        <wp:docPr id="5" name="Picture 5"/>
        <wp:cNvGraphicFramePr>
          <a:graphicFrameLocks noChangeAspect="1"/>
        </wp:cNvGraphicFramePr>
        <a:graphic>
          <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
            <pic:pic>
              <pic:nvPicPr>
                <pic:cNvPr id="5" title="" name="150x150.png"/>
                <pic:cNvPicPr/>
              </pic:nvPicPr>
              <pic:blipFill>
                <a:blip r:embed="rId12">
                  <a:extLst>
                    <a:ext uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
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
                  <a:ext cx="1524000" cy="1524000"/>
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
    </w:p>
    <w:p>
    <w:drawing>
      <wp:inline distT="0" distB="0" distL="0" distR="0">
        <wp:extent cx="1524000" cy="1524000"/>
        <wp:effectExtent l="0" t="0" r="0" b="0"/>
        <wp:docPr id="6" name="Picture 6"/>
        <wp:cNvGraphicFramePr>
          <a:graphicFrameLocks noChangeAspect="1"/>
        </wp:cNvGraphicFramePr>
        <a:graphic>
          <a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
            <pic:pic>
              <pic:nvPicPr>
                <pic:cNvPr id="6" title="" name="150x150.png"/>
                <pic:cNvPicPr/>
              </pic:nvPicPr>
              <pic:blipFill>
                <a:blip r:embed="rId13">
                  <a:extLst>
                    <a:ext uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
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
                  <a:ext cx="1524000" cy="1524000"/>
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
    </w:p>
    EOL


    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end


  it "generates correct relations" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <p><a href="http://somelink.com">Link text.</a></p>
    <p><img src="http://placehold.it/350x150.gif" style="width:350px;height:150px"></p>
    <p><a href="http://someotherlink2.com">Other link text 2.</a></p>
    <p><img src="http://placehold.it/400x250.png" data-filename="placeholder.png" style="width:450px;height:250px"></p>
    <p><img src="http://placehold.it/400x250.jpg" style="width:400px;height:250px"></p>
  </body>
  </html>
    EOL
    expected_relations_xml = <<-EOL
  <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
    <Relationship Id="rId3" Type="http://schemas.microsoft.com/office/2007/relationships/stylesWithEffects" Target="stylesWithEffects.xml"/>
    <Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings" Target="settings.xml"/>
    <Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings" Target="webSettings.xml"/>
    <Relationship Id="rId6" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable" Target="fontTable.xml"/>
    <Relationship Id="rId7" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="theme/theme1.xml"/>
    <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering" Target="numbering.xml"/>
    <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="http://somelink.com" TargetMode="External" Id="rId8"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/image1.gif" Id="rId9"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="http://someotherlink2.com" TargetMode="External" Id="rId10"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/image2.png" Id="rId11"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/image3.jpg" Id="rId12"/>
  </Relationships>
    EOL
    compare_relations_xml(html, expected_relations_xml)
  end
end
