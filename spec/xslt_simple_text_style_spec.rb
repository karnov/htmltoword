require 'spec_helper'

describe "XSLT to make text bold or italic" do

  it "transforms simple b, strong, em and italic tags" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <div> Testing <b>bold</b>, <i>italic</i>, <strong>strong</strong>, <em>em</em> text within a div.</div>
    <p> Testing <b>bold</b>, <i>italic</i>, <strong>strong</strong>, <em>em</em> text within a p.</p>
    <span> Testing <b>bold</b>, <i>italic</i>, <strong>strong</strong>, <em>em</em> text within a span.</span>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Testing </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">italic</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve"> text within a div.</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Testing </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">italic</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve"> text within a p.</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Testing </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">italic</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve"> text within a span.</w:t>
    </w:r>
  </w:p>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms text color classes" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <div> Testing <span class="ms-text-color-eeeeee">grey</span> text</div>
    <p> Testing <span class="ms-text-color-eeeeee">grey</span> text</p>
    <span> Testing <span class="ms-text-color-eeeeee">grey</span> text</span>
    <div class="ms-text-color-000000">Testing black</div>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Testing </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:color w:val="eeeeee"/>
      </w:rPr>
      <w:t xml:space="preserve">grey</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve"> text</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Testing </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:color w:val="eeeeee"/>
      </w:rPr>
      <w:t xml:space="preserve">grey</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve"> text</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:r>
      <w:t xml:space="preserve"> Testing </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:color w:val="eeeeee"/>
      </w:rPr>
      <w:t xml:space="preserve">grey</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve"> text</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:r>
      <w:rPr>
        <w:color w:val="000000"/>
      </w:rPr>
      <w:t xml:space="preserve">Testing black</w:t>
    </w:r>
  </w:p>
    EOL
  compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms all combinations of b, strong, em and italic within div and p" do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <p>
      Combinations in p tag: <b><i>Bold italic</i></b>, <i><b>Italic bold</b></i>, <b><em>Bold em</em></b>,
      <em><b>Em bold</b></em>, <strong><i>Strong italic</i></strong>, <i><strong>Italic strong</strong></i>,
      <strong><em>Strong em</em></strong>, <em><strong>Em strong</strong></em>. Should be ok
    </p>
    <div>
      More on combinations : <b>Just bold. <i>Bold italic.</i> Again just bold</b>,
      <i>Just italic. <b>Italic bold.</b> Again just italic</i>,
      <b>Just bold. <em>Bold em</em> Again just bold</b>,
      <em>Just em. <b>Em bold.</b> Again just em</em>,
      <strong>Just Strong. <i>Strong italic. </i>Again just strong</strong>,
      <i>Just italic. <strong>Italic strong. </strong>Again just italic </i>,
      <strong>Just Strong. <em>Strong em. </em>Again just strong</strong>,
      <em>Just em. <strong>Em strong.</strong> Again just em</em>. Should be ok
    </div>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:r>
      <w:t xml:space="preserve">
Combinations in p tag: </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Bold italic</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Italic bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Bold em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Em bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Strong italic</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Italic strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Strong em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">, </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Em strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">. Should be ok
</w:t>
    </w:r>
  </w:p>
  <w:p>
    <w:r>
      <w:t xml:space="preserve">
More on combinations : </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Just bold. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Bold italic.</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve"> Again just bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">Just italic. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Italic bold.</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve"> Again just italic</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Just bold. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Bold em</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve"> Again just bold</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">Just em. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Em bold.</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve"> Again just em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Just Strong. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Strong italic. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Again just strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">Just italic. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Italic strong. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">Again just italic </w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Just Strong. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Strong em. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Again just strong</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">,
</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve">Just em. </w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:rPr>
        <w:b/>
      </w:rPr>
      <w:t xml:space="preserve">Em strong.</w:t>
    </w:r>
    <w:r>
      <w:rPr>
        <w:i/>
      </w:rPr>
      <w:t xml:space="preserve"> Again just em</w:t>
    </w:r>
    <w:r>
      <w:t xml:space="preserve">. Should be ok
</w:t>
    </w:r>
  </w:p>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it "transforms b, strong, em and italic within table cells" do
    html = <<-EOL
<!DOCTYPE html>
<html>
<head></head>
<body>
  <table class="table-bordered">
    <thead>
    <tr>
      <th>Column 1</th>
      <th>Column 2</th>
      <th>Column 3</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><strong>Row 1</strong></td>
      <td><em>Em text</em></td>
      <td><i>I text</i></td>
    </tr>
    <tr>
      <td><b>Row 2</b></td>
      <td>Text: <strong>Strong <em>Strong em </em> Strong </strong> <b>Bold tag <i>Bold italic</i> More bold. </b> End </td>
      <td>Text: <em> Just em <strong>Em strong text</strong> More em text </em> <i>Italic tag <b>Italic bold</b> More italic.</i>  End </td>
    </tr>
    <tr>
      <td><div><b>Row 2</b></div></td>
      <td><p>Text: <strong>Strong <em>Strong em </em> Strong </strong> <b>Bold tag <i>Bold italic</i> More bold. </b> End</p></td>
      <td>Td <div>Div <strong><i>Strong italic</i></strong></div> <b><em>Bold Em</em></b></td>
    </tr>
    <tr>
      <td>Td <span>Span</span> <div>A div</div> <strong><em>Strong em</em></strong></td>
      <td>Td <div>A div</div> <i>Span em</i></td>
      <td>Td <div>A div</div> <i><strong>Italic strong</strong></i></td>
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
            <w:t xml:space="preserve">Column 1</w:t>
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
            <w:t xml:space="preserve">Column 2</w:t>
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
            <w:t xml:space="preserve">Column 3</w:t>
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
            <w:t xml:space="preserve">Row 1</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve">Em text</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve">I text</w:t>
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
            <w:t xml:space="preserve">Row 2</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Text: </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong em </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"> Strong </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Bold tag </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Bold italic</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"> More bold. </w:t>
          </w:r>
          <w:r>
            <w:t xml:space="preserve"> End </w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Text: </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve"> Just em </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Em strong text</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve"> More em text </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve">Italic tag </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Italic bold</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve"> More italic.</w:t>
          </w:r>
          <w:r>
            <w:t xml:space="preserve">  End </w:t>
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
            <w:t xml:space="preserve">Row 2</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Text: </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong em </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"> Strong </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Bold tag </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Bold italic</w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve"> More bold. </w:t>
          </w:r>
          <w:r>
            <w:t xml:space="preserve"> End</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Td </w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Div </w:t>
          </w:r>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong italic</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Bold Em</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
    <w:tr>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Td </w:t>
          </w:r>
          <w:r>
            <w:t xml:space="preserve">Span</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">A div</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Strong em</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Td </w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">A div</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:t xml:space="preserve">Span em</w:t>
          </w:r>
        </w:p>
      </w:tc>
      <w:tc>
        <w:tcPr/>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">Td </w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:t xml:space="preserve">A div</w:t>
          </w:r>
        </w:p>
        <w:p>
          <w:r>
            <w:rPr>
              <w:i/>
            </w:rPr>
            <w:rPr>
              <w:b/>
            </w:rPr>
            <w:t xml:space="preserve">Italic strong</w:t>
          </w:r>
        </w:p>
      </w:tc>
    </w:tr>
  </w:tbl>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

end
