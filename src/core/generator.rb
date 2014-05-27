require_relative './template_engine_factory'

module Cms

  class Generator

    attr_reader :model_resource, :template_resource, :destination_resource

    def initialize (model_resource, template_resource, destination_resource)
      raise ArgumentError, 'model_resource is nil' if model_resource.nil?
      raise ArgumentError, 'template_resource is nil' if template_resource.nil?
      raise ArgumentError, 'destination_resource is nil' if destination_resource.nil?

      @model_resource = model_resource
      @template_resource = template_resource
      @destination_resource = destination_resource


    end

    def run
      model = model_resource.get
      template = template_resource.get

      template_engine = factory.engine 'eob'

      result = template_engine.render model, template

      destination_resource.put result

      @success = true
    end

    def success?
      @success
    end

    private
    def factory
      if @template_engine_factory.nil?
        @template_engine_factory = TemplateEngineFactory.new
      end
      @template_engine_factory
    end

  end
end