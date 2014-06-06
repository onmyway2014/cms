require_relative 'resource_base'

module Cms
  module Core

    class BuiltinResource < ResourceBase
      SCHEME = 'builtin'

      def initialize(data=nil)
        # @scheme = 'builtin'
        uri='builtin://Data'
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
