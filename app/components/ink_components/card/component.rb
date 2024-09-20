# frozen_string_literal: true

module InkComponents
    module Card
      class Component < ApplicationComponent
        style do
          base { "p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700" }

          variants {
            orientation {
              vertical { "max-w-sm" }
              horizontal { "flex flex-col items-center md:flex-row md:max-w-xl" }
            }
          }

          defaults { { orientation: :vertical } }
        end

        attr_reader :orientation

        def initialize(orientation: nil, **extra_attributes)
          @orientation = orientation

          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(orientation:) }
        end

        def render?
          content.present?
        end
      end
    end
end
