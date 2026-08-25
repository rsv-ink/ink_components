# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::IphoneMockup::Component, type: :component do
  it "renders the root node" do
    component = render_inline(described_class.new) { "Screen" }

    expect(component.css("[data-iphone-mockup='root']")).to be_present
  end

  it "renders the device body" do
    component = render_inline(described_class.new) { "Screen" }

    expect(component.css("[data-iphone-mockup='body']")).to be_present
  end

  it "renders the dynamic island" do
    component = render_inline(described_class.new) { "Screen" }

    expect(component.css("[data-iphone-mockup='dynamic-island']")).to be_present
  end

  describe "side buttons" do
    it "renders the four buttons" do
      component = render_inline(described_class.new) { "Screen" }

      expect(component.css("[data-iphone-mockup='side-button']").size).to eq(4)
    end

    it "makes each button addressable" do
      component = render_inline(described_class.new) { "Screen" }
      names = component.css("[data-side-button]").map { |button| button["data-side-button"] }

      expect(names).to contain_exactly("action", "volume-up", "volume-down", "power")
    end
  end

  describe "screen" do
    context "when the content is provided" do
      it "renders the content inside the screen" do
        component = render_inline(described_class.new) { "Screen content" }

        expect(component.css("[data-iphone-mockup='screen']").text).to include("Screen content")
      end

      it "fills the screen" do
        component = render_inline(described_class.new) { "Screen content" }

        expect(component.css("[data-screen-state='filled']")).to be_present
      end
    end

    context "when no content is provided" do
      it "still renders the frame" do
        component = render_inline(described_class.new)

        expect(component.css("[data-iphone-mockup='body']")).to be_present
      end

      it "leaves the screen transparent" do
        component = render_inline(described_class.new)

        expect(component.css("[data-screen-state='transparent']")).to be_present
      end
    end
  end

  describe "home indicator" do
    context "when enabled" do
      it "renders the home indicator" do
        component = render_inline(described_class.new(home_indicator: true)) { "Screen" }

        expect(component.css("[data-iphone-mockup='home-indicator']")).to be_present
      end
    end

    context "when disabled" do
      it "doesn't render the home indicator" do
        component = render_inline(described_class.new(home_indicator: false)) { "Screen" }

        expect(component.css("[data-iphone-mockup='home-indicator']")).to be_empty
      end
    end

    context "when disabled through a param string" do
      it "doesn't render the home indicator" do
        component = render_inline(described_class.new(home_indicator: "false")) { "Screen" }

        expect(component.css("[data-iphone-mockup='home-indicator']")).to be_empty
      end
    end
  end

  describe "variants" do
    it "styles every color differently" do
      bodies = described_class::COLORS.map do |color|
        render_inline(described_class.new(color:)) { "Screen" }.css("[data-iphone-mockup='body']").attribute("class").value
      end

      expect(bodies.uniq.size).to eq(described_class::COLORS.size)
    end

    it "styles every size differently" do
      roots = described_class::SIZES.map do |size|
        render_inline(described_class.new(size:)) { "Screen" }.css("[data-iphone-mockup='root']").attribute("class").value
      end

      expect(roots.uniq.size).to eq(described_class::SIZES.size)
    end
  end

  describe "attributes" do
    it "merges the extra attributes into the root" do
      component = render_inline(described_class.new(class: "w-full")) { "Screen" }

      expect(component.css("[data-iphone-mockup='root']").attribute("class").value).to include("w-full")
    end
  end

  context "when the color is nil" do
    it "falls back to the default" do
      component = render_inline(described_class.new(color: nil)) { "Screen" }

      expect(component.css("[data-iphone-mockup='body']")).to be_present
    end
  end

  context "when the size is nil" do
    it "falls back to the default" do
      component = render_inline(described_class.new(size: nil)) { "Screen" }

      expect(component.css("[data-iphone-mockup='root']")).to be_present
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
