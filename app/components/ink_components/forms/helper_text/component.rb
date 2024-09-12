# frozen_string_literal: true

module InkComponents
  module Forms
    module HelperText
      class Component < ApplicationComponent
        style do
          base { "mt-2" }
          variants {
            state {
              default { "text-gray-500 dark:text-gray-400" }
              success { "text-green-600 dark:text-green-500" }
              error { "text-red-600 dark:text-red-500" }
            }

            size {
              xs { "text-xs" }
              sm { "text-sm" }
            }
          }
          defaults { { size: :sm, state: :default } }
        end

        attr_reader :size, :state

        def initialize(size: nil, state: nil, **extra_attributes)
          @size = size
          @state = state
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(size:, state:) }
        end

        def render?
          content.present?
        end
      end
    end
  end
end
