# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::Select::Component, type: :component do
  it "renders select options" do
    choices = { red: "Red", green: "Green", blue: "Blue" }
    component = render_inline(described_class.new(choices:))

    expect(component.to_html).to include("red", "green", "blue")
  end

  it "renders select prompt" do
    choices = { red: "Red", green: "Green", blue: "Blue" }
    component = render_inline(described_class.new(options: { prompt: "Select some option" }, choices:))

    expect(component.to_html).to include("Select some option")
  end
end
