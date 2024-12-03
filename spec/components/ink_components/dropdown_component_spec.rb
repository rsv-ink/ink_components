# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Dropdown::Component, type: :component do
  context "when has a button trigger" do
    it "renders the component" do
      component = render_inline(described_class.new(dropdown_toggle_id: "dropdown-toggle-id")) do |dropdown|
        dropdown.with_button(data: { dropdown_toggle: "dropdown-toggle-id" }) { "Dropdown" }
      end

      expect(component.to_html).to include("Dropdown")
    end
  end

  context "when has a header" do
    it "renders the component" do
      component = render_inline(described_class.new(dropdown_toggle_id: "dropdown-toggle-id")) do |dropdown|
        dropdown.with_header { "Header" }
      end

      expect(component.to_html).to include("Header")
    end
  end

  context "when has an item" do
    it "renders the component" do
      component = render_inline(described_class.new(dropdown_toggle_id: "dropdown-toggle-id")) do |dropdown|
        dropdown.with_item { "Item" }
      end

      expect(component.to_html).to include("Item")
    end
  end

  context "when has a divider" do
    it "renders the component" do
      component = render_inline(described_class.new(dropdown_toggle_id: "dropdown-toggle-id")) do |dropdown|
        dropdown.with_divider
      end

      divider = component.css("div").find { |div| div["class"].include?("h-[1px]") }
      expect(divider).to be_present
    end
  end
end
