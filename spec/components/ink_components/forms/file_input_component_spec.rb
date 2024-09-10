# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Forms::FileInput::Component, type: :component do
  it "renders component" do
    component = render_inline(described_class.new)

    expect(component.css("input").first["type"]).to include("file")
  end

  context "when the helper text slot is being used" do
    it "renders the helper text" do
      component = render_inline(described_class.new) do |input|
        input.with_helper_text { "My helper text" }
      end

      expect(component.to_html).to include("My helper text")
    end
  end
end
