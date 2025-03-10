# frozen_string_literal: true

module InkComponents
  module Table
    module Cell
      class Component < ApplicationComponent
        style do
          variants {
            size {
              md { %w[text-md] }
            }

            spacing {
              md { %w[px-6 py-3] }
            }

            displacement {
              left { %w[text-left] }
              right { %w[text-right] }
              center { %w[text-center] }
            }
          }

          defaults { { size: :md, spacing: :md } }
        end

        attr_reader :type, :scope, :size, :spacing, :displacement

        def initialize(type: :td, scope: nil, size: nil, spacing: nil, displacement: nil, **extra_attributes)
          @type = type
          @scope = scope
          @size = size
          @spacing = spacing
          @displacement = displacement

          super(**extra_attributes)
        end

        def call
          content_tag(@type, attributes) do
            content
          end
        end

        private
        def default_attributes
          { scope:, class: style(size:, spacing:, displacement:) }
        end
      end
    end
  end
end
