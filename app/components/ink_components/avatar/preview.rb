# frozen_string_literal: true

module InkComponents
  module Avatar
    class Preview < Lookbook::Preview
      # @param image_url text
      # @param name_abbreviation text
      # @param size select { choices: [xs, sm, md, lg, xl] }
      # @param shape select { choices: [circle, square] }
      # @param bordered toggle
      def playground(image_url: "https://i.pravatar.cc/150?img=3", name_abbreviation: nil, size: :md, shape: :circle, bordered: false)
        render InkComponents::Avatar::Component.new(image_url:, name_abbreviation:, size:, shape:, bordered:)
      end

      # @!group Sizes
      def extra_small
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", size: :xs)
      end

      def small
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", size: :sm)
      end

      def medium
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", size: :md)
      end

      def large
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", size: :lg)
      end

      def extra_large
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", size: :xl)
      end
      # @!endgroup

      # @!group Shapes
      def circle
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", shape: :circle)
      end

      def square
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", shape: :square)
      end
      # @!endgroup

      # @!group Border
      def with_border
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", bordered: true)
      end

      def without_border
        render InkComponents::Avatar::Component.new(image_url: "https://i.pravatar.cc/150?img=3", bordered: false)
      end
      # @!endgroup

      # @!group Placeholders
      def name_abbreviation
        render InkComponents::Avatar::Component.new(name_abbreviation: "JL")
      end

      def icon
        render InkComponents::Avatar::Component.new
      end
      # @!endgroup

      def with_text
        render InkComponents::Avatar::Component.new do |avatar|
          avatar.with_text do
            content_tag(:p, "Jese Leos", class: "font-medium dark:text-white").concat(
              content_tag(:p, "Joined in August 2014", class: "text-sm text-gray-500 dark:text-gray-400")
            )
          end
        end
      end
    end
  end
end
