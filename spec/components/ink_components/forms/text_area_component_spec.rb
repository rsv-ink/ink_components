# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::TextArea::Component, type: :component do
  it "renders component" do
    component = render_inline(described_class.new(placeholder: "Write something"))

    expect(component.to_html).to include("textarea", "placeholder=\"Write something\"")
  end
end
