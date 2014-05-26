require 'uri'

class Resource

  attr_reader :uri

  def initialize(uri)
    raise ArgumentError, 'uri is nil' if uri.nil?

    if uri.instance_of?(String)
      raise ArgumentError, 'uri is string but its empty!' if uri.empty?

      u = URI.parse uri
      raise ArgumentError, "uri:#{uri} is invalid!" if u.scheme.nil?
      @uri = u
    else
      @uri = uri
    end
  end


end