require_relative '../spec_helper'
require './src/core/resource'
require 'uri'

describe Resource do

  context 'initialize' do
    it 'exception when argument given nil' do
      expect { Resource.new nil }.to raise_error
    end

    it 'exception when argument given not uri string' do
      expect { Resource.new '' }.to raise_error(ArgumentError)
      expect { Resource.new('hello') }.to raise_error(ArgumentError, 'uri:hello is bad URI!')
    end

    it 'raise exception when argument given invalid URI' do
      expect { Resource.new 'http://' }.to raise_error(ArgumentError, /uri:.* is bad URI!/)
      expect { Resource.new 'http://@ssdf&sfdd' }.to raise_error(ArgumentError, /uri:.* is bad URI!/)
    end

    it 'correct init' do
      r = Resource.new(URI.parse 'http://www.google.com')
      r.uri.scheme.should == 'http'

      r = Resource.new('http://www.google.com')
      r.uri.scheme.should == 'http'
    end
  end

  it 'throw exception when put data given nil' do

    r = Resource.new('http://www.google.com')
    expect{r.put nil}.to raise_error(ArgumentError)
  end


end