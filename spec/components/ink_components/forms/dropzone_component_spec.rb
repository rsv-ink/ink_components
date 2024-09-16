# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Dropzone::Component, type: :component do
  it "renders the component" do
    component = render_inline(described_class.new)

    expect(component.css("input").first["type"]).to include("file")
  end

  context "when the lable text and the helper text is being used" do
    it "renders the lable text and the helper text" do
      component = render_inline(described_class.new) do |dropzone|
        dropzone.with_label_text { "Click to upload or drag and drop" }
        dropzone.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)" }
      end

      expect(component.to_html).to include("Click to upload", "SVG, PNG, JPG or GIF")
    end
  end
end
