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
        avatar_component(image_url:, name_abbreviation:, size:, shape:, bordered:)
      end

      # @!group Sizes
      def extra_small
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", size: :xs)
      end

      def small
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", size: :sm)
      end

      def medium
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", size: :md)
      end

      def large
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", size: :lg)
      end

      def extra_large
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", size: :xl)
      end
      # @!endgroup

      # @!group Shapes
      def circle
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", shape: :circle)
      end

      def square
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", shape: :square)
      end
      # @!endgroup

      # @!group Border
      def with_border
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", bordered: true)
      end

      def without_border
        avatar_component(image_url: "https://i.pravatar.cc/150?img=3", bordered: false)
      end
      # @!endgroup

      # @!group Placeholders
      def name_abbreviation
        avatar_component(name_abbreviation: "JL")
      end

      def icon
        avatar_component
      end
      # @!endgroup

      def with_text
        avatar_component do |avatar|
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
