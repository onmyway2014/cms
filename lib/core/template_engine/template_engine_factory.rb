require_relative './null_template_engine'
require_relative './erb_template_engine'
require_relative './slim_template_engine'
require_relative './erubis_template_engine'


module Cms
  module Core
    class TemplateEngineFactory

      ENGINE_DEFAULT = :null

      ENGINE_ERB = :erb

      ENGINE_SLIM = :slim

      ENGINE_ERUBIS = :erubis

      ENGINE_HAML = :haml

      #
      #
      # @param [Symbol] engine_type
      # @return [TemplateEngineBase]
      def create(engine_type)
        class_name = "#{engine_type.capitalize}TemplateEngine"
        raise "not support engine:#{class_name}" unless Cms::Core.const_defined? class_name
        Cms::Core.const_get(class_name).new
      end
    end
  end
end