module InkComponents
  module Breadcrumb
    module List
      class Component < ApplicationComponent
        renders_many :items, Item::Component

        style do
          base { %w[inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        private

        def default_attributes
          { class: style }
        end
      end
    end
  end
end
