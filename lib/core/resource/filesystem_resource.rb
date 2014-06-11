require_relative 'resource_base'

module Cms
  module Core

    class FilesystemResource < ResourceBase
      SCHEME = 'file'

      def initialize(uri)
        # @scheme = 'file'
        super
        @path = File.dirname @uri.path
        @filename = @uri.path
      end

      def put(data)
        mkdir @path
        File.write(@filename, data)
      end

      def get
        File.read(@filename)
      end

      private
      def mkdir(path)
        unless File.directory? path
          a = path.split('/');a.pop;
          mkdir(a.join('/'))
          Dir.mkdir(path)
        end
      end

    end
  end
end

