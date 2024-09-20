# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::AvatarStatus::Component, type: :component do
  context "when an avatar is provided" do
    it "renders the status indicator" do
      component = render_inline(described_class.new) do |component|
        component.with_avatar(name_abbreviation: "JL")
      end

      expect(component.to_html).to include("span", "JL")
    end
  end

  context "when an avatar is not provided" do
    it "doesn't render the status indicator" do
      component = render_inline(described_class.new)

      expect(component.to_html).to be_empty
    end
  end
end
