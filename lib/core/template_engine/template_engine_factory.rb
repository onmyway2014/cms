require_relative './null_template_engine'
require_relative './erb_template_engine'
require_relative './slim_template_engine'
require_relative './erubis_template_engine'


module Cms
  module Core
    class TemplateEngineFactory

      ENGINE_DEFAULT = :default

      ENGINE_ERB = :erb

      ENGINE_SLIM = :slim

      ENGINE_ERUBIS = :erubis

      #
      #
      # @param [String] engine_type
      # @return [TemplateEngineBase]
      def create(engine_type)

        case engine_type
          when ENGINE_ERB
            ErbTemplateEngine.new

          when ENGINE_SLIM
            SlimTemplateEngine.new

          when ENGINE_ERUBIS
            ErubisTemplateEngine.new

          when ENGINE_DEFAULT
            NullTemplateEngine.new
          else
            raise "not fund engine:#{engine_type}"
        end
      end
    end
  end
end