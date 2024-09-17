# frozen_string_literal: true

module InkComponents
  module ProgressBar
    class Component < ApplicationComponent
      style do
        base { %w[ w-full bg-gray-200 rounded-full dark:bg-gray-700 ] }

        variants {
          size {
            sm { "h-1.5" }
            md { "h-2.5" }
            lg { "h-4" }
            xl { "h-6" }
          }
        }

        defaults { { size: :md } }
      end

      style :inner_bar do
        base { %w[ rounded-full ] }

        variants {
          size {
            sm { "h-1.5" }
            md { "h-2.5" }
            lg { "h-4" }
            xl { "h-6" }
          }

          progress_position {
            inside { %w[ text-xs font-medium text-center p-0.5 leading-none dark:text-white ] }
          }

          color {
            pink { "bg-pink-600 dark:bg-pink-500 text-pink-100" }
            dark { "bg-gray-600 dark:bg-gray-300 text-gray-100" }
            blue { "bg-blue-600 text-blue-100" }
            red { "bg-red-600 dark:bg-red-500 text-red-100" }
            green { "bg-green-600 dark:bg-green-500 text-green-100" }
            yellow { "bg-yellow-400 text-yellow-100" }
            indigo { "bg-indigo-600 dark:bg-indigo-500 text-indigo-100" }
            purple { "bg-purple-600 dark:bg-purple-500 text-purple-100" }
          }
        }

        defaults { { size: :md, color: :pink } }
      end

      style :label do
        base { %w[text-sm font-medium dark:text-white] }

        variants {
          color {
            pink { "text-pink-700" }
            dark { "text-gray-700" }
            blue { "text-blue-700" }
            red { "text-red-700" }
            green { "text-green-600" }
            yellow { "text-yellow-500" }
            indigo { "text-indigo-700" }
            purple { "text-purple-700" }
          }
        }

        defaults { { color: :pink } }
      end

      attr_reader :progress, :progress_position, :size, :color

      def initialize(progress:, progress_position: nil, size: nil, color: nil, **extra_attributes)
        @progress = progress
        @progress_position = progress_position
        @size = size
        @color = color
        super(**extra_attributes)
      end

      private
      def default_attributes
        { class: style(size: size_option) }
      end

      def inner_bar_attributes
        {
          class: style(:inner_bar, size: size_option, color:, progress_position:),
          style: "width: #{display_progress}"
        }
      end

      def display_progress
        "#{progress}%"
      end

      def size_option
        progress_inside? || size
      end

      def progress_inside?
        progress_position == :inside
      end

      def progress_on_top?
        progress_position == :top
      end
    end
  end
end
