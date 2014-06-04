require './test/spec_helper'
require './lib/core/resource/http_resource'

module Cms
  module Core
    describe 'Resource::HttpResource' do

      it 'should be read', :RequireNet => true do
        uri_str = 'http://www.baidu.com'
        http = HttpResource.new uri_str
        data = http.get
        data.should_not be_empty
        data.force_encoding('UTF-8').should be_include('<title>百度一下，你就知道</title>')
      end

      it 'should not be write' do
        expect { HttpResource.new('http://www.baidu.com').put('hello') }.to raise_error('not implemented')
      end
    end

  end

end