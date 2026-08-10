# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Icon::Component, type: :component do
  context "when the icon exists" do
    it "renders the icon" do
      component = render_inline(described_class.new(name: :bell, type: :solid))

      expect(component.css("svg")).to be_present
    end
  end

  context "when the icon does not exist" do
    it "raises an error" do
      expect { described_class.new(name: :non_existent, type: :solid) }.to raise_error(ArgumentError, "Invalid icon, non_existent with type solid does not exist")
    end
  end

  context "when the name is not in the canonical form" do
    it "normalizes the name" do
      component = described_class.new(name: "X", type: :solid)

      expect(component.name).to eq("x")
    end

    it "renders the icon" do
      component = render_inline(described_class.new(name: "X", type: :solid))

      expect(component.css("svg")).to be_present
    end

    it "downcases the name" do
      expect(described_class.new(name: "BELL", type: :solid).name).to eq("bell")
    end

    it "replaces spaces with dashes" do
      expect(described_class.new(name: "Chevron Right", type: :outline).name).to eq("chevron-right")
    end

    it "transliterates accented characters" do
      expect(described_class.new(name: "bèll", type: :solid).name).to eq("bell")
    end

    it "strips surrounding whitespace" do
      expect(described_class.new(name: "  bell  ", type: :solid).name).to eq("bell")
    end

    it "collapses the separators of a name that is already canonical" do
      expect(described_class.new(name: "bell--active", type: :solid).name).to eq("bell-active")
    end

    it "keeps the name inside the icons directory" do
      expect { described_class.new(name: "../../../../spec/dummy/public/icon", type: :solid) }
        .to raise_error(ArgumentError, /does not exist/)
    end
  end

  context "when the type is invalid" do
    it "raises an error" do
      expect { described_class.new(name: :bell, type: :filled) }.to raise_error(ArgumentError, "Invalid icon type filled, must be one of solid, outline")
    end

    it "does not let the type escape the icons directory" do
      expect { described_class.new(name: :icon, type: "../../../../../spec/dummy/public") }
        .to raise_error(ArgumentError, /Invalid icon type/)
    end
  end
end
