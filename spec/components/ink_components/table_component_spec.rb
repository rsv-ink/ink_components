# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Table::Component, type: :component do
  context "when has a header" do
    it "renders the component" do
      component = render_inline(described_class.new) do |table|
        table.with_header do |header|
          header.with_cell { "Header" }
        end
      end

      expect(component.to_html).to include("Header")
    end
  end

  context "when has a row" do
    it "renders the component" do
      component = render_inline(described_class.new) do |table|
        table.with_row do |row|
          row.with_cell { "Row" }
        end
      end

      expect(component.to_html).to include("Row")
    end
  end

  context "when has a footer" do
    it "renders the component" do
      component = render_inline(described_class.new) do |table|
        table.with_footer do |footer|
          footer.with_cell { "Footer" }
        end
      end

      expect(component.to_html).to include("Footer")
      expect(component.to_html).to include("tfoot")
    end
  end
end
