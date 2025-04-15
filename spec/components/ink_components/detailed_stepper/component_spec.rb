require "rails_helper"

RSpec.describe InkComponents::DetailedStepper::Component, type: :component do
  it "renders the component with steps" do
    component = render_inline(described_class.new) do |stepper|
      stepper.with_step(title: "User info", subtitle: "Step details here", number: 1)
      stepper.with_step(title: "Company info", subtitle: "Step details here", number: 2)
      stepper.with_step(title: "Payment info", subtitle: "Step details here", active: true, number: 3)
    end

    expect(component.to_html).to include("User info")
    expect(component.to_html).to include("Company info")
    expect(component.to_html).to include("Payment info")
  end
end
