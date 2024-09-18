# frozen_string_literal: true

module InkComponents
  module AvatarCollection
    class Preview < Lookbook::Preview
      # @param avatar_count number
      # @param href text
      def playground(avatar_count: 5, href: nil)
        render InkComponents::AvatarCollection::Component.new(href:) do |component|
          avatar_count.times do |i|
            component.with_avatar(image_url: "https://i.pravatar.cc/150?img=#{i + 1}")
          end
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

      def with_href
        render InkComponents::AvatarCollection::Component.new(href: "www.example.com") do |component|
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
          component.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
        end
      end
    end
  end
end
