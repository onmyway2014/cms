
module Cms
  module Core
    class TemplateContext

      attr_accessor :model

      def initialize(model=nil)

        @model = model
      end

      def get_binding
        binding
      end
    end

  end
end