require 'uri'
module Cms
  class Resource
    attr_reader :uri

    def initialize(uri)
      raise ArgumentError, 'uri is nil' if uri.nil?

      if uri.instance_of?(String)
        raise ArgumentError, 'uri is string but its empty!' if uri.empty?

        begin
          u = URI.parse uri
        rescue URI::InvalidURIError
          raise ArgumentError, "uri:#{uri} is bad URI!"
        end

        raise ArgumentError, "uri:#{uri} is bad URI!" if u.scheme.nil?
        @uri = u
      else
        @uri = uri
      end
    end

    def get
      raise 'not implement'

    end

    def put (data)
      raise 'not implement'
      #raise ArgumentError if data.nil?
    end

  end
end