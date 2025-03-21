# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Accordion::Component, type: :component do
  context "when has a header" do
    it "renders the component" do
      component = render_inline(described_class.new) do |accordion|
        accordion.with_section(data_target: "section-1") do |section|
          section.with_header { "Header" }
        end
      end

      expect(component.to_html).to include("Header")
    end
  end

  context "when has a body" do
    it "renders the component" do
      component = render_inline(described_class.new) do |accordion|
        accordion.with_section(data_target: "section-1") do |section|
          section.with_body { "Body" }
        end
      end

      expect(component.to_html).to include("Body")
    end
  end
end
