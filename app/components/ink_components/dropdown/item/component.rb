# frozen_string_literal: true

module InkComponents
  module Dropdown
    module Item
      class Component < ApplicationComponent
        style do
          base { %w[flex items-center px-4 py-2.5 gap-2 text-sm] }
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
