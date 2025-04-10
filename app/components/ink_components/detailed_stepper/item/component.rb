module InkComponents
  module DetailedStepper
    module Item
      class Component < ApplicationComponent
        attr_accessor :state
        attr_reader :number, :title, :description

        style do
          base { %w[flex items-center space-x-2.5 rtl:space-x-reverse] }
          variants {
            state {
              current { %w[text-pink-600 dark:text-pink-500] } # Changed blue to pink to match theme
              upcoming { %w[text-gray-500 dark:text-gray-400] }
            }
          }
          defaults { { state: :upcoming } }
        end

        style :indicator do
          base { %w[flex items-center justify-center w-8 h-8 border rounded-full shrink-0] }
          variants {
            state {
              current { %w[border-pink-600 dark:border-pink-500] } # Changed blue to pink
              upcoming { %w[border-gray-500 dark:border-gray-400] }
            }
          }
          defaults { { state: :upcoming } }
        end

        # Keep initializer simple: number, title, description are core data. State can be managed.
        def initialize(number:, title:, description:, state: :upcoming, **extra_attributes)
          @number = number
          @title = title
          @description = description
          @state = state # Allow explicit state setting
          super(**extra_attributes)
        end

        private

        def default_attributes
          { class: style(state:) }
        end

        def indicator_attributes
          { class: style(:indicator, state:) }
        end
      end
    end
  end
end
