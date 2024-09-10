# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Label::Component, type: :component do
  context "when the content is provided" do
    it "renders the component" do
      component = render_inline(described_class.new) { "Your name" }

      expect(component.to_html).to include("Your name")
    end
  end

  context "when an content is not provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new)

      expect(component.to_html).to be_empty
    end
  end
end
