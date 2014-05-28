require_relative './template_engine_factory'

module Cms

  class Generator

    attr_reader :model_resource, :template_resource, :destination_resource
    attr_accessor :engine_type

    def initialize (model_resource, template_resource, destination_resource)
      raise ArgumentError, 'model_resource is nil' if model_resource.nil?
      raise ArgumentError, 'template_resource is nil' if template_resource.nil?
      raise ArgumentError, 'destination_resource is nil' if destination_resource.nil?

      @model_resource = model_resource
      @template_resource = template_resource
      @destination_resource = destination_resource

      @engine_type = 'default'
    end

    # @return [TrueClass,FalseClass]
    def run?
      model = model_resource.get
      template = template_resource.get.to_s

      template_engine = engine_factory.create @engine_type

      result = template_engine.render model, template

      destination_resource.put result

      true
    end

    private
    def engine_factory
      @template_engine_factory = TemplateEngineFactory.new if @template_engine_factory.nil?
    end   

  end
end