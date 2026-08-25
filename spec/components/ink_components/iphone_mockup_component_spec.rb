# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::IphoneMockup::Component, type: :component do
  it "renders the device body" do
    component = render_inline(described_class.new) { "Screen" }

    expect(component.css("[data-iphone-mockup='body']")).to be_present
  end

  it "renders the four side buttons" do
    component = render_inline(described_class.new) { "Screen" }

    expect(component.css("[data-iphone-mockup='side-button']").size).to eq(4)
  end

  it "renders the dynamic island" do
    component = render_inline(described_class.new) { "Screen" }

    expect(component.css("[data-iphone-mockup='dynamic-island']")).to be_present
  end

  context "when the content is provided" do
    it "renders the content inside the screen" do
      component = render_inline(described_class.new) { "Screen content" }

      expect(component.css("[data-iphone-mockup='screen']").text).to include("Screen content")
    end
  end

  context "when no content is provided" do
    it "still renders the frame" do
      component = render_inline(described_class.new)

      expect(component.css("[data-iphone-mockup='body']")).to be_present
    end
  end

  context "when the home indicator is enabled" do
    it "renders the home indicator" do
      component = render_inline(described_class.new(home_indicator: true)) { "Screen" }

      expect(component.css("[data-iphone-mockup='home-indicator']")).to be_present
    end
  end

  context "when the home indicator is disabled" do
    it "doesn't render the home indicator" do
      component = render_inline(described_class.new(home_indicator: false)) { "Screen" }

      expect(component.css("[data-iphone-mockup='home-indicator']")).to be_empty
    end
  end

  context "when the color is invalid" do
    it "raises an error" do
      expect { described_class.new(color: :gold) }
        .to raise_error(ArgumentError, "Invalid color gold, must be one of space_black, black_dark, black_mid, deep_blue, silver")
    end
  end

  context "when the size is invalid" do
    it "raises an error" do
      expect { described_class.new(size: :xl) }
        .to raise_error(ArgumentError, "Invalid size xl, must be one of sm, md, lg")
    end
  end
end
