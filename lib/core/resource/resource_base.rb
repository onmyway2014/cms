require 'uri'

module Cms
  module Core
    class ResourceBase

      # returns the URI
      # @return [URI]
      # @param [URI]
      attr_reader :uri

      # @param [URI] uri
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

        raise ArgumentError, "scheme not match,scheme:'#{self.class::SCHEME}'" unless @uri.scheme == self.class::SCHEME

      end

      def get
        raise 'not implement'

      end

      def put (data)
        raise 'not implemented'
        #raise ArgumentError if data.nil?
      end

    end
  end
end
