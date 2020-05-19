Courtesy of @fran-worley

This list is not comprehensive or tested, but I have looked through the source code, and readme and come up with the following:

## Page formatting options:

Check out: https://github.com/karnov/htmltoword/blob/master/lib/htmltoword/xslt/base.xslt 

### Page Break (included in readme)

    <div class="-page-break"></div>

Returns a page break

### Highlighting (included in readme)

    <span class="h" data-style="chosen-color">Highlighted Text Here</span>

Will highlight text with predefined color

You can specify the color as 6 character HEX color (e.g. `FFFFFF` for white, `FF00000` for red) or one of the following
text values: 

Valid value | Description
-------------- | ----------------
black | Black Highlighting Color
blue | Blue Highlighting Color
cyan | Cyan Highlighting Color
green | Green Highlighting Color
magenta | Magenta Highlighting Color
red | Red Highlighting Color
yellow | Yellow Highlighting Color
white | White Highlighting Color
darkBlue | Dark Blue Highlighting Color
darkCyan | Dark Cyan Highlighting Color
darkGreen | Dark Green Highlighting Color
darkMagenta | Dark Magenta Highlighting Color
darkRed | Dark Red Highlighting Color
darkYellow | Dark Yellow Highlighting Color
darkGray | Dark Gray Highlighting Color
lightGray | Light Gray Highlighting Color
none | No Text Highlighting

As per: http://www.schemacentral.com/sc/ooxml/t-w_ST_HighlightColor.html

### Text Align (not in readme)

It looks like adding the following classes will align text in your word document appropriately.

* left
* right
* center
* justify

### HTML tags
There is also support for the following HTML tags:
* div
* p
* ul/ol, li
* b/strong
* i/em
* u
* br
* pre
* h1...h6 

#### Images
It appears that at this time images are not supported see #27 

#### External links
It appears that this isn't supported either yet, though there is an open pull request to add the functionality see #30 

### Table formatting options
As per this: https://github.com/karnov/htmltoword/blob/master/lib/htmltoword/xslt/tables.xslt

There is basic support for tables. 

You can use the following HTML tags:
* thead
* tbody
* tr
* th
* td
* h1...h6

And the following classes:
* Text alignment: (as above)
* Table borders: 'table-bordered' (Not configurable, the default is a black, single line border with a weight of 6)
* Cell borders: 'ms-border-[location]-[value]-[color - default is 000000]-[size - default is 1]'
* Cell fill: 'ms-fill-[color]'

The following are documented here: http://officeopenxml.com/WPtableCellProperties-Borders.php I do not know exactly how much of these options work in the gem, but it should at least point you in the right direction

#### [location]
Specifies where to apply the border (see Elements table in officeopenxml docs above)

Element | Description
---------- | ---------------
top | Specifies the border displayed at the top of the cell. 
bottom  | Specifies the border displayed at the bottom of a cell.
start | Specifies the border displayed on the leading edge of the cell (left for left-to-right tables and right for right-to-left tables). *Note:* In the previous version of the standard, this element was *left*.
end | Specifies the border displayed on the trailing edge of the cell (right for left-to-right tables and left for right-to-left tables). *Note:* In the previous version of the standard, this element was *right*.
insideH | Specifies the border to be displayed on all interior horizontal edges of the cell. Note that this is mostly useless in the case of individual cells, as there is no concept of interior edge for individual cells. However, it is used to determine cell borders to apply to a specific group of cells as part of table conditional formatting in a table style, e.g., the inside edges on the set of cells in the first column. 
insideV | Specifies the border to be displayed on all interior vertical edges of the cell. Note that this is mostly useless in the case of individual cells, as there is no concept of interior edge for individual cells. However, it is used to determine cell borders to apply to a specific group of cells as part of table conditional formatting in a table style, e.g., the inside edges on the set of cells in the first column.
tl2br | Specifies the border to be displayed on the top left side to bottom right diagonal within the cell. 
tr2bl | Specifies the border to be displayed on the top right to bottom left diagonal within the cell.

#### [value] 

Specifies the style of the border. Possible values a per open XML docs are:

Value | Description 
-------- | ---------------
single | a single line
dashDotStroked | a line with a series of alternating thin and thick strokes
dashed | a dashed line
dashSmallGap | a dashed line with small gaps
dotDash | a line with alternating dots and dashes
dotDotDash | a line with a repeating dot - dot - dash sequence
dotted | a dotted line
double | a double line
doubleWave | a double wavy line
inset | an inset set of lines
nil | no border
none | no border
outset | an outset set of lines
thick | a single line
thickThinLargeGap | a thick line contained within a thin line with a large-sized intermediate gap
thickThinMediumGap | a thick line contained within a thin line with a medium-sized intermediate gap
thickThinSmallGap | a thick line contained within a thin line with a small intermediate gap
thinThickLargeGap | a thin line contained within a thick line with a large-sized intermediate gap
thinThickMediumGap | a thick line contained within a thin line with a medium-sized intermediate gap
thinThickSmallGap | a thick line contained within a thin line with a small intermediate gap
thinThickThinLargeGap | a thin-thick-thin line with a large gap
thinThickThinMediumGap | a thin-thick-thin line with a medium gap
thinThickThinSmallGap | a thin-thick-thin line with a small gap
threeDEmboss | a three-staged gradient line, getting darker towards the paragraph
threeDEngrave | a three-staged gradient like, getting darker away from the paragraph
triple | a triple line
wave | a wavy line

#### [color] 
Specifies the color of the border. Values are given as hex values (in RRGGBB format). No #, unlike hex values in HTML/CSS. E.g., color="FFFF00". A value of auto is also permitted and will allow the consuming word processor to determine the color.

#### [size]
Specifies the width of the border. 
The gem seems to multiply whatever value you supply by 6. I nothing or 0 is entered then it uses 6.
