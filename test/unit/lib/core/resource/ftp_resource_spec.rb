require './test/spec_helper'
require './lib/core/resource/ftp_resource'

module Cms
  module Core
    describe 'Resource::FtpResource' do

      it 'should be instance' do

        FtpResource.new 'ftp://www.host.cms'

        expect{FtpResource.new 'http://www.host.cms'}.to raise_error(ArgumentError, "scheme not match,scheme:'ftp'")
      end

      it 'should be write' do
        fr = FtpResource.new 'ftp://testuser:123456@localhost/dir1/test.txt'
        fr.put("hello\n")
      end

      it 'should be read'
    end
  end
end