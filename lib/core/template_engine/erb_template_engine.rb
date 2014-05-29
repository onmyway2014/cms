require_relative './template_engine_base'
require 'erb'

module Cms
  module Core
    class ErbTemplateEngine < TemplateEngineBase

      def render_for(template_context, template)
        ERB.new(template).result(template_context.get_binding)
      end

    end
  end
end
