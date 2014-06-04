require './test/spec_helper'
require './lib/core/resource/resource_base'


module Cms
  module Core

    describe 'Resource::ResourceBase' do
      context 'initialize' do
        it 'exception when argument given nil' do
          expect { ResourceBase.new nil }.to raise_error
        end

        it 'exception when argument given not uri string' do
          expect { ResourceBase.new '' }.to raise_error(ArgumentError)
          expect { ResourceBase.new('hello') }.to raise_error(ArgumentError, 'uri:hello is bad URI!')
        end

        it 'raise exception when argument given invalid URI' do
          expect { ResourceBase.new 'http://' }.to raise_error(ArgumentError, /uri:.* is bad URI!/)
          expect { ResourceBase.new 'http://@ssdf&sfdd' }.to raise_error(ArgumentError, /uri:.* is bad URI!/)
        end

        it 'do not initialize' do
          expect { ResourceBase.new 'http://www.google.com' }.to raise_error
        end
      end
    end

  end
end
