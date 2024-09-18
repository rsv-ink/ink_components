# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Avatar::Component, type: :component do
  context "when an image url is provided" do
    it "renders the image" do
      component = render_inline(described_class.new(image_url: "/spec/fixtures/assets/example.png", name_abbreviation: "JL"))

      expect(component.to_html).to include("/spec/fixtures/assets/example.png")
      expect(component.to_html).not_to include("JL")
    end
  end

  context "when an image url is not provided" do
    context "when the name abbreviation is provided" do
      it "renders the name abbreviation" do
        component = render_inline(described_class.new(name_abbreviation: "JL"))

        expect(component.to_html).to include("JL")
        expect(component.to_html).not_to include("svg")
      end
    end

    context "when the name abbreviation is not provided" do
      it "renders the icon placeholder" do
        component = render_inline(described_class.new)

        expect(component.to_html).to include("svg")
      end
    end
  end

  context "when some text is provided" do
    it "renders the text" do
      component = render_inline(described_class.new) do |avatar|
        avatar.with_text { "Some text" }
      end

      expect(component.to_html).to include("Some text")
    end
  end
end
