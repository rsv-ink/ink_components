# frozen_string_literal: true

module InkComponents
  module DetailedStepper
    class Preview < Lookbook::Preview
      # Detailed Stepper Playground
      # ---------------
      # This is a detailed stepper component that allows navigation through steps.
      # The stepper can be displayed in horizontal or vertical orientation.
      # Each step includes a title, subtitle, and a step number.
      # The active step is highlighted.
      # @param orientation select { choices: [horizontal, vertical] } "Orientation of the stepper (horizontal or vertical)"
      def playground(orientation: :horizontal)
        detailed_stepper_component(orientation: orientation) do |component|
          component.with_step(title: "User info", subtitle: "Step details here", number: 1)
          component.with_step(title: "Company info", subtitle: "Step details here", number: 2)
          component.with_step(title: "Payment info", subtitle: "Step details here", active: true, number: 3)
        end
      end
    end
  end
end
