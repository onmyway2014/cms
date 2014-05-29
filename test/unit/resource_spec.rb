require_relative '../spec_helper'
require './lib/core/resource/resource_base'
require './lib/core/resource/builtin_resource'
require './lib/core/resource/filesystem_resource'
require 'uri'

module Cms
  module Core
    describe 'Core::Resource' do

      describe 'ResourceBase' do
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

      describe 'BuiltinResource' do

        it 'should exception when init given uri scheme not builtin' do
          expect { BuiltinResource.new 'Builtin://data' }.not_to raise_error
          expect { BuiltinResource.new 'file:///tmp/test.html' }.to raise_error(ArgumentError, 'scheme incorrect')
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

      describe 'FilesystemResource' do

        it 'should exception when init given uri scheme not file' do
          expect { FilesystemResource.new 'fpt://www.google.com' }.to raise_error(ArgumentError, 'scheme incorrect')
        end

        def assert_write(uri_str, content)
          filename = URI.parse(uri_str).path
          fr = FilesystemResource.new uri_str
          fr.put content
          c = File.read(filename)
          begin
            c.should == content
          ensure
            File.delete filename
          end

        end

        it 'should be write' do
          assert_write 'file://localhost/tmp/test.txt', 'Hello'
          assert_write 'file:///tmp/test2.txt', '<h1>World<h1>'
          assert_write 'file:///tmp/test3.txt?encoding=utf-8', "bye\nbye"
          assert_write 'file://c:/tmp/test4.txt','Hello'

        end

        def assert_read(uri_str, content)
          filename = URI.parse(uri_str).path
          File.write(filename, content)
          fr = FilesystemResource.new uri_str
          begin
            fr.get.should == content
          ensure
            File.delete filename
          end
        end

        it 'should be read' do
          assert_read 'file://localhost/tmp/test.txt', 'Hello'
          assert_read 'file:///tmp/test2.txt', '<h1>World<h1>'
          assert_read 'file:///tmp/test3.txt?encoding=utf-8', "bye\nbye"
          assert_read 'file://c:/tmp/test4.txt','Hello'
        end
      end

    end

  end
end
