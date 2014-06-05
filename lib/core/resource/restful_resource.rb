require_relative './resource_base'
require 'rest-client'
require 'json'

module Cms
  module Core
    class RESTfulResource < ResourceBase

      def initialize(uri)
        @scheme = 'http'
        super
      end

      def get
        result = RestClient.get uri.to_s
        JSON.load(result, nil, {:object_class=>JSON::GenericObject})
      end

      def put(data)
        fail 'not implement!'
        RestClient.put(uri.to_s,data)
      end

    end

  end
end