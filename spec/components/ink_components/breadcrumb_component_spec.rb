# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Breadcrumb::Component, type: :component do
  context "when the list is provided" do
    context "when items are provided" do
      it "renders the component" do
        component = render_inline(described_class.new) do |breadcrumb|
          breadcrumb.with_list do |list|
            list.with_item do |item|
              item.with_previous_page(href: "/home") { "Home" }
              item.with_separator
            end
            list.with_item do |item|
              item.with_current_page { "Products" }
            end
          end
        end

        expect(component.to_html).to include("Home")
        expect(component.to_html).to include("Products")
        expect(component.to_html).to include("href=\"/home\"")
      end
    end
  end
end
