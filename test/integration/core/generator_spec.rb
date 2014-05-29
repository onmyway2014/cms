require_relative '../../spec_helper'
require_relative '../../model_create_helper'

require './lib/core/generator'
require './lib/core/resource/builtin_resource'
require 'uri'

require 'benchmark'

module Cms
  module Core

    include Benchmark
    # ,:ignore

    describe 'Integration::Generator' do
      include ModelCreateHelper

      it 'using builtin resource and erb engine' do
        t = BuiltinResource.new 'builtin://Data', 'Hello:<%=model.name%>'
        m = BuiltinResource.new 'builtin://Data', person_tom
        d = BuiltinResource.new 'builtin://Data'

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.should == 'Hello:tom'

      end
    end
  end
end
