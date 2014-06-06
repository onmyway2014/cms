require_relative './resource_base'
require 'rest-client'
require 'json'
require 'hashie'

module Cms
  module Core

    class RESTfulResource < ResourceBase
      SCHEME = 'http'

      def get
        result = RestClient.get uri.to_s
        # JSON.load(result, nil, {:object_class=>JSON::GenericObject})
        h = JSON.parse result
        Hashie::Mash.new h
      end

      def put(data)
        fail 'not implement!'
        RestClient.put(uri.to_s,data)
      end



    end

  end
end