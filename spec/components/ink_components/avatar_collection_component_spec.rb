# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::AvatarCollection::Component, type: :component do
  context "when no avatar is provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new)
      
      expect(component.to_html).to be_empty
    end
  end

  context "when four avatars is provided" do
    it "render the component without the plus button" do
      component = render_inline(described_class.new) do |avatar_collection|
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
      end

      expect(component.css("div").any?).to be_truthy
      expect(component.css("a").empty?).to be_truthy
    end
  end

  context "when more than four avatars are provided" do
    it "render the component with the plus button" do
      component = render_inline(described_class.new) do |avatar_collection|
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=1")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=2")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=3")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=4")
        avatar_collection.with_avatar(image_url: "https://i.pravatar.cc/150?img=5")
      end

      expect(component.css("div").any?).to be_truthy
      expect(component.css("a").any?).to be_truthy
    end
  end
end