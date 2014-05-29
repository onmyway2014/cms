require_relative '../../spec_helper'
require './lib/core/generator'
require './lib/core/resource/builtin_resource'
require 'uri'


module Cms
  module Core

    # ,:ignore

    describe 'Integration::Generator' do

      class TestPerson
        SEX_MALE='male'
        SEX_FEMALE='female'

        attr_accessor :name, :age, :sex
        attr_accessor :children

        def initialize(name, age, sex)

          @name = name
          @age = age
          @sex = sex

          @children = []
        end
      end

      it 'should do something' do
        t = BuiltinResource.new 'Builtin://Data', 'Hello:<%=model.name%>'
        m = BuiltinResource.new 'Builtin://Data', TestPerson.new('john', 100, TestPerson::SEX_MALE)
        d = BuiltinResource.new 'Builtin://Data'

        g = Generator.new m, t, d
        g.engine_type = TemplateEngineFactory::ENGINE_ERB
        g.should be_run

        d.get.should == 'Hello:john'

      end
    end
  end
end
