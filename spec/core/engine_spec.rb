require_relative '../spec_helper'
require './src/core/engine'
require './src/core/resource'

describe Engine do

  it 'raise an exception when init argument given nil' do
    expect{ Engine.new(nil,nil,nil)}.to raise_error(ArgumentError,'model_resource is nil')
    expect{ Engine.new('nil',nil,nil)}.to raise_error(ArgumentError, 'template_resource is nil')
    expect{ Engine.new('nil', 'nil',nil)}.to raise_error(ArgumentError, 'destination_resource is nil')

    Engine.new('nil','nil','nil')
  end

  it 'run' do
    resource = Resource.new 'http://www.google.com'
    engine = Engine.new(resource, resource, resource)
    engine.run
    engine.should be_success
  end


end

