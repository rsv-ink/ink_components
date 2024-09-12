# frozen_string_literal: true

module InkComponents
  module Badge
    class Component < ApplicationComponent
      style do
        base { "font-medium me-2" }

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

          size {
            xs { "text-xs" }
            sm { "text-sm" }
          }

          bordered {
            yes do |color:, **|
              %w[dark:bg-gray-700 border].tap do
                _1 << "border-pink-400 dark:text-pink-400" if color == :pink
                _1 << "border-gray-500 dark:text-gray-400" if color == :dark
                _1 << "border-blue-400 dark:text-blue-400" if color == :blue
                _1 << "border-red-400 dark:text-red-400" if color == :red
                _1 << "border-green-400 dark:text-green-400" if color == :green
                _1 << "border-yellow-300 dark:text-yellow-300" if color == :yellow
                _1 << "border-indigo-400 dark:text-indigo-400" if color == :indigo
                _1 << "border-purple-400 dark:text-purple-400" if color == :purple
              end
            end
          }

          pill {
            yes { "rounded-full" }
            no { "rounded" }
          }

          href {
            yes do |color:, **|
              %w[inline-flex items-center justify-center].tap do
                _1 << "hover:bg-pink-200" if color == :pink
                _1 << "hover:bg-gray-200" if color == :dark
                _1 << "hover:bg-blue-200" if color == :blue
                _1 << "hover:bg-red-200" if color == :red
                _1 << "hover:bg-green-200" if color == :green
                _1 << "hover:bg-yellow-200" if color == :yellow
                _1 << "hover:bg-indigo-200" if color == :indigo
                _1 << "hover:bg-purple-200" if color == :purple
              end
            end
          }

          dismissable {
            yes { "inline-flex items-center px-2 py-1 me-2" }
            no { "px-2.5 py-0.5" }
          }
        }

        defaults { { color: :pink, size: :xs, bordered: :no, pill: :no, href: :no, dismissable: :no } }
      end

      style :dismiss_button do
        base { "inline-flex items-center p-1 ms-2 text-sm bg-transparent rounded-sm" }

        variants {
          color {
            pink { "text-pink-400 hover:bg-pink-200 hover:text-pink-900 dark:hover:bg-pink-800 dark:hover:text-pink-300" }
            dark { "text-gray-400 hover:bg-gray-200 hover:text-gray-900 dark:hover:bg-gray-800 dark:hover:text-gray-300" }
            blue { "text-blue-400 hover:bg-blue-200 hover:text-blue-900 dark:hover:bg-blue-800 dark:hover:text-blue-300" }
            red { "text-red-400 hover:bg-red-200 hover:text-red-900 dark:hover:bg-red-800 dark:hover:text-red-300" }
            green { "text-green-400 hover:bg-green-200 hover:text-green-900 dark:hover:bg-green-800 dark:hover:text-green-300" }
            yellow { "text-yellow-400 hover:bg-yellow-200 hover:text-yellow-900 dark:hover:bg-yellow-800 dark:hover:text-yellow-300" }
            indigo { "text-indigo-400 hover:bg-indigo-200 hover:text-indigo-900 dark:hover:bg-indigo-800 dark:hover:text-indigo-300" }
            purple { "text-purple-400 hover:bg-purple-200 hover:text-purple-900 dark:hover:bg-purple-800 dark:hover:text-purple-300" }
          }
        }

        defaults { { color: :pink } }
      end

      attr_reader :id, :color, :size, :bordered, :pill, :href, :dismissable

      def initialize(id: nil, color: nil, size: nil, bordered: nil, pill: nil, href: nil, dismissable: nil, **extra_attributes)
        @id = id
        @color = color
        @size = size
        @bordered = bordered
        @pill = pill
        @href = href
        @dismissable = dismissable

        super(**extra_attributes)
      end

      private
      def default_attributes
        { id:, class: style(color:, bordered:, size:, pill:, href: href.present?, dismissable:), href: }
      end

      def dismiss_button_attributes
        { class: style(:dismiss_button, color:), type: "button", "aria-label": "Remove", "data-dismiss-target": "##{id}" }
      end

      def render?
        content.present?
      end
    end
  end
end