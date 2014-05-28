require_relative '../../spec_helper'
require './lib/core/generator'
require './lib/core/resource/builtin_resource'
require 'uri'


module Cms
  module Core
    describe 'Integration::Generator' do

      it 'should do something' do
        r = BuiltinResource.new 'Builtin://Data'
        r.put 'hello'
        g = Generator.new r, r, r
        g.should be_run


      end
    end
  end
end
