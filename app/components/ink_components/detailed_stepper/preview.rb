module InkComponents
  module DetailedStepper
    class Preview < Lookbook::Preview
      # @!group Playground
      # @param step_count number
      def playground(step_count: 3)
        render_with_template(template: "previews/ink_components/detailed_stepper/playground", locals: { step_count: step_count.to_i })
      end
      # @!endgroup

      def default
        detailed_stepper_component do |stepper|
          stepper.with_item(number: 1, title: "User info", description: "Step details here", state: :current)
          stepper.with_item(number: 2, title: "Company info", description: "Step details here")
          stepper.with_item(number: 3, title: "Payment info", description: "Step details here")
        end
      end

      def first_step_only
         detailed_stepper_component do |stepper|
          stepper.with_item(number: 1, title: "Account Setup", description: "Provide your basic account details.")
        end
      end

       def second_step_current
        detailed_stepper_component do |stepper|
          stepper.with_item(number: 1, title: "User info", description: "Step details here", state: :upcoming) # Mark explicitly if not first
          stepper.with_item(number: 2, title: "Company info", description: "Step details here", state: :current)
          stepper.with_item(number: 3, title: "Payment info", description: "Step details here")
        end
      end
    end
  end
end
