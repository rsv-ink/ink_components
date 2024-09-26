# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Alert::Component, type: :component do
  it "renders the provided content" do
    component = render_inline(described_class.new) { "Some content" }

    expect(component.to_html).to include("Some content")
  end

  context "when the title is provided" do
    it "renders the title" do
      component = render_inline(described_class.new) do |alert|
        alert.with_title { "Some title" }
      end

      expect(component.css("h3").text).to include("Some title")
    end
  end

  context "when the body is provided" do
    it "renders the body" do
      component = render_inline(described_class.new) do |alert|
        alert.with_body { "Some content in the body" }
      end

      expect(component.to_html).to include("Some content in the body")
    end
  end

  context "when the actions are provided" do
    it "renders the actions" do
      component = render_inline(described_class.new) do |alert|
        alert.with_actions do
          "<button type='button'>View more</button>".html_safe
        end
      end

      expect(component.css("button").text).to include("View more")
    end
  end

  context "when the alert is dismissible" do
    it "renders the button to close alert" do
      component = render_inline(described_class.new(dismissible: true, id: "some-id")) do
        "Some content"
      end

      expect(component.css("button").first["data-dismiss-target"]).to eq("#some-id")
    end
  end

  context "when the alert is not dismissible" do
    it "doens't render the button to close alert" do
      component = render_inline(described_class.new(dismissible: false, id: "some-id")) do
        "Some content"
      end

      expect(component.css("button")).to be_empty
    end
  end
end
