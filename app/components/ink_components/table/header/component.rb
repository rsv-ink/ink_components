# frozen_string_literal: true

module InkComponents
  module Table
    module Header
      class Component < ApplicationComponent
        renders_many :cells, -> { Cell::Component.new(type: :th, scope: :col) }

        style do
          base { %w[text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400] }

          variants {
            size {
              xs { %w[text-xs] }
              sm { %w[text-sm] }
              md { %w[text-md] }
            }
          }

          defaults { { size: :xs } }
        end

        attr_reader :size

        def initialize(size: nil, **extra_attributes)
          @size = size

          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(size:) }
        end
      end
    end
  end
end
