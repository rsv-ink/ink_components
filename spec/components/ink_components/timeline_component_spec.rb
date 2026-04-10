# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Timeline::Component, type: :component do
  context "when rendering a vertical timeline" do
    it "renders the component with items" do
      component = render_inline(described_class.new) do |timeline|
        timeline.with_item do
          '<li class="mb-10 ms-4">
            <time>February 2022</time>
            <h3>Application UI code</h3>
            <p>Get access to over 20+ pages</p>
          </li>'.html_safe
        end
      end

      expect(component.to_html).to include("February 2022")
      expect(component.to_html).to include("Application UI code")
      expect(component.to_html).to include("Get access to over 20+ pages")
    end

    it "applies vertical orientation classes" do
      component = render_inline(described_class.new(orientation: :vertical)) do |timeline|
        timeline.with_item do
          "<li>Test</li>".html_safe
        end
      end

      expect(component.to_html).to include("border-s")
      expect(component.to_html).to include("border-gray-200")
    end
  end

  context "when rendering a horizontal timeline" do
    it "applies horizontal orientation classes" do
      component = render_inline(described_class.new(orientation: :horizontal)) do |timeline|
        timeline.with_item do
          "<li>Test</li>".html_safe
        end
      end

      expect(component.to_html).to include("sm:flex")
      expect(component.to_html).to include("items-center")
    end
  end

  context "when rendering timeline with custom HTML" do
    it "renders custom item content" do
      component = render_inline(described_class.new) do |timeline|
        timeline.with_item do
          '<li class="custom-class"><span class="icon">Icon</span>Test content</li>'.html_safe
        end
      end

      expect(component.to_html).to include("custom-class")
      expect(component.to_html).to include("Icon")
      expect(component.to_html).to include("Test content")
    end
  end

  context "when no items are provided" do
    it "renders an empty list" do
      component = render_inline(described_class.new)

      expect(component.to_html).to include("<ol")
      expect(component.to_html).to include("</ol>")
    end
  end
end
