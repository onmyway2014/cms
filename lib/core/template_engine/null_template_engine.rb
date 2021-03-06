require_relative './template_engine_base'

module Cms
  module Core

    # default template engine
    class NullTemplateEngine < TemplateEngineBase

      def render_for(template_context, template)
        template_context.model.to_s
      end
    end

  end
end