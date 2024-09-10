# frozen_string_literal: true

module InkComponents
  module Forms
    module Label
      class Component < ApplicationComponent
        style do
          base { %w[ block mb-2 text-sm font-medium ] }
          variants {
            state {
              default { "text-gray-900 dark:text-white" }
              success { "text-green-700 dark:text-green-500" }
              error { "text-red-700 dark:text-red-500" }
            }
          }
          defaults { { state: :default } }
        end

        attr_reader :state, :extra_attributes

        def initialize(state: nil, **extra_attributes)
          @state = state
          @extra_attributes = extra_attributes

          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(state:) }
        end

        def render?
          content.present?
        end
      end
    end
  end
end
