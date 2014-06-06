require 'net/http'
require_relative './resource_base'

module Cms
  module Core

    class HttpResource < ResourceBase
      SCHEME = 'http'

      def get
        Net::HTTP.get uri
        # RestClient.get uri.to_s
      end

    end

  end
end