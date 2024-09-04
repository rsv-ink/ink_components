# frozen_string_literal: true

module InkComponents
  module Example
    class Component < ApplicationComponent
      style do
        base {
          %w[
            text-white bg-blue-700 hover:bg-blue-800 focus:ring-4
            focus:ring-blue-300 font-medium rounded-lg px-5 py-2.5 me-2 mb-2
            dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800
          ]
        }
        variants {
          size {
            sm { "text-sm" }
            md { "text-base" }
            lg { "px-4 py-3 text-lg" }
          }
        }
        defaults { { size: :md } }
      end

      attr_reader :size

      def initialize(size:, **user_attributes)
        @size = size
        super(**user_attributes)
      end

      def default_attributes
        {
          class: style(size: size),
          type: "button",
          title: "example-button"
        }
      end
    end
  end
end
