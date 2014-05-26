class Engine

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


    @success = true
  end

  def success?
    @success
  end

end
