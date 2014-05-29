module Cms
  module Core
    class ContentFilterBase

      # @param [String] content
      # @return [TrueClass,FalseClass]
      def do?(content)
        raise 'not implement'
      end
    end

  end
end