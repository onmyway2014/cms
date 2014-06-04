require_relative '../../spec_helper'
require_relative '../../model_create_helper'

require './lib/core/generator'
require './lib/core/resource/builtin_resource'
require './lib/core/resource/http_resource'
require 'uri'

module Cms
  module Core

    # ,:ignore

    describe 'Integration::Generator' do
      include ModelCreateHelper

      it 'using builtin resource with erb engine' do
        t = BuiltinResource.new 'Hello:<%=model.name%>'
        m = BuiltinResource.new  person_tom
        d = BuiltinResource.new

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.should == 'Hello:tom'

      end

      it 'using http resource and putin builtin resource with erb engine' do
        t = BuiltinResource.new 'content:<%=model%>'
        m = HttpResource.new 'http://www.host.cms'
        d = BuiltinResource.new 'builtin://Data'

        # mock http request
        Net::HTTP.should_receive(:get).and_return('<html><title>百度一下，你就知道</title></html>')

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.should == 'content:<html><title>百度一下，你就知道</title></html>'
      end
    end
  end
end
