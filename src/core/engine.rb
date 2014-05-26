class Engine

  attr_reader :model_resource, :template_resource, :destination_resource

  def initialize (model_resource, template_resource, destination_resource)
    raise ArgumentError if model_resource.nil? or template_resource.nil? or destination_resource.nil?

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
