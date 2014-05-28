require_relative 'resource_base'

module Cms
  module Core

    class BuiltinResource < ResourceBase

      def initialize(uri)
        @scheme = 'builtin'
        super
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
