require_relative '../../spec_helper'
require_relative '../../model_create_helper'

require './lib/core/generator'
require './lib/core/resource/builtin_resource'
require 'uri'


module Cms
  module Core

    # ,:ignore

    describe 'Integration::Generator' do
      include ModelCreateHelper

      it 'should do something' do
        t = BuiltinResource.new 'Builtin://Data', 'Hello:<%=model.name%>'
        m = BuiltinResource.new 'Builtin://Data', person_tom
        d = BuiltinResource.new 'Builtin://Data'

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.should == 'Hello:tom'

      end
    end
  end
end
