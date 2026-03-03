# frozen_string_literal: true

module InkComponents
  module Spin
    class Component < ApplicationComponent
      style do
        base { "animate-spin" }

        variants {
          size {
            xs { "size-6" }
            sm { "size-8" }
            md { "size-10" }
            lg { "size-20" }
            xl { "size-36" }
          }
          theme {
            gray { "text-gray-200" }
            colorful { "" }
          }
          color {
            pink { "fill-pink-600" }
            dark { "fill-gray-800" }
            blue { "fill-blue-600" }
            red { "fill-red-600" }
            green { "fill-green-600" }
            yellow { "fill-yellow-400" }
            indigo { "fill-indigo-600" }
            purple { "fill-purple-600" }
          }
        }

        compound(theme: :colorful, color: :pink) { "text-pink-200" }
        compound(theme: :colorful, color: :dark) { "text-gray-200" }
        compound(theme: :colorful, color: :blue) { "text-blue-200" }
        compound(theme: :colorful, color: :red) { "text-red-200" }
        compound(theme: :colorful, color: :green) { "text-green-200" }
        compound(theme: :colorful, color: :yellow) { "text-yellow-200" }
        compound(theme: :colorful, color: :indigo) { "text-indigo-200" }
        compound(theme: :colorful, color: :purple) { "text-purple-200" }

        defaults { { size: :md, theme: :gray, color: :pink } }
      end

      style :wrapper do
        base { "inline-flex items-center justify-center" }

        defaults { {} }
      end

      attr_reader :size, :color, :theme

      def initialize(size: nil, color: nil, theme: nil, **extra_attributes)
        @size = size
        @color = color
        @theme = theme

        super(**extra_attributes)
      end

      private

      def default_attributes
        {
          class: style(size:, theme:, color:),
          "aria-hidden": "true",
          viewBox: "0 0 100 101",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg"
        }
      end

      def wrapper_attributes
        {
          role: "status",
          class: style(:wrapper)
        }
      end
    end
  end
end
