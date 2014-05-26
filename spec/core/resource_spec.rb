require_relative '../spec_helper'
require './src/core/resource'
require 'uri'

describe Resource do

  it 'exception when init arg given nil' do
   expect{Resource.new nil}.to raise_error
  end

  it 'exception when init arg given not uri string' do
    expect{Resource.new ''}.to raise_error(ArgumentError)

     expect{Resource.new('hello')}.to raise_error(ArgumentError, 'uri:hello is invalid!')

  end

  it '' do
    r = Resource.new('http://www.baidu.com')
    r.uri.scheme.should == 'http'

  end
end