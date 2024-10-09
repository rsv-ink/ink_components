# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Button::Component, type: :component do
  context "when the content is provided" do
    it "renders the component" do
      component = render_inline(described_class.new(href: "#")) { "Some text" }

      expect(component.to_html).to include("Some text")
    end
  end

  context "when no content is provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new(href: "#"))

      expect(component.to_html).to be_empty
    end
  end
end