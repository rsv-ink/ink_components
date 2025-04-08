module InkComponents
  module Carousel
    module NextButton
      class Component < ApplicationComponent
        renders_one :icon_container, "IconContainerComponent"

        style do
          base { %w[ absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none ] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        private

        def default_attributes
          {
            class: style,
            data: { "carousel-next": "" },
            type: "button"
          }
        end

        class IconContainerComponent < ApplicationComponent
          style do
            base { %w[ inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none ] }
          end

          def initialize(**extra_attributes)
            super(**extra_attributes)
          end

          def call
            tag.span(**attributes) do
              content
            end
          end

          private

          def default_attributes
            { class: style }
          end
        end
      end
    end
  end
end
