module InkComponents
  module AvatarStatus
    class Preview < Lookbook::Preview
      # @param status select { choices: [online, offline] }
      # @param position select { choices: [top, bottom] }
      # @param avatar_shape select { choices: [circle, square] }
      def default(status: :online, position: :top, avatar_shape: :circle)
        render InkComponents::AvatarStatus::Component.new(status:, position:, avatar_shape:) do |component|
          component.with_avatar(shape: avatar_shape, image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      # @!group Status
      def online
        render InkComponents::AvatarStatus::Component.new(status: :online) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def offline
        render InkComponents::AvatarStatus::Component.new(status: :offline) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end
      # @!endgroup

      # @!group Positions
      def top_with_circle_avatar
        render InkComponents::AvatarStatus::Component.new(position: :top) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def top_with_square_avatar
        render InkComponents::AvatarStatus::Component.new(position: :top, avatar_shape: :square) do |component|
          component.with_avatar(shape: :square, image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def bottom_with_circle_avatar
        render InkComponents::AvatarStatus::Component.new(position: :bottom) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def bottom_with_square_avatar
        render InkComponents::AvatarStatus::Component.new(position: :bottom, avatar_shape: :square) do |component|
          component.with_avatar(shape: :square, image_url: "https://i.pravatar.cc/150?img=3")
        end
      end
      # @!endgroup
    end
  end
end
