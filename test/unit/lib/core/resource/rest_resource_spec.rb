require './test/spec_helper'
require './lib/core/resource/restful_resource'
require './test/model_create_helper'
require 'oj'

module Cms
  module Core
    describe 'Resource::RESTfulResource' do
      include ModelCreateHelper

      it 'should be instance' do
        expect{RESTfulResource.new}.to raise_error(ArgumentError)
        expect{RESTfulResource.new(nil)}.to raise_error(ArgumentError)
        RESTfulResource.new 'http://www.host.cms'
        expect{RESTfulResource.new 'ftp://www.host.cms'}.to raise_error(ArgumentError)
      end

      it 'should be read' do
        uri_str = 'http://www.host.cms'

        RestClient.should_receive(:get).and_return(Oj::dump(person_tom))
        r = RESTfulResource.new uri_str

        object = r.get
        object.name.should == 'tom' and object.children.count.should == 2
      end

=begin
      it 'should be put' do
        uri_str = 'http://www.host.cms'
        r = RESTfulResource.new uri_str

        RestClient.should_receive(:put)
        r.put(person_tom)

      end
=end

    end
  end
end