# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Select::Component, type: :component do
  it "renders select options" do
    options = { red: "Red", green: "Green", blue: "Blue" }
    component = render_inline(described_class.new(options:))

    expect(component.to_html).to include("red", "green", "blue")
  end

  it "renders select prompt" do
    options = { red: "Red", green: "Green", blue: "Blue" }
    component = render_inline(described_class.new(prompt: "Select some option", options:))

    expect(component.to_html).to include("Select some option")
  end
end
