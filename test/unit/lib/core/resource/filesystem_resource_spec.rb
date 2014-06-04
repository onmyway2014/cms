require './test/spec_helper'
require './lib/core/resource/filesystem_resource'

module Cms
  module Core

    describe 'Resource::FilesystemResource' do

      it 'should exception when init given uri scheme not file' do
        expect { FilesystemResource.new 'ftp://www.google.com' }.to raise_error(ArgumentError, "scheme not match,scheme:'file'")
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
        assert_write 'file://c:/tmp/test4.txt', 'Hello'

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
        assert_read 'file://c:/tmp/test4.txt', 'Hello'
      end
    end

  end
end