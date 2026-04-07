# frozen_string_literal: true

module InkComponents
  module Timeline
    class Component < ApplicationComponent
      renders_many :items, ->(**attrs, &block) { ItemComponent.new(**attrs, &block) }

      style do
        base { %w[relative] }

        variants {
          orientation {
            vertical { %w[border-s border-gray-200 dark:border-gray-700] }
            horizontal { %w[items-center sm:flex] }
          }
        }

        defaults { { orientation: :vertical } }
      end

      attr_reader :orientation

      def initialize(orientation: nil, **extra_attributes)
        @orientation = orientation
        super(**extra_attributes)
      end

      class ItemComponent < ApplicationComponent
        def call
          content
        end
      end

      private

      def default_attributes
        { class: style(orientation:) }
      end
    end
  end
end
