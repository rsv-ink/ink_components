# frozen_string_literal: true

module InkComponents
  module Table
    module Row
      class Component < ApplicationComponent
        renders_many :cells, Cell::Component

        style do
          variants {
            hover {
              yes { %w[hover:bg-gray-100 dark:hover:bg-gray-800] }
            }

            border {
              yes { %w[border-b border-gray-200 dark:border-gray-700] }
            }
          }
        end

        attr_reader :hover, :border

        def initialize(hover: nil, border: nil, **extra_attributes)
          @hover = hover
          @border = border

          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(hover:, border:) }
        end
      end
    end
  end
end
