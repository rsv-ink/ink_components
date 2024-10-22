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
        button_component(builder:, href:, disabled:, color:, shape:, size:) { content }
      end

      # @!group Builders
      def link_to_builder
        button_component(builder: :link_to, href: "#") { "Button" }
      end

      def button_tag_builder
        button_component(builder: :button_tag) { "Button" }
      end

      def button_to_builder
        button_component(
          builder: :button_to,
          href: InkComponents::Engine.routes.url_helpers.lookbook_path,
          form: { data: { type: :json } }
        ) { "Button" }
      end
      # @!endgroup

      # @!group Sizes
      def extra_small
        button_component(size: :xs) { "Extra small" }
      end

      def small
        button_component(size: :sm) { "Small" }
      end

      def medium
        button_component(size: :md) { "Medium" }
      end

      def large
        button_component(size: :lg) { "Large" }
      end

      def extra_large
        button_component(size: :xl) { "Extra large" }
      end
      # @!endgroup

      # @!group Shapes
      def default
        button_component(shape: :default) { "Default" }
      end

      def pill
        button_component(shape: :pill) { "Pill" }
      end

      def outline
        button_component(shape: :outline) { "Outline" }
      end
      # @!endgroup

      # @!group Colors
      def alternative
        button_component(color: :alternative) { "Alternative" }
      end

      def light
        button_component(color: :light) { "Light" }
      end

      def pink
        button_component(color: :pink) { "Pink" }
      end

      def blue
        button_component(color: :blue) { "Blue" }
      end

      def dark
        button_component(color: :dark) { "Dark" }
      end

      def green
        button_component(color: :green) { "Green" }
      end

      def red
        button_component(color: :red) { "Red" }
      end

      def yellow
        button_component(color: :yellow) { "Yellow" }
      end

      def purple
        button_component(color: :purple) { "Purple" }
      end
      # @!endgroup

      # @!group Outline Colors
      def pink_outline
        button_component(color: :pink, shape: :outline) { "Pink Outline" }
      end

      def blue_outline
        button_component(color: :blue, shape: :outline) { "Blue Outline" }
      end

      def dark_outline
        button_component(color: :dark, shape: :outline) { "Dark Outline" }
      end

      def green_outline
        button_component(color: :green, shape: :outline) { "Green Outline" }
      end

      def red_outline
        button_component(color: :red, shape: :outline) { "Red Outline" }
      end

      def yellow_outline
        button_component(color: :yellow, shape: :outline) { "Yellow Outline" }
      end

      def purple_outline
        button_component(color: :purple, shape: :outline) { "Purple Outline" }
      end
      # @!endgroup


      # @!group Disabled
      def alternative_disabled
        button_component(color: :alternative, disabled: true) { "Disabled" }
      end

      def light_disabled
        button_component(color: :light, disabled: true) { "Disabled" }
      end

      def pink_disabled
        button_component(color: :pink, disabled: true) { "Disabled" }
      end

      def blue_disabled
        button_component(color: :blue, disabled: true) { "Disabled" }
      end

      def dark_disabled
        button_component(color: :dark, disabled: true) { "Disabled" }
      end

      def green_disabled
        button_component(color: :green, disabled: true) { "Disabled" }
      end

      def red_disabled
        button_component(color: :red, disabled: true) { "Disabled" }
      end

      def yellow_disabled
        button_component(color: :yellow, disabled: true) { "Disabled" }
      end

      def purple_disabled
        button_component(color: :purple, disabled: true) { "Disabled" }
      end
      # @!endgroup

      # @!group Outline Disabled
      def pink_disabled_outline
        button_component(shape: :outline, color: :pink, disabled: true) { "Disabled" }
      end

      def blue_disabled_outline
        button_component(shape: :outline, color: :blue, disabled: true) { "Disabled" }
      end

      def dark_disabled_outline
        button_component(shape: :outline, color: :dark, disabled: true) { "Disabled" }
      end

      def green_disabled_outline
        button_component(shape: :outline, color: :green, disabled: true) { "Disabled" }
      end

      def red_disabled_outline
        button_component(shape: :outline, color: :red, disabled: true) { "Disabled" }
      end

      def yellow_disabled_outline
        button_component(shape: :outline, color: :yellow, disabled: true) { "Disabled" }
      end

      def purple_disabled_outline
        button_component(shape: :outline, color: :purple, disabled: true) { "Disabled" }
      end
      # @!endgroup
    end
  end
end
