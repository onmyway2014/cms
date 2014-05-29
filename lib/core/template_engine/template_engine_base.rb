require_relative './template_context'

module Cms
  module Core

    # template engine abstract class
    class TemplateEngineBase

      #
      #
      # @param [Object] model
      # @param [String] template
      # @return [String] render result content
      def render(model, template)
        context = TemplateContext.new model
        render_for context, template
      end

      protected

      # @param [TemplateContext] template_context
      def render_for(template_context, template)
        raise 'not implement'
      end
    end
  end
end