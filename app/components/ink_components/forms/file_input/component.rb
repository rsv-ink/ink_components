# frozen_string_literal: true

module InkComponents
  module Forms
    module FileInput
      class Component < ApplicationComponent
        renders_one :helper_text, HelperText::Component

        style do
          base {
            %w[
              block w-full text-gray-900 border border-gray-300 rounded-lg cursor-pointer
              bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700
              dark:border-gray-600 dark:placeholder-gray-400
            ]
          }
          variants {
            size {
              xs { "text-xs" }
              sm { "text-sm" }
              lg { "text-lg" }
            }
          }
          defaults { { size: :sm } }
        end

        attr_reader :size

        def initialize(size: nil, **extra_attributes)
          @size = size

          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(size:), type: "file" }
        end
      end
    end
  end
end
