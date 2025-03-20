# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Breadcrumb::Component, type: :component do
  context "when the list is provided" do
    context "when items are provided" do
      it "renders the component" do
        component = render_inline(described_class.new) do |breadcrumb|
          breadcrumb.with_list do |list|
            list.with_item(href: "/home") { "Home" }
            list.with_item(href: "/products") { "Products" }
          end
        end

        expect(component.to_html).to include("Home")
        expect(component.to_html).to include("Products")
        expect(component.to_html).to include("href=\"/home\"")
        expect(component.to_html).to include("href=\"/products\"")
      end
    end

    context "when no items are provided" do
      it "does not render the list" do
        component = render_inline(described_class.new) do |breadcrumb|
          breadcrumb.with_list
        end

        expect(component.to_html).to be_empty
      end
    end
  end
end
