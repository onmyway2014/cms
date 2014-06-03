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
        t = BuiltinResource.new 'builtin://Data', 'Hello:<%=model.name%>'
        m = BuiltinResource.new 'builtin://Data', person_tom
        d = BuiltinResource.new 'builtin://Data'

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.should == 'Hello:tom'

      end

      it 'using http resource and putin builtin resource with erb engine' do
        t = BuiltinResource.new 'builtin://Data', '<%=model.size%>'
        m = HttpResource.new 'http://www.baidu.com'
        d = BuiltinResource.new 'builtin://Data'

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.to_i.should > 0
      end
    end
  end
end
