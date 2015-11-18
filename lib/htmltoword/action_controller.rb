require 'rack/test'
require 'action_controller'

unless defined? Mime::DOCX
  Mime::Type.register 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', :docx
end

ActionController::Renderers.add :docx do |filename, options|
  unless formats.include?(:docx) || Rails.version < '3.2'
    self.formats = [:docx] + formats
  end

  # This is ugly and should be solved with regular file utils
  if options[:template] == action_name
    if filename =~ %r{^([^\/]+)/(.+)$}
      options[:prefixes] ||= []
      options[:prefixes].unshift $1
      options[:template] = $2
    else
      options[:template] = filename
    end
  end

  # disposition / filename
  disposition = options.delete(:disposition) || 'attachment'
  if file_name = options.delete(:filename)
    file_name += '.docx' unless file_name =~ /\.docx$/
  else
    file_name = "#{filename.gsub(/^.*\//, '')}.docx"
  end

  # other properties
  word_template = options.delete(:word_template) || nil
  extras = options.delete(:extras) || false
  # content will come from property content unless not specified
  # then it will look for a template.
  content = options.delete(:content) || render_to_string(options)

  document = Htmltoword::Document.create(content, word_template, extras)
  send_data document, filename: file_name, type: Mime::DOCX, disposition: disposition
end

if defined? ActionController::Responder
  module ActionController
    # For respond_with default
    class Responder
      def to_docx
        if @default_response
          @default_response.call(options)
        else
          controller.render({ docx: controller.action_name }.merge(options))
        end
      end
    end
  end
end
