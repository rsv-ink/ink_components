# frozen_string_literal: true

module InkComponents
  module Button
    class Preview < Lookbook::Preview
      # @param content text
      # @param href text
      # @param disabled toggle
      # @param builder select { choices: [link_to, button_tag, button_to] }
      # @param color select { choices: [pink, blue, alternative, dark, light, green, red, yellow, purple] }
      # @param size select { choices: [xs, sm, md, lg, xl] }
      # @param shape select { choices: [default, pill, outline] }
      def playground(builder: :link_to, href: "#", disabled: false, color: :pink, shape: :default, size: :md, content: "Button")
        render(InkComponents::Button::Component.new(builder:, href:, disabled:, color:, shape:, size:)) { content }
      end

      # @!group Shapes
      def default
        render(InkComponents::Button::Component.new(shape: :default)) { "Default" }
      end

      def pill
        render(InkComponents::Button::Component.new(shape: :pill)) { "Pill" }
      end

      def outline
        render(InkComponents::Button::Component.new(shape: :outline)) { "Outline" }
      end
      # @!endgroup

      # @!group Sizes
      def extra_small
        render(InkComponents::Button::Component.new(size: :xs)) { "Extra small" }
      end

      def small
        render(InkComponents::Button::Component.new(size: :sm)) { "Small" }
      end

      def medium
        render(InkComponents::Button::Component.new(size: :md)) { "Medium" }
      end

      def large
        render(InkComponents::Button::Component.new(size: :lg)) { "Large" }
      end

      def extra_large
        render(InkComponents::Button::Component.new(size: :xl)) { "Extra large" }
      end
      # @!endgroup

      # @!group Colors
      def alternative
        render(InkComponents::Button::Component.new(color: :alternative)) { "Alternative" }
      end

      def light
        render(InkComponents::Button::Component.new(color: :light)) { "Light" }
      end

      def pink
        render(InkComponents::Button::Component.new(color: :pink)) { "Pink" }
      end

      def pink_outline
        render(InkComponents::Button::Component.new(color: :pink, shape: :outline)) { "Pink Outline" }
      end

      def blue
        render(InkComponents::Button::Component.new(color: :blue)) { "Blue" }
      end

      def blue_outline
        render(InkComponents::Button::Component.new(color: :blue, shape: :outline)) { "Blue Outline" }
      end

      def dark
        render(InkComponents::Button::Component.new(color: :dark)) { "Dark" }
      end

      def dark_outline
        render(InkComponents::Button::Component.new(color: :dark, shape: :outline)) { "Dark Outline" }
      end

      def green
        render(InkComponents::Button::Component.new(color: :green)) { "Green" }
      end

      def green_outline
        render(InkComponents::Button::Component.new(color: :green, shape: :outline)) { "Green Outline" }
      end

      def red
        render(InkComponents::Button::Component.new(color: :red)) { "Red" }
      end

      def red_outline
        render(InkComponents::Button::Component.new(color: :red, shape: :outline)) { "Red Outline" }
      end

      def yellow
        render(InkComponents::Button::Component.new(color: :yellow)) { "Yellow" }
      end

      def yellow_outline
        render(InkComponents::Button::Component.new(color: :yellow, shape: :outline)) { "Yellow Outline" }
      end

      def purple
        render(InkComponents::Button::Component.new(color: :purple)) { "Purple" }
      end

      def purple_outline
        render(InkComponents::Button::Component.new(color: :purple, shape: :outline)) { "Purple Outline" }
      end
      # @!endgroup

      def disabled
        render(InkComponents::Button::Component.new(disabled: true)) { "Disabled" }
      end
    end
  end
end
