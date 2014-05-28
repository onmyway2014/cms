require_relative './null_template_engine'

module Cms
  module Core
    class TemplateEngineFactory
      def create(engine_type)
        case engine_type
          when ''
            raise 'not implement'
          else
            NullTemplateEngine.new
        end
      end
    end
  end
end