require_relative './template_engine_base'
require 'haml'

module Cms
  module Core
    class HamlTemplateEngine < TemplateEngineBase

      def render_for(template_context, template)
        engine = Haml::Engine.new template
        engine.render template_context
      end
    end

  end
end

# s = "foobar"
# puts Haml::Engine.new(%q(%html{:xmlns => "http://www.w3.org/1999/xhtml", "xml:lang" => "en", :lang => "en"}<
#   %p= upcase
#
# )).render(s)