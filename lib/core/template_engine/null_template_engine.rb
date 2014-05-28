require_relative './template_engine_base'

module Cms
  module Core
    class NullTemplateEngine < TemplateEngineBase


      def render(model, template)
        model.to_s
      end
    end

  end
end