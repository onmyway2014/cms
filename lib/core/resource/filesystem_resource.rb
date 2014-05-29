require_relative 'resource_base'

module Cms
  module Core
    class FilesystemResource < ResourceBase

      def initialize(uri)
        @scheme = 'file'
        super
        @filename = @uri.path
      end

      def put(data)
        File.write(@filename, data)
      end

      def get
        File.read(@filename)
      end
    end
  end
end
