require 'spec_helper'

describe "XSLT for Links" do

  it "transforms heading tags in a div" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <a href="/internal">This is internal link.</a>
    <div>
      <a href="http://somelink.com">Link text.</a>
    </div>
    <div>
      <a href="https://someotherlink.com">Other link text.</a>
    </div>
    <div>
      <a href="/internal2">This is other internal link.</a>
    </div>
    <div>
      <a href="http://someotherlink2.com">Other link text 2.</a>
      <div>
        <a href="http://someotherlink3.com">Other link text 3.</a>
      </div> Some text <ul>
        <li>First item: <a href="http://listlink.com">List link text.</a></li>
      </ul>
    </div>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:r>
      <w:t xml:space=\"preserve\">This is internal link.</w:t>
    </w:r>
  </w:p><w:p>
    <w:hyperlink r:id="rId8">
      <w:r>
        <w:rPr>
          <w:rStyle w:val="Hyperlink"/>
          <w:color w:val="000080"/>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t xml:space="preserve">Link text.</w:t>
      </w:r>
    </w:hyperlink>
  </w:p><w:p>
    <w:hyperlink r:id="rId9">
      <w:r>
        <w:rPr>
          <w:rStyle w:val="Hyperlink"/>
          <w:color w:val="000080"/>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t xml:space="preserve">Other link text.</w:t>
      </w:r>
    </w:hyperlink>
  </w:p><w:p>
    <w:r>
      <w:t xml:space=\"preserve\">This is other internal link.</w:t>
    </w:r>
  </w:p><w:p>
    <w:hyperlink r:id=\"rId10\">
      <w:r>
        <w:rPr>
          <w:rStyle w:val=\"Hyperlink\"/>
          <w:color w:val="000080"/>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t xml:space=\"preserve\">Other link text 2.</w:t>
      </w:r>
    </w:hyperlink>
  </w:p><w:p>
    <w:hyperlink r:id=\"rId11\">
      <w:r>
        <w:rPr>
          <w:rStyle w:val=\"Hyperlink\"/>
          <w:color w:val="000080"/>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t xml:space=\"preserve\">Other link text 3.</w:t>
      </w:r>
    </w:hyperlink>
  </w:p><w:p>
    <w:r>
      <w:t xml:space="preserve"> Some text </w:t>
    </w:r>
  </w:p><w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">First item: </w:t>
    </w:r>
    <w:hyperlink r:id="rId12">
      <w:r>
        <w:rPr>
          <w:rStyle w:val="Hyperlink"/>
          <w:color w:val="000080"/>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t xml:space="preserve">List link text.</w:t>
      </w:r>
    </w:hyperlink>
  </w:p>
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
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="https://someotherlink.com" TargetMode="External" Id="rId9"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="http://someotherlink2.com" TargetMode="External" Id="rId10"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="http://someotherlink3.com" TargetMode="External" Id="rId11"/>
    <Relationship Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/hyperlink" Target="http://listlink.com" TargetMode="External" Id="rId12"/>
  </Relationships>
    EOL

    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
    compare_relations_xml(html, expected_relations_xml)
    check_link_text(html, expected_wordml)

  end
end
