# frozen_string_literal: true

module InkComponents
  module Dropdown
    module Divider
      class Component < ApplicationComponent
        style do
          base { %w[ h-[1px] bg-gray-100 dark:bg-gray-600 my-1 ] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        def call
          tag.div(**attributes)
        end

        private
        def default_attributes
          {
            class: default_classes
          }
        end

        def default_classes
          style
        end
      end
    end
  end
end
