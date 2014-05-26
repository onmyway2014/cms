require 'spec_helper'
require_relative '../src/generate_engine'
require_relative '../src/generate_request'

describe GenerateEngine do

  it 'throw an exception when init argument given nil' do
    expect{ GenerateEngine.new(nil)}.to raise_error(ArgumentError)
  end

=begin
  it '' do
    r = GenerateRequest.new
    g = GenerateEngine.new(r)
    g.should_not be_success
    g.run
    g.should be_success

  end
=end

end

