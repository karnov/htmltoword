require 'spec_helper'

describe "XSLT for tables" do

  it "transforms a table into a tbl element" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table>
      <tbody>
        <tr>
          <td>Hello</td>
        </tr>
      </tbody>
    </table>
  </body>
  </html>
      EOL
    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Hello</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms a nested table" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table>
      <tbody>
      <tr>
        <td>Cell 1,1</td>
        <td>
          <table>
            <tbody>
            <tr>
              <td>Nested</td>
              <td>Table</td>
            </tr>
            </tbody>
          </table>
        </td>
        <td>Cell 1,3</td>
      </tr>
      </tbody>
    </table>
  </body>
  </html>
      EOL
    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Cell 1,1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:tbl>
          <w:tblPr>
            <w:tblStyle w:val="TableGrid"/>
            <w:tblW w:w="5000" w:type="pct"/>
            <w:tblBorders>
              <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
              <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
            </w:tblBorders>
            <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
          </w:tblPr>
          <w:tr>
            <w:tc>
              <w:tcPr/>
              <w:p>
                <w:r>
                  <w:t xml:space="preserve">Nested</w:t>
                </w:r>
              </w:p>
            </w:tc>
            <w:tc>
              <w:tcPr/>
              <w:p>
                <w:r>
                  <w:t xml:space="preserve">Table</w:t>
                </w:r>
              </w:p>
            </w:tc>
          </w:tr>
        </w:tbl>
        <w:p/>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Cell 1,3</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms tables with empty cells" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table>
    <tbody>
    <tr>
      <td><strong>Cell 1,1</strong></td>
      <td/>
    </tr>
    </tbody>
  </table>
  </body>
  </html>
      EOL
      expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Cell 1,1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p/>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transform tables with empty headers" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table>
      <thead>
      <tr>
        <th/>
        <th>Header 2</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td><strong>Cell 1,1</strong></td>
        <td>Cell 1,2</td>
      </tr>
      </tbody>
    </table>
  </body>
  </html>
      EOL
      expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"/>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Header 2</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Cell 1,1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Cell 1,2</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms tables without <tr> tag on <thead>" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table border="1">
      <thead>
        <th>Header 1</th>
        <th/>
      </thead>
      <tbody>
      <tr>
        <td><strong>Cell 1,1</strong></td>
        <td>Cell 1,2</td>
      </tr>
      </tbody>
    </table>
  </body>
  </html>
      EOL
    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:left w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:bottom w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:right w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideH w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideV w:val="single" w:sz="6" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Header 1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"/>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Cell 1,1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Cell 1,2</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms tables with border attribute and table-bordered class" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
  <table border="1">
  <tbody>
    <tr>
      <td>Hello</td>
      <td>World</td>
    </tr>
  </tbody>
  </table>
  Using table-bordered class
  <table class="table-bordered">
  <tbody>
    <tr>
      <td>Hello world</td>
      <td>Part 2</td>
    </tr>
  </tbody>
  </table>
  </body>
  </html>
      EOL

    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:left w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:bottom w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:right w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideH w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideV w:val="single" w:sz="6" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Hello</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">World</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Using table-bordered class </w:t>
    </w:r>
  </w:p>
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:left w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:bottom w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:right w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideH w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideV w:val="single" w:sz="6" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Hello world</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Part 2</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms nested elements inside table cells" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table class="table-bordered">
      <tbody>
        <tr>
          <td>Pre H1 <h1>This is a H1</h1> Post H1</td>
          <td>Text <p>A paragraph with <strong>Strong</strong> text</p> More text</td>
        </tr>
        <tr>
          <td><div>Some content <em>inside</em> a <strong>div</strong></div></td>
          <td/>
        </tr>
        <tr>
          <td>Something <p> Inside a p<strong> strong <em> and strong em </em></strong></p></td>
          <td><div>Text inside div</div></td>
        </tr>
      </tbody>
    </table>
  </body>
  </html>
      EOL
    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:left w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:bottom w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:right w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideH w:val="single" w:sz="6" w:space="0" w:color="auto"/>
        <w:insideV w:val="single" w:sz="6" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Pre H1 </w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:pPr>
            <w:pStyle w:val="Heading1"/>
          </w:pPr>
          <w:r>
            <w:t xml:space="preserve">This is a H1</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve"> Post H1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Text </w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">A paragraph with </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong</w:t>
          </w:r>
          <w:r>
            <w:t xml:space="preserve"> text</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve"> More text</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Some content </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve">inside</w:t>
          </w:r>
          <w:r>
            <w:t xml:space="preserve"> a </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">div</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p/>
      </w:tc>
    </w:tr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Something </w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve"> Inside a p</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"> strong </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"> and strong em </w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Text inside div</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
      EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "handles cell borders" do
    html = <<-EOL
    <!DOCTYPE html>
    <html>
    <head></head>
    <body>
      <table>
        <tbody>
          <tr>
            <td>Sum total</td>
            <td class="ms-fill-C3C3C3">:</td>
            <td class="ms-border-bottom-dashed-red ms-border-right-single">1.000.000</td>
          </tr>
        </tbody>
      </table>
    </body>
    </html>
  EOL
    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Sum total</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr>
          <w:shd w:val="clear" w:color="auto" w:fill="C3C3C3"/>
        </w:tcPr>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">:</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr>
          <w:tcBorders>
            <w:bottom w:val="dashed" w:sz="6" w:space="0" w:color="red"/>
            <w:right w:val="single" w:sz="6" w:space="0" w:color="000000"/>
          </w:tcBorders>
        </w:tcPr>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">1.000.000</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip, extras: false)
  end

  it "transforms a colspan into a gridSpan table cell property" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <table>
      <tbody>
        <tr>
          <td colspan='4'>Hello</td>
        </tr>
      </tbody>
    </table>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:tbl>
    <w:tblPr>
      <w:tblStyle w:val="TableGrid"/>
      <w:tblW w:w="5000" w:type="pct"/>
      <w:tblBorders>
        <w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
        <w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
      </w:tblBorders>
      <w:tblLook w:val="0600" w:firstRow="0" w:lastRow="0" w:firstColumn="0" w:lastColumn="0" w:noHBand="1" w:noVBand="1"/>
    </w:tblPr>
    <w:tr>
      <w:tc>
        <w:tcPr>
          <w:gridSpan w:val="4"/>
        </w:tcPr>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Hello</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end
end
