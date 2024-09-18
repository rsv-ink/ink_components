module InkComponents
  module Badge
    class Preview < Lookbook::Preview
      # @param content text
      # @param color select { choices: [pink, dark, blue, red, green, yellow, indigo, purple] }
      # @param size select { choices: [xs, sm] }
      # @param bordered select { choices: [true, false] }
      # @param shape select { choices: [square, pill] }
      # @param href text
      # @param dismissable select { choices: [true, false] }
      def playground(content: "Some text", color: :pink, size: :xs, bordered: false, shape: :square, href: nil, dismissable: false)
        render InkComponents::Badge::Component.new(id: "badge_component", size:, color:, bordered:, shape:, href:, dismissable:).with_content(content)
      end

      # @!group Colors
      def pink
        render InkComponents::Badge::Component.new(color: :pink).with_content("Pink Badge")
      end

      def dark
        render InkComponents::Badge::Component.new(color: :dark).with_content("Dark Badge")
      end

      def blue
        render InkComponents::Badge::Component.new(color: :blue).with_content("Blue Badge")
      end

      def red
        render InkComponents::Badge::Component.new(color: :red).with_content("Red Badge")
      end

      def green
        render InkComponents::Badge::Component.new(color: :green).with_content("Green Badge")
      end

      def yellow
        render InkComponents::Badge::Component.new(color: :yellow).with_content("Yellow Badge")
      end

      def indigo
        render InkComponents::Badge::Component.new(color: :indigo).with_content("Indigo Badge")
      end

      def purple
        render InkComponents::Badge::Component.new(color: :purple).with_content("Purple Badge")
      end
      # @!endgroup

      # @!group Sizes
      def large
        render InkComponents::Badge::Component.new(size: :sm).with_content("Large")
      end

      def small
        render InkComponents::Badge::Component.new(size: :xs).with_content("Small")
      end
      # @!endgroup

      # @!group Border
      def bordered_true
        render InkComponents::Badge::Component.new(bordered: true).with_content("Bordered Badge")
      end

      def bordered_false
        render InkComponents::Badge::Component.new(bordered: false).with_content("Non-Bordered Badge")
      end
      # @!endgroup

      # @!group Shape
      def square_shape
        render InkComponents::Badge::Component.new(shape: :square).with_content("Square Badge")
      end

      def pill_shape
        render InkComponents::Badge::Component.new(shape: :pill).with_content("Pill Badge")
      end
      # @!endgroup

      # @!group Href
      def href_present
        render InkComponents::Badge::Component.new(href: "https://example.com").with_content("Badge with Href")
      end

      def href_absent
        render InkComponents::Badge::Component.new(href: nil).with_content("Badge without Href")
      end
      # @!endgroup

      # @!group Dismissable
      def dismissable_true
        render InkComponents::Badge::Component.new(id: "badge_component", dismissable: true).with_content("Dismissable Badge")
      end

      def dismissable_false
        render InkComponents::Badge::Component.new(dismissable: false).with_content("Non-Dismissable Badge")
      end
      # @!endgroup
    end
  end
end
