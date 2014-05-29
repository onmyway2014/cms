require_relative './template_engine_base'
require 'slim'

module Cms
  module Core
    class SlimTemplateEngine < TemplateEngineBase

      def render_for(template_context, template)
        Slim::Template.new(){template}.render(template_context)
      end
    end

  end
end