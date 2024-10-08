# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Checkbox::Component, type: :component do
  context "when the label is provided" do
    it "renders the label" do
      component = render_inline(described_class.new) { "Some label" }

      expect(component.css("label").text).to include("Some label")
    end
  end

  context "when the halper text is provided" do
    it "renders the helper text" do
      component = render_inline(described_class.new) do |input|
        input.with_helper_text { "Some helper text" }
      end

      expect(component.css("p").text).to include("Some helper text")
    end
  end

  context "when the helper text is not provided" do
    it "doesn't render the helper text" do
      component = render_inline(described_class.new) { "Some label" }

      expect(component.css("p").text.strip).to be_empty
    end
  end
end
