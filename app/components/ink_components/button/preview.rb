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

      # @!group Builders
      def link_to_builder
        render(InkComponents::Button::Component.new(builder: :link_to, href: "#")) { "Button" }
      end

      def button_tag_builder
        render(InkComponents::Button::Component.new(builder: :button_tag)) { "Button" }
      end

      # TODO: check if everything is ok
      def button_to_builder
        render(InkComponents::Button::Component.new(builder: :button_to)) { "Button" }
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

      def blue
        render(InkComponents::Button::Component.new(color: :blue)) { "Blue" }
      end

      def dark
        render(InkComponents::Button::Component.new(color: :dark)) { "Dark" }
      end

      def green
        render(InkComponents::Button::Component.new(color: :green)) { "Green" }
      end

      def red
        render(InkComponents::Button::Component.new(color: :red)) { "Red" }
      end

      def yellow
        render(InkComponents::Button::Component.new(color: :yellow)) { "Yellow" }
      end

      def purple
        render(InkComponents::Button::Component.new(color: :purple)) { "Purple" }
      end
      # @!endgroup

      # @!group Outline Colors
      def pink_outline
        render(InkComponents::Button::Component.new(color: :pink, shape: :outline)) { "Pink Outline" }
      end

      def blue_outline
        render(InkComponents::Button::Component.new(color: :blue, shape: :outline)) { "Blue Outline" }
      end

      def dark_outline
        render(InkComponents::Button::Component.new(color: :dark, shape: :outline)) { "Dark Outline" }
      end

      def green_outline
        render(InkComponents::Button::Component.new(color: :green, shape: :outline)) { "Green Outline" }
      end

      def red_outline
        render(InkComponents::Button::Component.new(color: :red, shape: :outline)) { "Red Outline" }
      end

      def yellow_outline
        render(InkComponents::Button::Component.new(color: :yellow, shape: :outline)) { "Yellow Outline" }
      end

      def purple_outline
        render(InkComponents::Button::Component.new(color: :purple, shape: :outline)) { "Purple Outline" }
      end
      # @!endgroup


      # @!group Disabled
      def alternative_disabled
        render(InkComponents::Button::Component.new(color: :alternative, disabled: true)) { "Disabled" }
      end

      def light_disabled
        render(InkComponents::Button::Component.new(color: :light, disabled: true)) { "Disabled" }
      end

      def pink_disabled
        render(InkComponents::Button::Component.new(color: :pink, disabled: true)) { "Disabled" }
      end

      def blue_disabled
        render(InkComponents::Button::Component.new(color: :blue, disabled: true)) { "Disabled" }
      end

      def dark_disabled
        render(InkComponents::Button::Component.new(color: :dark, disabled: true)) { "Disabled" }
      end

      def green_disabled
        render(InkComponents::Button::Component.new(color: :green, disabled: true)) { "Disabled" }
      end

      def red_disabled
        render(InkComponents::Button::Component.new(color: :red, disabled: true)) { "Disabled" }
      end

      def yellow_disabled
        render(InkComponents::Button::Component.new(color: :yellow, disabled: true)) { "Disabled" }
      end

      def purple_disabled
        render(InkComponents::Button::Component.new(color: :purple, disabled: true)) { "Disabled" }
      end
      # @!endgroup

      # @!group Outline Disabled
      def pink_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :pink, disabled: true)) { "Disabled" }
      end

      def blue_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :blue, disabled: true)) { "Disabled" }
      end

      def dark_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :dark, disabled: true)) { "Disabled" }
      end

      def green_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :green, disabled: true)) { "Disabled" }
      end

      def red_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :red, disabled: true)) { "Disabled" }
      end

      def yellow_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :yellow, disabled: true)) { "Disabled" }
      end

      def purple_disabled_outline
        render(InkComponents::Button::Component.new(shape: :outline, color: :purple, disabled: true)) { "Disabled" }
      end
      # @!endgroup
    end
  end
end
