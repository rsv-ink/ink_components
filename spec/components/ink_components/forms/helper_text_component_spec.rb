# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::HelperText::Component, type: :component do
  context "when the content is provided" do
    it "renders the component" do
      component = render_inline(described_class.new) { "Some text" }

      expect(component.to_html).to include("Some text")
    end
  end

  context "when no content is provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new)

      expect(component.to_html).to be_empty
    end
  end

  context "when size is not set" do
    it "applies default class" do
      component = render_inline(described_class.new) { "Some text" }

      expect(component.css("p").first["class"]).to include("text-sm")
    end
  end

  context "when size is set to :xs" do
    it "applies the correct class" do
      component = render_inline(described_class.new(size: :xs)) { "Some text" }

      expect(component.css("p").first["class"]).to include("text-xs")
    end
  end

  context "when state is not set" do
    it "applies default class" do
      component = render_inline(described_class.new) { "Some text" }

      expect(component.css("p").first["class"]).to include("text-gray-500")
    end
  end

  context "when state is set to :error" do
    it "applies the correct class" do
      component = render_inline(described_class.new(state: :error)) { "Some text" }

      expect(component.css("p").first["class"]).to include("text-red-600")
    end
  end

  context "when state is set to :success" do
    it "applies the correct class" do
      component = render_inline(described_class.new(state: :success)) { "Some text" }

      expect(component.css("p").first["class"]).to include("text-green-600")
    end
  end
end
