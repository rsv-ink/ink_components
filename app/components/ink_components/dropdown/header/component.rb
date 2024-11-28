# frozen_string_literal: true

module InkComponents
  module Dropdown
    module Header
      class Component < ApplicationComponent
        style do
          base { %w[px-4 pt-3 pb-2 text-sm font-semibold text-gray-900 dark:text-white] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        def call
          content_tag(:div, **attributes) { content }
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
