module InkComponents
  module AvatarStatus
    class Preview < Lookbook::Preview
      # @param status select { choices: [online, offline] }
      # @param position select { choices: [top, bottom] }
      # @param avatar_shape select { choices: [circle, square] }
      def playground(status: :online, position: :top, avatar_shape: :circle)
        avatar_status_component(status:, position:, avatar_shape:) do |component|
          component.with_avatar(shape: avatar_shape, image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      # @!group Status
      def online
        avatar_status_component(status: :online) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def offline
        avatar_status_component(status: :offline) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end
      # @!endgroup

      # @!group Positions
      def top_with_circle_avatar
        avatar_status_component(position: :top) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def top_with_square_avatar
        avatar_status_component(position: :top, avatar_shape: :square) do |component|
          component.with_avatar(shape: :square, image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def bottom_with_circle_avatar
        avatar_status_component(position: :bottom) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def bottom_with_square_avatar
        avatar_status_component(position: :bottom, avatar_shape: :square) do |component|
          component.with_avatar(shape: :square, image_url: "https://i.pravatar.cc/150?img=3")
        end
      end
      # @!endgroup
    end
  end
end
