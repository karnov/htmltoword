module Htmltoword
  class Railtie < ::Rails::Railtie
    initializer 'htmltoword.setup' do
      unless defined? Mime[:docx]
        Mime::Type.register 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', :docx
      end

      ActionController::Renderers.add :docx do |file_name, options|
        Htmltoword::Renderer.send_file(self, file_name, options)
      end

      if defined? ActionController::Responder
        ActionController::Responder.class_eval do
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
  end
end
