module InkComponents
  module Carousel
    module PrevButton
      class Component < ApplicationComponent
        style do
          base { %w[ absolute top-0 start-0 z-30 h-full !p-0 cursor-pointer group focus:outline-none inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none ] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        private

        def default_attributes
          {
            class: style,
            data: { "carousel-prev": "" },
            type: "button"
          }
        end
      end
    end
  end
end
