# frozen_string_literal: true

module InkComponents
  module Badge
    class Component < ApplicationComponent
      style do
        base { "font-medium me-2 px-2.5 py-0.5" }

        variants {
          color {
            pink { "bg-pink-100 text-pink-800 dark:bg-pink-900 dark:text-pink-300" }
            dark { "bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300" }
            blue { "bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300" }
            red { "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300" }
            green { "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300" }
            yellow { "bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300" }
            indigo { "bg-indigo-100 text-indigo-800 dark:bg-indigo-900 dark:text-indigo-300" }
            purple { "bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-300" }
          }

          bordered {
            yes { "dark:bg-gray-700 border" }
          }

          size {
            xs { "text-xs" }
            sm { "text-sm" }
          }

          pill {
            yes { "rounded-full" }
            no { "rounded" }
          }
        }

        # compound_variants [
        #   { color: :pink, bordered: :yes, classes: "border-pink-400 dark:text-pink-400" },
        #   { color: :dark, bordered: :yes, classes: "border-gray-500 dark:text-gray-400" },
        #   { color: :blue, bordered: :yes, classes: "border-blue-400 dark:text-blue-400" },
        #   { color: :red, bordered: :yes, classes: "border-red-400 dark:text-red-400" },
        #   { color: :green, bordered: :yes, classes: "border-green-400 dark:text-green-400" },
        #   { color: :yellow, bordered: :yes, classes: "border-yellow-300 dark:text-yellow-300" },
        #   { color: :indigo, bordered: :yes, classes: "border-indigo-400 dark:text-indigo-400" },
        #   { color: :purple, bordered: :yes, classes: "border-purple-400 dark:text-purple-400" }
        # ]

        defaults { { color: :pink, bordered: :no, size: :xs, pill: :no } }
      end

      attr_reader :color, :bordered, :size, :pill

      def initialize(color: nil, bordered: nil, size: nil, pill: nil, **extra_attributes)
        @color = color
        @bordered = bordered
        @size = size
        @pill = pill

        super(**extra_attributes)
      end

      private
      def default_attributes
        { class: style(color:, bordered:, size:, pill:) }
      end

      def render?
        content.present?
      end
    end
  end
end
