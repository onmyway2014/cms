require 'net/http'
require 'rest-client'

module Cms
  module Core
    class HttpResource < ResourceBase

      def initialize (uri)
        @scheme = 'http'
        super
      end

      def get
        # Net::HTTP.get uri
        RestClient.get uri.to_s
      end

    end

  end
end