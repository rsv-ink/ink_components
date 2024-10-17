# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::InputField::Component, type: :component do
  it "renders component" do
    component = render_inline(described_class.new)

    expect(component.css("input").first["type"]).to include("text")
  end
end
