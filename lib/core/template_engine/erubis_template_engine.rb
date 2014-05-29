require_relative './template_engine_base'
require 'erubis'

module Cms
  module Core
    class ErubisTemplateEngine < TemplateEngineBase

      def render_for(template_context, template)
        engine = Erubis::Eruby.new template
        engine.result template_context.get_binding
      end
    end
  end
end