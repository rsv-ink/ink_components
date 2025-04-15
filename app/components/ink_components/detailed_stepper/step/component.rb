module InkComponents
  module DetailedStepper
    module Step
      class Component < ApplicationComponent
        style do
          base { %w[flex items-center space-x-2.5 rtl:space-x-reverse] }

          variants {
            active {
              yes { %w[text-pink-600 dark:text-pink-500] }
              no { %w[text-gray-500 dark:text-gray-400] }
            }
          }

          defaults { { active: false } }
        end

        attr_reader :title, :subtitle, :number, :active

        def initialize(title:, subtitle:, number:, active: false, **extra_attributes)
          @title = title
          @subtitle = subtitle
          @number = number
          @active = active
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(active:) }
        end
      end
    end
  end
end
