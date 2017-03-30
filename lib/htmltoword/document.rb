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

      def content_types_xml_file
        '[Content_Types].xml'
      end
    end

    def initialize(template_path)
      @replaceable_files = {}
      @template_path = template_path
      @image_files = []
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
            elsif entry.name == Document.content_types_xml_file
              raw_file = entry.get_input_stream.read
              content_types = @image_files.empty? ? raw_file : inject_image_content_types(raw_file)

              out.write(content_types)
            else
              out.write(template_zip.read(entry.name))
            end
          end
          unless @image_files.empty?
          #stream the image files into the media folder using open-uri
            @image_files.each do |hash|
              out.put_next_entry("word/media/#{hash[:filename]}")
              open(hash[:url], 'rb') do |f|
                out.write(f.read)
              end
            end
          end
        end
        buffer.string
      end
    end

    def replace_files(html, extras = false)
      html = '<body></body>' if html.nil? || html.empty?
      source = Nokogiri::HTML(html.gsub(/>\s+</, '><'))
      transform_and_replace(source, xslt_path('numbering'), Document.numbering_xml_file)
      transform_and_replace(source, xslt_path('relations'), Document.relations_xml_file)
      transform_doc_xml(source, extras)
      local_images(source)
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

    #generates an array of hashes with filename and full url
    #for all images to be embeded in the word document
    def local_images(source)
      source.css('img').each_with_index do |image,i|
        filename = image['data-filename'] ? image['data-filename'] : image['src'].split("/").last
        ext = File.extname(filename).delete(".").downcase

        @image_files << { filename: "image#{i+1}.#{ext}", url: image['src'], ext: ext }
      end
    end

    #get extension from filename and clean to match content_types
    def content_type_from_extension(ext)
      ext == "jpg" ? "jpeg" : ext
    end

    #inject the required content_types into the [content_types].xml file...
    def inject_image_content_types(source)
      doc = Nokogiri::XML(source)

      #get a list of all extensions currently in content_types file
      existing_exts = doc.css("Default").map { |node| node.attribute("Extension").value }.compact

      #get a list of extensions we need for our images
      required_exts = @image_files.map{ |i| i[:ext] }

      #workout which required extensions are missing from the content_types file
      missing_exts = (required_exts - existing_exts).uniq

      #inject missing extensions into document
      missing_exts.each do |ext|
        doc.at_css("Types").add_child( "<Default Extension='#{ext}' ContentType='image/#{content_type_from_extension(ext)}'/>")
      end

      #return the amended source to be saved into the zip
      doc.to_s
    end
  end
end
