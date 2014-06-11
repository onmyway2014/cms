require_relative './resource_base'
require 'net/ftp'

module Cms
  module Core

    class FtpResource < ResourceBase
      SCHEME = 'ftp'

      def put(data)
        Net::FTP.open(@uri.host,@uri.user, @uri.password) do |client|
          client.chdir File.dirname(@uri.path)
          local_file = "/tmp/#{rand(99999999)}"
          File.write local_file, data
          client.put(local_file, File.basename(@uri.path))
          client.close
          File.delete local_file
        end
      end


    end

  end
end