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
        badge_component(id: "badge_component", size:, color:, bordered:, shape:, href:, dismissible:).with_content(content)
      end

      # @!group Colors
      def pink
        badge_component(color: :pink).with_content("Pink Badge")
      end

      def dark
        badge_component(color: :dark).with_content("Dark Badge")
      end

      def blue
        badge_component(color: :blue).with_content("Blue Badge")
      end

      def red
        badge_component(color: :red).with_content("Red Badge")
      end

      def green
        badge_component(color: :green).with_content("Green Badge")
      end

      def yellow
        badge_component(color: :yellow).with_content("Yellow Badge")
      end

      def indigo
        badge_component(color: :indigo).with_content("Indigo Badge")
      end

      def purple
        badge_component(color: :purple).with_content("Purple Badge")
      end
      # @!endgroup

      # @!group Sizes
      def large
        badge_component(size: :sm).with_content("Large")
      end

      def small
        badge_component(size: :xs).with_content("Small")
      end
      # @!endgroup

      # @!group Border
      def bordered_true
        badge_component(bordered: true).with_content("Bordered Badge")
      end

      def bordered_false
        badge_component(bordered: false).with_content("Non-Bordered Badge")
      end
      # @!endgroup

      # @!group Shape
      def square_shape
        badge_component(shape: :square).with_content("Square Badge")
      end

      def pill_shape
        badge_component(shape: :pill).with_content("Pill Badge")
      end
      # @!endgroup

      # @!group Href
      def href_present
        badge_component(href: "https://example.com").with_content("Badge with Href")
      end

      def href_absent
        badge_component(href: nil).with_content("Badge without Href")
      end
      # @!endgroup

      # @!group Dismissible
      def dismissible_true
        badge_component(id: "badge_component", dismissible: true).with_content("dismissible Badge")
      end

      def dismissible_false
        badge_component(dismissible: false).with_content("Non-dismissible Badge")
      end
      # @!endgroup
    end
  end
end
