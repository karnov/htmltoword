require 'spec_helper'

describe 'Bigger and a bit more complex documents' do

  it 'transforms documents with nested tables and normal lists and extra classes' do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
    <h1>My Document</h1>
    <div class="pp-clause pp-prologue notable zoomable" id="PP0040850_PR0040858">
      <h2><b class="clause_title">Section 1</b></h2>
      <div class="precedent-element ann pactable notable" id="PP0040850_AL0040859">
        <h3>&nbsp;</h3>
        <b class="clause_title">Subsection 1.1</b>
        <div class="ppTextPosition annzone">
          <div id="PP_1" class="N4 ann annzone">Lorem</div>
          <div id="PP_9" class="N4 ann annzone">Ipsum: # </div>
          <div id="PP_10" class="N4 ann annzone">dolor: # </div>
          <div id="PP_11" class="N4 ann annzone">sit: # </div>
          <div id="PP_12" class="N4 ann annzone">amet: # </div>
          <div id="PP_13" class="N4 ann annzone">consectetur: # </div>
          <div id="PP_14" class="N4 ann annzone">adipiscing: # </div>
          <div id="PP_2" class="N4 ann annzone">elit</div>
          <div id="PP_3" class="N4 ann annzone">NULLAM AMET</div>
        </div>
      </div>
    </div>
    <div class="pp-clause ann notable zoomable" id="PP_55">
      <h3><b class="clause_title">Subsection 1.2</b></h3>
      <div class="precedent-element ann pactable notable" id="PP_52">
        <h4><b class="clause_title">Subsection 1.2.1</b></h4>
        <div class="ppTextPosition annzone">
          <div id="PP_74" class="N4 ann annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam amet.</div>
          <div id="PP_75" class="N4 ann annzone">
            <table class="table-frame-none" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
                <td>
                  <table class="table-contents" cellpadding="4" cellspacing="0" width="100%">
                    <colgroup>
                      <col width="44.5%">
                      <col width="55.5%">
                    </colgroup>
                    <tbody>
                    <tr>
                      <td class="valign-cell-top" valign="top"><div class="annzone">Lorem&nbsp;</div></td>
                      <td class="valign-cell-top" valign="top"><div class="annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi. Quisque luctus amet.&nbsp;</div></td>
                    </tr>
                    <tr>
                      <td class="valign-cell-top" valign="top"><div class="annzone">Fake list</div></td>
                      <td class="valign-cell-top" valign="top"><div class="annzone">(a) Lorem ipsum dolor sit amet, consectetur posuere.&nbsp;</div></td>
                    </tr>
                    <tr>
                      <td class="valign-cell-top" valign="top"><div class="annzone">&nbsp;</div></td>
                      <td class="valign-cell-top" valign="top"><div class="annzone">(b) Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi. &nbsp;</div></td>
                    </tr>
                    <tr>
                      <td class="valign-cell-top" valign="top"><div class="annzone">&nbsp;</div></td>
                      <td class="valign-cell-top" valign="top"><div class="annzone">(c) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehic&nbsp;</div></td>
                    </tr>
                    <tr>
                      <td class="valign-cell-top" valign="top"><div class="annzone">List</div></td>
                      <td class="valign-cell-top" valign="top">
                        <ul class="list-style-lower-alpha">
                          <li> Lorem ipsum </li>
                          <li> dolor sit amet, </li>
                          <li> consectetur adipiscing elit </li>
                        </ul>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="pp-clause ann notable zoomable" id="PP_63">
      <h3>&nbsp;</h3>
      <b class="clause_title">Nullam ipsum in magna</b>
      <div class="precedent-element ann pactable notable" id="PP_65">
        <h3>&nbsp;</h3>
        <b class="clause_title">Consectetus adipiscing elit.</b>
        <div class="ppTextPosition annzone">
          <div id="PP_14" class="N4 ann annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi. Quisque luctus amet.</div>
          <div id="PP_15" class="N4 ann annzone">
            <div class="listbody">
              <ul class="manuell">
                <li id="PP_16" class="ann annzone">(a) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi.</li>
                <li id="PP_17" class="ann annzone">(b) Lorem ipsum dolor sit amet</li>
                <li id="PP_18" class="ann annzone">(c) Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
              </ul>
            </div>
          </div>
          <div id="PP_19" class="N4 ann annzone">Nullam in magna ut nulla efficitur scelerisque. </div>
          <div id="PP_20" class="N4 ann annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi.</div>
          <div id="PP_21" class="N4 ann annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquam ornare augue. Nullam in magna ut nulla efficitur scelerisque. Sed scelerisque, ante ac fringilla porta, mi ipsum rhoncus amet.</div>
          <div id="PP_22" class="N4 ann annzone">Praesent aliquam ornare augue. Nullam in magna ut nulla efficitur scelerisque.</div>
        </div>
      </div>
    </div>
    <div class="pp-clause ann notable zoomable" id="PP_83">
      <h3>&nbsp;</h3>
      <b class="clause_title">æåø</b>
      <div class="precedent-element ann pactable notable" id="PP_85">
        <h3>&nbsp;</h3>
        <b class="clause_title">ÁÑÇ ÉÍóü</b>
        <div class="ppTextPosition annzone">
          <div id="PP_39" class="N4 ann annzone">Œ Æ </div>
          <div id="PP_40" class="N4 ann annzone">
            <div class="listbody">
              <ul class="manuell">
                <li id="PP_41" class="ann annzone">(a) Lorem ipsum dolor sit amet</li>
                <li id="PP_42" class="ann annzone">(b) Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                <li id="PP_43" class="ann annzone">(c) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquam ornare augue. Nullam in magna ut nulla efficitur scelerisque. Sed scelerisque, ante ac fringilla porta, mi ipsum rhoncus amet.</li>
                <li id="PP_44" class="ann annzone">(d) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa. Donec pretium, dui tincidunt vestibulum interdum, dui ex commodo turpis, eget scelerisque orci lacus id mi. Vivamus sed id.</li>
                <li id="PP_45" class="ann annzone">(e) Vivamus sed id.</li>
                <li id="PP_46" class="ann annzone">(f) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa. Donec pretium, dui tincidunt vestibulum interdum, dui ex commodo turpis, eget scelerisque orci lacus id mi.</li>
                <li id="PP_47" class="ann annzone">(g) Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa. Donec pretium, dui tincidunt vestibulum interdum, dui ex commodo turpis, eget scelerisque orci lacus id mi. Vivamus sed id.</li>
              </ul>
            </div>
          </div>
          <div id="PP_59" class="N4 ann annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa.</div>
        </div>
      </div>
    </div>
    <div class="pp-clause ann notable zoomable" id="PP_78">
      <h3><b class="clause_title">Clause</b></h3>
      <div class="precedent-element ann pactable notable" id="PP_79">
        <h3><b class="clause_title">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</b></h3>
        <div class="ppTextPosition annzone">
          <div id="PP_37" class="N4 ann annzone">Låneavtal # svenska kronor daterat den # 20#</div>
          <div id="PP_38" class="N4 ann annzone">1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit gravida arcu, quis auctor turpis.</div>
          <div id="PP_39" class="N4 ann annzone">2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. [Nunc suscipit gravida arcu].</div>
          <div id="PP_40" class="N4 ann annzone">3. Datum: #</div>
          <div id="PP_41" class="N4 ann annzone">4. Lorem ipsum dolor sit amet #</div>
          <div id="PP_42" class="N4 ann annzone">5. Nunc suscipit:
            <div class="listbody">
              <ul class="manuell">
                <li id="PP_43" class="ann annzone">Lorem ipsum dolor sit amet: #</li>
                <li id="PP_44" class="ann annzone">Nam volutpat: #</li>
                <li id="PP_45" class="ann annzone">Consectetur adipiscing elit. Nam volutpat: #</li>
                <li id="PP_46" class="ann annzone">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam volutpat. #</li>
                <li id="PP_47" class="ann annzone">Lorem ipsum dolor sit amet, [consectetur]: #</li>
                <li id="PP_48" class="ann annzone">[Lorem ipsum] dolor sit amet. Nam volutpat: [ ]</li>
              </ul>
            </div>
          </div>
          <div id="PP_50" class="N4 ann annzone">
            <table class="table-frame-none" cellpadding="0" cellspacing="0">
              <tbody>
              <tr>
                <td>
                  <table class="table-contents" cellpadding="4" cellspacing="0" width="100%">
                    <colgroup>
                      <col width="88%">
                    </colgroup>
                    <tbody>
                    <tr>
                      <td class="valign-cell-top" valign="top">
                        <div class="annzone">Place/Date&nbsp;</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="valign-cell-top" valign="top">
                        <div class="annzone">______________________&nbsp;</div>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:pPr>
      <w:pStyle w:val="Heading1"/>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">My Document</w:t>
    </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading2"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Section 1</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve"> </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:b/>
    </w:rPr>
    <w:t xml:space="preserve">Subsection 1.1</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Lorem</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Ipsum: # </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">dolor: # </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">sit: # </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">amet: # </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">consectetur: # </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">adipiscing: # </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">elit</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">NULLAM AMET</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Subsection 1.2</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading4"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Subsection 1.2.1</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam amet.</w:t>
  </w:r>
  </w:p>
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
                <w:t xml:space="preserve">Lorem </w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi. Quisque luctus amet. </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">Fake list</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">(a) Lorem ipsum dolor sit amet, consectetur posuere. </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve"> </w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">(b) Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi.  </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve"> </w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">(c) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehic </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">List</w:t>
              </w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:pPr>
                <w:pStyle w:val="ListParagraph"/>
                <w:numPr>
                  <w:ilvl w:val="0"/>
                  <w:numId w:val="1"/>
                </w:numPr>
              </w:pPr>
              <w:r>
                <w:t xml:space="preserve"> Lorem ipsum </w:t>
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
                <w:t xml:space="preserve"> dolor sit amet, </w:t>
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
                <w:t xml:space="preserve"> consectetur adipiscing elit </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
      </w:tbl>
      <w:p/>
    </w:tc>
  </w:tr>
  </w:tbl>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve"> </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:b/>
    </w:rPr>
    <w:t xml:space="preserve">Nullam ipsum in magna</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve"> </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:b/>
    </w:rPr>
    <w:t xml:space="preserve">Consectetus adipiscing elit.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi. Quisque luctus amet.</w:t>
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
    <w:t xml:space="preserve">(a) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi.</w:t>
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
    <w:t xml:space="preserve">(b) Lorem ipsum dolor sit amet</w:t>
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
    <w:t xml:space="preserve">(c) Lorem ipsum dolor sit amet, consectetur adipiscing elit.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Nullam in magna ut nulla efficitur scelerisque. </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat nunc at nulla scelerisque vehicula. Vestibulum id enim nisi.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquam ornare augue. Nullam in magna ut nulla efficitur scelerisque. Sed scelerisque, ante ac fringilla porta, mi ipsum rhoncus amet.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Praesent aliquam ornare augue. Nullam in magna ut nulla efficitur scelerisque.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve"> </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:b/>
    </w:rPr>
    <w:t xml:space="preserve">æåø</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve"> </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:b/>
    </w:rPr>
    <w:t xml:space="preserve">ÁÑÇ ÉÍóü</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Œ Æ </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(a) Lorem ipsum dolor sit amet</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(b) Lorem ipsum dolor sit amet, consectetur adipiscing elit.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(c) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquam ornare augue. Nullam in magna ut nulla efficitur scelerisque. Sed scelerisque, ante ac fringilla porta, mi ipsum rhoncus amet.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(d) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa. Donec pretium, dui tincidunt vestibulum interdum, dui ex commodo turpis, eget scelerisque orci lacus id mi. Vivamus sed id.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(e) Vivamus sed id.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(f) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa. Donec pretium, dui tincidunt vestibulum interdum, dui ex commodo turpis, eget scelerisque orci lacus id mi.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="3"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">(g) Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa. Donec pretium, dui tincidunt vestibulum interdum, dui ex commodo turpis, eget scelerisque orci lacus id mi. Vivamus sed id.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet arcu augue. Quisque ultricies nec justo a blandit. Sed scelerisque turpis felis. Integer id mauris massa.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Clause</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Låneavtal # svenska kronor daterat den # 20#</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc suscipit gravida arcu, quis auctor turpis.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. [Nunc suscipit gravida arcu].</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">3. Datum: #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">4. Lorem ipsum dolor sit amet #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">5. Nunc suscipit: </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="4"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet: #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="4"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Nam volutpat: #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="4"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Consectetur adipiscing elit. Nam volutpat: #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="4"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam volutpat. #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="4"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, [consectetur]: #</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="ListParagraph"/>
    <w:numPr>
      <w:ilvl w:val="0"/>
      <w:numId w:val="4"/>
    </w:numPr>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">[Lorem ipsum] dolor sit amet. Nam volutpat: [ ]</w:t>
  </w:r>
  </w:p>
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
                <w:t xml:space="preserve">Place/Date </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr>
          <w:tc>
            <w:tcPr/>
            <w:p>
              <w:r>
                <w:t xml:space="preserve">______________________ </w:t>
              </w:r>
            </w:p>
          </w:tc>
        </w:tr>
      </w:tbl>
      <w:p/>
    </w:tc>
  </w:tr>
  </w:tbl>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it 'transforms documents with multiple pages and highlight and nested things' do
    html = <<-EOL
  <!DOCTYPE html>
  <html>
  <head></head>
  <body>
  <div class="delivery" data-assembly-id="1" data-marginalia="null">
    <div id="content">
      <div class="page">
        <h1>trial bundle</h1>
        <h2>Indholdsfortegnelse</h2>
        <ul>
          <li>
            <a href="#2">Section 1</a>
            (Text section)
          </li>
          <li>
            <a href="#37">Section 2</a>
            (With highlights)
          </li>
          <li>
            <a href="#43">Section 3</a>
            (Highlight only)
          </li>
        </ul>
      </div>
      <div class="page -page-break">
        <div class="assembly-item" id="2">
          <h2>Section 1</h2>
          <div class="document" data-id="3" data-name="name1">
            <div class="maincontent zoom" id="name1">
              <div id="name1_P2" class="P ann clippable zoomable notable alertable">
                <h3>§&nbsp;2</h3>
                <div class="element-body annzone">
                  <h4 class="change-sources">Lorem ipsum:
                    <a href="/some/route?attr=bla&amp;attr2=123" class="source">Link 1</a>
                  </h4>
                  <h4 class="inforce">Excepteur sint occaecat cupidatat non proident: <time>2013-01-01</time>
                  </h4>
                  <div class="S" id="name1_P2_1"> Consectetur adipiscing elit
                    <ol class="pkt">
                      <li>
                        <i class="pkt">1)</i>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua,
                      </li>
                      <li>
                        <i class="pkt">6)</i>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat <a href="/some/route?attr=ble&amp;attr2=1234">Link. 2</a> Duis aute.
                      </li>
                    </ol>
                    <div class="TXT">
                      <p>Curabitur erat mi, congue non turpis non, faucibus dapibus magna. Phasellus a accumsan tortor. Quisque quam purus, vehicula a auctor vitae.</p>
                    </div>
                    Mauris felis massa, malesuada a aliquet sed, volutpat sed sapien. Sed porttitor ex in nisi commodo varius. Ut ligula enim, mollis at mi eget, elementum imperdiet augue.
                  </div>
                  <div class="S" id="name1_P2_2">Stk.&nbsp;2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam convallis ut felis a cursus. Etiam sodales quis nisl ac elementum. Suspendisse egestas hendrerit diam sit amet mattis. Sed id consectetur orci. Phasellus ultrices laoreet lectus, a laoreet magna accumsan eget. Curabitur erat mi, congue non turpis non, faucibus dapibus magna. Phasellus a accumsan tortor. Quisque quam purus, vehicula a auctor vitae, lobortis nec dui. <a href="/document/rel/name1_P16H?src=document&amp;versid=244-2-2004">ligningslovens § 16 H, stk. 6</a>,  Donec malesuada dictum sagittis <a href="/some/route?attr=bla&amp;attr2=123" class="source">Text on link 3</a> or <a href="/some/route?attr=bla&amp;attr2=123" class="source">Link 4</a>, Aenean rutrum elementum nulla, ut consequat velit accumsan vitae. Duis iaculis nulla elit, quis rhoncus mi malesuada vel.</div>
                  <div class="S" id="name1_P2_3">Stk.&nbsp;3. Pellentesque nisi tortor, fermentum nec iaculis non, efficitur eu ex. Donec volutpat felis at turpis accumsan, nec interdum sem porta. Sed sed.</div>
                  <div class="S" id="name1_P2_6">Stk.&nbsp;6. Quisque finibus purus urna, ac condimentum purus sollicitudin non. In egestas vel libero non pharetra. Donec malesuada dictum sagittis.</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr>
      </div>
      <div class="page -page-break">
        <div class="assembly-item" id="37">
          <h2>Section 2</h2>
          <div class="marginalia-note-inline">
            <h4>Notes</h4>
            My note
            <div class="note_authors">
              ― By Cristina Matonte
            </div>
          </div>
          <div class="document" data-id="770" data-name="name2">
            <div class="maincontent zoom" id="name2">
              <div id="name2_P4" class="P ann clippable zoomable notable alertable">
                <h3>§&nbsp;4</h3>
                <div class="element-body annzone">
                  <h4 class="change-sources">Lorem ipsum:
                    <a href="/some/route?attr=bla&amp;attr2=123" class="source">Section 2</a>
                  </h4>
                  <h4 class="inforce">Datum: <time>2015-01-01</time>
                  </h4>
                  <div class="S" id="name2_P4_1">     Aenean rutrum elementum nulla, ut consequat velit accumsan vitae. Duis iaculis nulla elit, quis rhoncus mi malesuada vel.
                  </div>
                  <div class="S" id="name2_P4_2"><span class="h yellow" id="h_10" data-selector="|Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam convallis ut felis a cursus.|1" data-style="yellow">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam convallis ut felis a cursus.</span>.</div>
                  <div class="S" id="name2_P4_3">Stk.&nbsp;3. Etiam sodales quis nisl ac elementum. Suspendisse egestas hendrerit diam sit amet mattis.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr>
      </div>
      <div class="page -page-break">
        <div class="assembly-item" id="43">
          <h3>Section 3</h3>
          <small>Highlights on p</small>
          <p><span class="h pink" data-style="pink">Pinky</span></p>
        </div>
        <hr>
      </div>
    </div>
  </div>
  </body>
  </html>
    EOL
    expected_wordml = <<-EOL
  <w:p>
    <w:pPr>
      <w:pStyle w:val="Heading1"/>
    </w:pPr>
    <w:r>
      <w:t xml:space="preserve">trial bundle</w:t>
    </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading2"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Indholdsfortegnelse</w:t>
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
    <w:t xml:space="preserve">Section 1</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve"> (Text section) </w:t>
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
    <w:t xml:space="preserve">Section 2</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve"> (With highlights) </w:t>
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
    <w:t xml:space="preserve">Section 3</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve"> (Highlight only) </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:br w:type="page"/>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading2"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Section 1</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">§ 2</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading4"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum: Link 1</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading4"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Excepteur sint occaecat cupidatat non proident: 2013-01-01</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve"> Consectetur adipiscing elit </w:t>
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
    <w:rPr>
      <w:i/>
    </w:rPr>
    <w:t xml:space="preserve">1)</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">sed do eiusmod tempor incididunt ut labore et dolore magna aliqua, </w:t>
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
    <w:rPr>
      <w:i/>
    </w:rPr>
    <w:t xml:space="preserve">6)</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat </w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">Link. 2</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve"> Duis aute. </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Curabitur erat mi, congue non turpis non, faucibus dapibus magna. Phasellus a accumsan tortor. Quisque quam purus, vehicula a auctor vitae.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve"> Mauris felis massa, malesuada a aliquet sed, volutpat sed sapien. Sed porttitor ex in nisi commodo varius. Ut ligula enim, mollis at mi eget, elementum imperdiet augue. </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Stk. 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam convallis ut felis a cursus. Etiam sodales quis nisl ac elementum. Suspendisse egestas hendrerit diam sit amet mattis. Sed id consectetur orci. Phasellus ultrices laoreet lectus, a laoreet magna accumsan eget. Curabitur erat mi, congue non turpis non, faucibus dapibus magna. Phasellus a accumsan tortor. Quisque quam purus, vehicula a auctor vitae, lobortis nec dui. </w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">ligningslovens § 16 H, stk. 6</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">, Donec malesuada dictum sagittis </w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">Text on link 3</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve"> or </w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">Link 4</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">, Aenean rutrum elementum nulla, ut consequat velit accumsan vitae. Duis iaculis nulla elit, quis rhoncus mi malesuada vel.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Stk. 3. Pellentesque nisi tortor, fermentum nec iaculis non, efficitur eu ex. Donec volutpat felis at turpis accumsan, nec interdum sem porta. Sed sed.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Stk. 6. Quisque finibus purus urna, ac condimentum purus sollicitudin non. In egestas vel libero non pharetra. Donec malesuada dictum sagittis.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:br w:type="page"/>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading2"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Section 2</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading4"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Notes</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve"> My note </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve"> ― By Cristina Matonte </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">§ 4</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading4"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Lorem ipsum: Section 2</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading4"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Datum: 2015-01-01</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve"> Aenean rutrum elementum nulla, ut consequat velit accumsan vitae. Duis iaculis nulla elit, quis rhoncus mi malesuada vel. </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:highlight w:val="yellow"/>
    </w:rPr>
    <w:t xml:space="preserve">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam convallis ut felis a cursus.</w:t>
  </w:r>
  <w:r>
    <w:t xml:space="preserve">.</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Stk. 3. Etiam sodales quis nisl ac elementum. Suspendisse egestas hendrerit diam sit amet mattis. </w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:br w:type="page"/>
  </w:r>
  </w:p>
  <w:p>
  <w:pPr>
    <w:pStyle w:val="Heading3"/>
  </w:pPr>
  <w:r>
    <w:t xml:space="preserve">Section 3</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:t xml:space="preserve">Highlights on p</w:t>
  </w:r>
  </w:p>
  <w:p>
  <w:r>
    <w:rPr>
      <w:highlight w:val="magenta"/>
    </w:rPr>
    <w:t xml:space="preserve">Pinky</w:t>
  </w:r>
  </w:p>
    EOL
    compare_resulting_wordml_with_expected(html, expected_wordml.strip)
  end

  it 'transforms other nestings' do
    compare_transformed_files(
      test: 'complex',
      test_file_name: 'nestings',
      extras: false
    )
  end
end
