# frozen_string_literal: true

module InkComponents
  module Spin
    class Preview < Lookbook::Preview
      # @param size select { choices: [xs, sm, md, lg, xl] }
      # @param color select { choices: [pink, dark, blue, red, green, yellow, indigo, purple] }
      # @param theme select { choices: [gray, colorful] }
      def playground(size: :md, color: :pink, theme: :gray)
        spin_component(size:, color:, theme:)
      end

      # @!group Sizes
      def extra_small
        spin_component(size: :xs)
      end

      def small
        spin_component(size: :sm)
      end

      def medium
        spin_component(size: :md)
      end

      def large
        spin_component(size: :lg)
      end

      def extra_large
        spin_component(size: :xl)
      end
      # @!endgroup

      # @!group Colors Gray Theme
      def pink
        spin_component(color: :pink, theme: :gray)
      end

      def dark
        spin_component(color: :dark, theme: :gray)
      end

      def blue
        spin_component(color: :blue, theme: :gray)
      end

      def red
        spin_component(color: :red, theme: :gray)
      end

      def green
        spin_component(color: :green, theme: :gray)
      end

      def yellow
        spin_component(color: :yellow, theme: :gray)
      end

      def indigo
        spin_component(color: :indigo, theme: :gray)
      end

      def purple
        spin_component(color: :purple, theme: :gray)
      end
      # @!endgroup

      # @!group Colors Colorful Theme
      def pink_colorful
        spin_component(color: :pink, theme: :colorful)
      end

      def dark_colorful
        spin_component(color: :dark, theme: :colorful)
      end

      def blue_colorful
        spin_component(color: :blue, theme: :colorful)
      end

      def red_colorful
        spin_component(color: :red, theme: :colorful)
      end

      def green_colorful
        spin_component(color: :green, theme: :colorful)
      end

      def yellow_colorful
        spin_component(color: :yellow, theme: :colorful)
      end

      def indigo_colorful
        spin_component(color: :indigo, theme: :colorful)
      end

      def purple_colorful
        spin_component(color: :purple, theme: :colorful)
      end
      # @!endgroup
    end
  end
end
