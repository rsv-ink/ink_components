# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Example::Component, type: :component do
  it "renders component" do
    component = render_inline(described_class.new(size: :md))

    expect(component.to_html).to include("Red")
  end
end
