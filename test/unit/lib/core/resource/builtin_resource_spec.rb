require './test/spec_helper'
require './lib/core/resource/builtin_resource'

module Cms
  module Core

    describe 'Resource::BuiltinResource' do

      it 'should be read and write' do
        br = BuiltinResource.new

        br.get.should == nil
        br.put 'Hello'
        br.get.should == 'Hello'

        br.put 'World'
        br.get.should == 'World'

        b2 = BuiltinResource.new 'data'
        b2.get.should == 'data'
        b2.put 'write data'
        b2.get.should == 'write data'
      end
    end

  end
end