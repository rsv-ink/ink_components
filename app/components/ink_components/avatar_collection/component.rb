# frozen_string_literal: true

module InkComponents
  module AvatarCollection
    class Component < ApplicationComponent
      renders_many :avatars, Avatar::Component

      style do
        base { "flex -space-x-4 rtl:space-x-reverse" }
      end

      style :link_plus do
        base { "flex items-center justify-center font-medium text-white bg-gray-700 border-2 border-white hover:bg-gray-600 dark:border-gray-800" }

        variants {
          size {
            xs { "w-6 h-6 text-xs" }
            sm { "w-8 h-8 text-xs" }
            md { "w-10 h-10 text-xs" }
            lg { "w-20 h-20 text-lg" }
            xl { "w-36 h-36 text-xl" }
          }
          shape {
            circle { "rounded-full" }
            square { "rounded" }
          }
        }

        defaults { { size: :md, shape: :circle } }
      end

      attr_reader :size, :shape, :href

      def initialize(size: nil, shape: nil, **extra_attributes)
        @size = size
        @shape = shape
        @href = extra_attributes[:href]

        super(**extra_attributes)
      end

      private
      def default_attributes
        { class: style }
      end

      def render?
        avatars.any?
      end

      def link_plus_attributes
        { class: style(:link_plus, size:, shape:), href: }
      end
    end
  end
end
