require_relative '../spec_helper'
require './src/core/generate_engine'

describe GenerateEngine do

  it 'throw an exception when init argument given nil' do
    expect{ GenerateEngine.new(nil)}.to raise_error(ArgumentError)
  end


end

