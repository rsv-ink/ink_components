module InkComponents
  module Badge
    class Preview < Lookbook::Preview
      # @param content text
      # @param color select { choices: [pink, dark, blue, red, green, yellow, indigo, purple] }
      # @param size select { choices: [xs, sm] }
      # @param bordered select { choices: [true, false] }
      # @param shape select { choices: [square, pill] }
      # @param href text
      # @param dismissible select { choices: [true, false] }
      def playground(content: "Some text", color: :pink, size: :xs, bordered: false, shape: :square, href: nil, dismissible: false)
        badge_component(id: "badge_component", size:, color:, bordered:, shape:, href:, dismissible:) { content }
      end

      # @!group Colors
      def pink
        badge_component(color: :pink) { "Pink Badge" }
      end

      def dark
        badge_component(color: :dark) { "Dark Badge" }
      end

      def blue
        badge_component(color: :blue) { "Blue Badge" }
      end

      def red
        badge_component(color: :red) { "Red Badge" }
      end

      def green
        badge_component(color: :green) { "Green Badge" }
      end

      def yellow
        badge_component(color: :yellow) { "Yellow Badge" }
      end

      def indigo
        badge_component(color: :indigo) { "Indigo Badge" }
      end

      def purple
        badge_component(color: :purple) { "Purple Badge" }
      end
      # @!endgroup

      # @!group Sizes
      def large
        badge_component(size: :sm) { "Large" }
      end

      def small
        badge_component(size: :xs) { "Small" }
      end
      # @!endgroup

      # @!group Border
      def bordered_true
        badge_component(bordered: true) { "Bordered Badge" }
      end

      def bordered_false
        badge_component(bordered: false) { "Non-Bordered Badge" }
      end
      # @!endgroup

      # @!group Shape
      def square_shape
        badge_component(shape: :square) { "Square Badge" }
      end

      def pill_shape
        badge_component(shape: :pill) { "Pill Badge" }
      end
      # @!endgroup

      # @!group Href
      def href_present
        badge_component(href: "https://example.com") { "Badge with Href" }
      end

      def href_absent
        badge_component(href: nil) { "Badge without Href" }
      end
      # @!endgroup

      # @!group Dismissible
      def dismissible_true
        badge_component(id: "badge_component", dismissible: true) { "dismissible Badge" }
      end

      def dismissible_false
        badge_component(dismissible: false) { "Non-dismissible Badge" }
      end
      # @!endgroup
    end
  end
end
