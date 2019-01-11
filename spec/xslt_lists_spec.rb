require 'spec_helper'

describe "XSLT supporting lists" do
  it "transforms a simple ol list" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <ol>
      <li>Item 1</li>
      <li>Item 2</li>
    </ol>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr> 
        <w:ilvl w:val="0"/> 
        <w:numId w:val="1"/> 
      </w:numPr> 
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 1</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 2</w:t>
    </w:r>
  </w:p>
    EOL
    expected_numbering_xml = <<-EOL
  <w:numbering>
    <w:abstractNum w:abstractNumId="0">
      <w:nsid w:val="099A08C1"/>
      <w:multiLevelType w:val="hybridMultilevel"/>
      <w:lvl w:ilvl="0">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%1."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="720" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="1">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%2."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="1440" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="2">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%3."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2160" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="3">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%4."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2880" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="4">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%5."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="3600" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="5">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%6."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="4320" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
    </w:abstractNum>
    <w:num w:numId="1">
      <w:abstractNumId w:val="0"/>
    </w:num>
  </w:numbering>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
    compare_numbering_xml(html, expected_numbering_xml)
  end

  it "transforms a simple ul list" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <ul>
      <li>Item 1</li>
      <li>Item 2</li>
    </ul>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 1</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 2</w:t>
    </w:r>
  </w:p>
    EOL
    expected_numbering_xml = <<-EOL
  <w:numbering>
    <w:abstractNum w:abstractNumId="0">
      <w:nsid w:val="099A08C1"/>
      <w:multiLevelType w:val="hybridMultilevel"/>
      <w:lvl w:ilvl="0">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="●"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="720" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="1">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="●"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="1440" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="2">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="●"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2160" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="3">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="●"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2880" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="4">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="●"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="3600" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="5">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="●"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="4320" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
    </w:abstractNum>
    <w:num w:numId="1">
      <w:abstractNumId w:val="0"/>
    </w:num>
  </w:numbering>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
    compare_numbering_xml(html, expected_numbering_xml)
  end

  it "transforms nested lists with styles" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <ol style="list-style-type: square;">
      <li>Item 1
        <ul class="num">
          <li>Sub item 1</li>
          <li>Sub item 2</li>
        </ul>
      </li>
      <li>Item 2
        <ol style="list-style-type: lower-latin;">
          <li>Item a
            <ol style="list-style-type: lower-roman;">
              <li>Item i</li>
              <li>Item ii</li>
            </ol>
          </li>
        </ol>
      </li>
      <li>Item 3</li>
    </ol>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 1 </w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="1"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Sub item 1</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="1"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Sub item 2</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 2 </w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="1"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item a </w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="2"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item i</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="2"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item ii</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 3</w:t>
    </w:r>
  </w:p>
    EOL
    expected_numbering_xml = <<-EOL
  <w:numbering>
    <w:abstractNum w:abstractNumId="0">
      <w:nsid w:val="099A08C1"/>
      <w:multiLevelType w:val="hybridMultilevel"/>
      <w:lvl w:ilvl="0">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="■"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="720" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="1">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%2."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="1440" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="1">
        <w:start w:val="1"/>
        <w:numFmt w:val="lowerLetter"/>
        <w:lvlText w:val="%2."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="1440" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="2">
        <w:start w:val="1"/>
        <w:numFmt w:val="lowerRoman"/>
        <w:lvlText w:val="%3."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2160" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="3">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="■"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2880" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="4">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="■"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="3600" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
      <w:lvl w:ilvl="5">
        <w:start w:val="1"/>
        <w:numFmt w:val="bullet"/>
        <w:lvlText w:val="■"/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="4320" w:hanging="360"/>
        </w:pPr>
        <w:rPr>
          <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
        </w:rPr>
      </w:lvl>
    </w:abstractNum>
    <w:num w:numId="1">
      <w:abstractNumId w:val="0"/>
    </w:num>
  </w:numbering>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
    compare_numbering_xml(html, expected_numbering_xml)
  end

  it 'restarts the counter on new list' do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <ol>
      <li>Item 1</li>
      <li>Item 2</li>
    </ol>
    <ol>
      <li>New Item 1</li>
      <li>New Item 2</li>
    </ol>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 1</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="1"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">Item 2</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="2"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">New Item 1</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:pPr>
      <w:pStyle w:val="ListParagraph"/>
      <w:numPr>
        <w:ilvl w:val="0"/>
        <w:numId w:val="2"/>
      </w:numPr>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">New Item 2</w:t>
    </w:r>
  </w:p>
    EOL
    expected_numbering_xml = <<-EOL
  <w:numbering>
    <w:abstractNum w:abstractNumId="0">
      <w:nsid w:val="099A08C1"/>
      <w:multiLevelType w:val="hybridMultilevel"/>
      <w:lvl w:ilvl="0">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%1."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="720" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="1">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%2."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="1440" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="2">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%3."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2160" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="3">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%4."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2880" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="4">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%5."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="3600" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="5">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%6."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="4320" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
    </w:abstractNum>
    <w:abstractNum w:abstractNumId="1">
      <w:nsid w:val="099A08C2"/>
      <w:multiLevelType w:val="hybridMultilevel"/>
      <w:lvl w:ilvl="0">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%1."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="720" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="1">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%2."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="1440" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="2">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%3."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2160" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="3">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%4."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="2880" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="4">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%5."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="3600" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
      <w:lvl w:ilvl="5">
        <w:start w:val="1"/>
        <w:numFmt w:val="decimal"/>
        <w:lvlText w:val="%6."/>
        <w:lvlJc w:val="left"/>
        <w:pPr>
          <w:ind w:left="4320" w:hanging="360"/>
        </w:pPr>
      </w:lvl>
    </w:abstractNum>
    <w:num w:numId="1">
      <w:abstractNumId w:val="0"/>
    </w:num>
    <w:num w:numId="2">
      <w:abstractNumId w:val="1"/>
    </w:num>
  </w:numbering>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
    compare_numbering_xml(html, expected_numbering_xml)
  end

  it 'handles inline elements inside a div' do
    compare_transformed_files(
      test: 'lists',
      test_file_name: 'lists_inline_elements',
      extras: false
    )
  end
end
