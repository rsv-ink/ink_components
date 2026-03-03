# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Spin::Component, type: :component do
  it "renders the component with spinner icon" do
    component = render_inline(described_class.new)

    expect(component.css("svg")).to be_present
    expect(component.css("[role='status']")).to be_present
  end

  context "when size is provided" do
    it "renders the component with the specified size" do
      component = render_inline(described_class.new(size: :lg))

      expect(component.css("svg").first["class"]).to include("size-20")
    end
  end

  context "when color is provided" do
    it "renders the component with the specified color" do
      component = render_inline(described_class.new(color: :blue))

      expect(component.css("svg").first["class"]).to include("fill-blue-600")
    end
  end

  context "when theme is provided" do
    context "when the theme is gray" do
      it "renders the component with gray theme" do
        component = render_inline(described_class.new(theme: :gray))

        expect(component.css("svg").first["class"]).to include("text-gray-200")
      end
    end

    context "when the theme is colorful" do
      it "renders the component with colorful theme" do
        component = render_inline(described_class.new(theme: :colorful, color: :blue))

        expect(component.css("svg").first["class"]).to include("text-blue-200")
      end
    end
  end
end
