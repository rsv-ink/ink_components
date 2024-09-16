# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Dropzone::Component, type: :component do
  context "when the lable text or helper text is provided" do
    it "renders the component" do
      component = render_inline(described_class.new) do |dropzone|
        dropzone.with_label_text { "Click to upload or drag and drop" }
        dropzone.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)" }
      end

      expect(component.to_html).to include("Click to upload", "SVG, PNG, JPG or GIF")
    end
  end

  context "when no lable text and helper text is provided" do
    it "doesn't render the component" do
      component = render_inline(described_class.new)

      expect(component.to_html).to be_empty
    end
  end
end
