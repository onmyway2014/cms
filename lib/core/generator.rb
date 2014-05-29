require_relative './template_engine/template_engine_factory'

module Cms
  module Core

    #
    # CMS core class for generate
    #
    class Generator

      # @return [ResourceBase]
      attr_reader :model_resource, :template_resource, :destination_resource

      # @return [String]
      attr_reader :result

      # @return [Array<ContentFilterBase>]
      attr_reader :content_filters

      # template engine type
      # @return [Symbol]
      attr_accessor :engine_type

      # @param [ResourceBase] model_resource
      # @param [ResourceBase] template_resource
      # @param [ResourceBase] destination_resource
      def initialize (model_resource, template_resource, destination_resource)
        raise ArgumentError, 'model_resource is nil' if model_resource.nil?
        raise ArgumentError, 'template_resource is nil' if template_resource.nil?
        raise ArgumentError, 'destination_resource is nil' if destination_resource.nil?

        @model_resource = model_resource
        @template_resource = template_resource
        @destination_resource = destination_resource

        @engine_type = :default
        @result = ''
        @content_filters = []
      end

      #
      #  process
      #
      # @return [true,false]
      def run?
        model = model_resource.get
        return failed 'model resource get data is nil' if model.nil?

        template_str = template_resource.get.to_s
        return failed 'template resource get data is empty' if template_str.empty?

        template_engine = engine_factory.create @engine_type

        content = template_engine.render model, template_str

        content_filters.each do |filter|
          return failed "canceled by filter:#{filter.name}" unless filter.do? content
        end

        destination_resource.put content

        true
      end

      private
      def engine_factory
        @template_engine_factory = TemplateEngineFactory.new if @template_engine_factory.nil?
      end

      def failed(message)
        @result = message
        false
      end

    end
  end
end