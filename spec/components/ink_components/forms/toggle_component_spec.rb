# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Toggle::Component, type: :component do
  context "when initialized without text" do
    it "renders the component without text" do
      component = render_inline(described_class.new)

      expect(component.to_html).not_to include("span")
    end
  end

  context "when initialized with text" do
    it "renders the component with text" do
      component = render_inline(described_class.new.with_content("Some Testing Text"))

      expect(component.text).to include("Some Testing Text")
    end
  end

  context "when disabled is true" do
    it "renders the component with disabled attribute" do
      component = render_inline(described_class.new(disabled: true))

      expect(component.css("input").first["disabled"]).to eq("disabled")
    end

    it "renders the component with disabled text" do
      component = render_inline(described_class.new(disabled: true).with_content("Some Testing Text"))

      expect(component.css("span").text).to include("Some Testing Text")
    end
  end

  context "when checked is true" do
    it "renders the component with checked attribute" do
      component = render_inline(described_class.new(checked: true))

      expect(component.css("input").first["checked"]).to eq("checked")
    end
  end
end
