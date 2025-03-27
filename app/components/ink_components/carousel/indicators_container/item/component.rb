module InkComponents
  module Carousel
    module IndicatorsContainer
      module Item
        class Component < ApplicationComponent
          style do
            base { %w[ w-3 h-3 rounded-full bg-white/50 dark:bg-gray-800/50 hover:bg-white dark:hover:bg-gray-800 ] }
          end

          attr_reader :index

          def initialize(index:, **extra_attributes)
            @index = index

            super(**extra_attributes)
          end

          def call
            tag.button(**attributes)
          end

          private

          def default_attributes
            {
              class: style,
              type: "button",
              aria_label: "Slide #{index}",
              data: {
                carousel_slide_to: index
              }
            }
          end
        end
      end
    end
  end
end
