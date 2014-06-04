require './test/spec_helper'
require './lib/core/resource/builtin_resource'

module Cms
  module Core

    describe 'Resource::BuiltinResource' do

      it 'should exception when init given uri scheme not builtin' do
        expect { BuiltinResource.new 'Builtin://data' }.not_to raise_error
        expect { BuiltinResource.new 'file:///tmp/test.html' }.to raise_error(ArgumentError, 'scheme not match,scheme:\'builtin\'')
      end

      it 'should be read and write' do
        br = BuiltinResource.new 'builtin://data'

        br.get.should == nil
        br.put 'Hello'
        br.get.should == 'Hello'

        br.put 'World'
        br.get.should == 'World'
      end
    end

  end
end