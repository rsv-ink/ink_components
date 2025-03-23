# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Icon::Component, type: :component do
  context "when the icon exists" do
    it "renders the icon" do
      component = render_inline(described_class.new(name: :bell, type: :solid))

      expect(component.css("svg")).to be_present
    end
  end

  context "when the icon does not exist" do
    it "does not render the icon" do
      component = render_inline(described_class.new(name: :non_existent, type: :solid))

      expect(component.css("svg")).not_to be_present
    end
  end
end
