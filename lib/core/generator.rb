require_relative './template_engine_factory'

module Cms

  class Generator

    attr_reader :model_resource, :template_resource, :destination_resource, :result, :content_filters
    attr_accessor :engine_type

    def initialize (model_resource, template_resource, destination_resource)
      raise ArgumentError, 'model_resource is nil' if model_resource.nil?
      raise ArgumentError, 'template_resource is nil' if template_resource.nil?
      raise ArgumentError, 'destination_resource is nil' if destination_resource.nil?

      @model_resource = model_resource
      @template_resource = template_resource
      @destination_resource = destination_resource

      @engine_type = 'default'
      @result = ''
      @content_filters = []
    end

    def run?
      model = model_resource.get
      return failed 'model resource get data is nil' if model.nil?

      template_str = template_resource.get.to_s
      return failed 'template resource get data is empty' if template_str.empty?

      template_engine = engine_factory.create @engine_type

      content = template_engine.render model, template_str

      content_filters.each do |filter|
        return failed "cancelled by filter:#{filter.name}" unless filter.do? content
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