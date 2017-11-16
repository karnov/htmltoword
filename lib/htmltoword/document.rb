module Htmltoword
  class Document
    include XSLTHelper

    class << self
      include TemplatesHelper
      def create(content, template_name = nil, extras = false)
        template_name += extension if template_name && !template_name.end_with?(extension)
        document = new(template_file(template_name))
        document.replace_files(content, extras)
        document.generate
      end

      def create_and_save(content, file_path, template_name = nil, extras = false)
        File.open(file_path, 'wb') do |out|
          out << create(content, template_name, extras)
        end
      end

      def create_with_content(template, content, extras = false)
        template += extension unless template.end_with?(extension)
        document = new(template_file(template))
        document.replace_files(content, extras)
        document.generate
      end

      def extension
        '.docx'
      end

      def doc_xml_file
        'word/document.xml'
      end

      def numbering_xml_file
        'word/numbering.xml'
      end

      def relations_xml_file
        'word/_rels/document.xml.rels'
      end
    end

    def initialize(template_path)
      @replaceable_files = {}
      @template_path = template_path
    end

    #
    # Generate a string representing the contents of a docx file.
    #
    def generate
      Zip::File.open(@template_path) do |template_zip|
        buffer = Zip::OutputStream.write_buffer do |out|
          template_zip.each do |entry|
            out.put_next_entry entry.name
            if @replaceable_files[entry.name] && entry.name == Document.doc_xml_file
              source = entry.get_input_stream.read
              # Change only the body of document. TODO: Improve this...
              source = source.sub(/(<w:body>)((.|\n)*?)(<w:sectPr)/, "\\1#{@replaceable_files[entry.name]}\\4")
              out.write(source)
            elsif @replaceable_files[entry.name]
              out.write(@replaceable_files[entry.name])
            else
              out.write(template_zip.read(entry.name))
            end
          end
        end
        buffer.string
      end
    end

    def replace_files(html, extras = false)
      html = '<body></body>' if html.nil? || html.empty?
      source = Nokogiri::HTML(html.gsub(/>\s+</, '><'))

      #rowspan workaround
      source.xpath('//td[@rowspan > 1]').each do |e|
        cols = 0
        prev = e
        cols += prev.attributes['colspan'] ? prev.attributes['colspan'].value.to_i : 1 while(prev = prev.previous)
        parent = e.parent
        (e.attributes['rowspan'].value.to_i - 1).times do
          n = parent.next
          n.children.inject(0) do |sum, ch|
            if sum == cols
              ch.add_previous_sibling "<td vmerge colspan=\"#{e.attributes['colspan'] ? e.attributes['colspan'].value : 1}\"></td>"
              break
            end
            sum += ch.attributes['colspan'] ? ch.attributes['colspan'].value.to_i : 1
            sum
          end
        end
      end
      
      transform_and_replace(source, xslt_path('numbering'), Document.numbering_xml_file)
      transform_and_replace(source, xslt_path('relations'), Document.relations_xml_file)
      transform_doc_xml(source, extras)
    end

    def transform_doc_xml(source, extras = false)
      transformed_source = xslt(stylesheet_name: 'cleanup').transform(source)
      transformed_source = xslt(stylesheet_name: 'inline_elements').transform(transformed_source)
      transform_and_replace(transformed_source, document_xslt(extras), Document.doc_xml_file, extras)
    end

    private

    def transform_and_replace(source, stylesheet_path, file, remove_ns = false)
      stylesheet = xslt(stylesheet_path: stylesheet_path)
      content = stylesheet.apply_to(source)
      content.gsub!(/\s*xmlns:(\w+)="(.*?)\s*"/, '') if remove_ns
      @replaceable_files[file] = content
    end
  end
end
