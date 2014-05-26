require_relative '../spec_helper'
require './src/core/engine'

describe Engine do

  it 'throw an exception when init argument given nil' do
    expect{ Engine.new(nil,nil,nil)}.to raise_error(ArgumentError)
    expect{ Engine.new('nil',nil,nil)}.to raise_error(ArgumentError)
    expect{ Engine.new(nil, 'nil',nil)}.to raise_error(ArgumentError)
    expect{ Engine.new(nil,nil,'nil')}.to raise_error(ArgumentError)
    Engine.new('nil','nil','nil')

  end


end

