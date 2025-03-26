# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Skeleton::Component, type: :component do
  it "renders the component" do
    component = render_inline(described_class.new) do |component|
      component.render component.with_node
    end

    expect(component.css("[role='status']")).to be_present
    expect(component.css("div").size).to eq(2)
  end
end
