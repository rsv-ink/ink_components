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

  context "when the helper text and content is not provided" do
    it "doesn't render the helper text and label" do
      component = render_inline(described_class.new)

      expect(component.css("label")).not_to be_present
      expect(component.css("p")).not_to be_present
    end
  end

  context "when no id is provided for the component" do
    context "when content is provided" do
      it "generates an id for the checkbox and associates it with the label 'for' attribute" do
        component = render_inline(described_class.new(name: "product[name]")) { "Some label" }

        expect(component.css("label").attr("for").value).to eq("product_name")
      end
    end
  end
end
