require_relative 'resource_base'

module Cms
  module Core

    class BuiltinResource < ResourceBase

      def initialize(uri,data=nil)
        @scheme = 'builtin'
        super(uri)
        @data = data unless data.nil?
      end

      def put(data)
        @data = data
      end

      def get
        @data
      end

    end

  end

end
