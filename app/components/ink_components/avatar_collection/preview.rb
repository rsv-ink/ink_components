# frozen_string_literal: true

module InkComponents
  module AvatarCollection
    class Preview < Lookbook::Preview
      # @param avatar_count number
      # @param size select { choices: [xs, sm, md, lg, xl] }
      # @param shape select { choices: [circle, square] }
      # @param href text
      def playground(avatar_count: 5, size: :md, shape: :circle, href: nil)
        render InkComponents::AvatarCollection::Component.new(size:, shape:, href:) do |component|
          avatar_count.times do |i|
            component.with_avatar(image_url: "https://i.pravatar.cc/150?img=#{i + 1}")
          end
        end
      end

      # @!group Numbers of Avatars
      def with_1_avatar
        render InkComponents::AvatarCollection::Component.new do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
        end
      end

      def with_2_avatars
        render InkComponents::AvatarCollection::Component.new do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
        end
      end

      def with_3_avatars
        render InkComponents::AvatarCollection::Component.new do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        end
      end

      def with_4_avatars
        render InkComponents::AvatarCollection::Component.new do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
        end
      end

      def with_5_avatars
        render InkComponents::AvatarCollection::Component.new do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end
      # @!endgroup

      def with_href
        render InkComponents::AvatarCollection::Component.new(href: "www.example.com") do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end

      # @!group Sizes
      def extra_small
        render InkComponents::AvatarCollection::Component.new(size: :xs) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end

      def small
        render InkComponents::AvatarCollection::Component.new(size: :sm) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end

      def medium
        render InkComponents::AvatarCollection::Component.new(size: :md) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end

      def large
        render InkComponents::AvatarCollection::Component.new(size: :lg) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end

      def extra_large
        render InkComponents::AvatarCollection::Component.new(size: :xl) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end
      # @!endgroup

      # @!group Shapes
      def circle
        render InkComponents::AvatarCollection::Component.new do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end

      def square
        render InkComponents::AvatarCollection::Component.new(shape: :square) do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end
      # @!endgroup
    end
  end
end
