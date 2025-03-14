# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Popover::Component, type: :component do
  context "when the body is provided" do
    context "when the button trigger is provided" do
      it "renders the component" do
        component = render_inline(described_class.new(id: "popover-id")) do |component|
          component.with_button { "Popover trigger" }
          component.with_body { "Popover body" }
        end

        expect(component.to_html).to include("Popover trigger")
        expect(component.to_html).to include("Popover body")
      end
    end

    context "when the button trigger is not provided" do
      it "doesn't render the component" do
        component = render_inline(described_class.new(id: "popover-id")) do |component|
          component.with_body { "Popover body" }
        end

        expect(component.to_html).to be_empty
      end
    end
  end

  context "when the body is not provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new(id: "popover-id")) do |component|
      end

      expect(component.to_html).to be_empty
    end
  end
end
