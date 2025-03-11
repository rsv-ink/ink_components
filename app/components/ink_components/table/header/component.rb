# frozen_string_literal: true

module InkComponents
  module Table
    module Header
      class Component < ApplicationComponent
        renders_many :cells, ->(**attrs) { Cell::Component.new(type: :th, scope: :col, class: "px-6 py-3", **attrs) }

        style do
          base { %w[text-gray-700 bg-gray-50 dark:bg-gray-700 dark:text-gray-400] }

          variants {
            size {
              xs { %w[text-xs] }
              sm { %w[text-sm] }
              md { %w[text-md] }
            }

            border {
              yes { %w[border-b border-gray-200 dark:border-gray-700] }
            }

            uppercase {
              yes { %w[uppercase] }
            }
          }

          defaults { { size: :md } }
        end

        attr_reader :size, :uppercase, :border

        def initialize(size: nil, uppercase: false, border: true, **extra_attributes)
          @size = size
          @uppercase = uppercase
          @border = border

          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(size:, uppercase:, border:) }
        end
      end
    end
  end
end
