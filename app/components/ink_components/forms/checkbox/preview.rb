# frozen_string_literal: true

module InkComponents
  module Forms
    module Checkbox
      class Preview < ViewComponent::Preview
        # @param checked toggle
        # @param disabled toggle
        # @param bordered toggle
        # @param color select { choices: [pink, blue, red, green, purple, yellow, orange, teal] }
        # @param helper_text text
        # @param content text
        def playground(
          checked: false,
          disabled: false,
          bordered: false,
          color: :pink,
          helper_text: nil,
          content: "Some value"
        )
          render(InkComponents::Forms::Checkbox::Component.new(checked:, disabled:, bordered:, color:)) do |checkbox|
            checkbox.with_helper_text { helper_text } if helper_text.present?
            content
          end
        end

        # @!group Colors
        def blue
          render(InkComponents::Forms::Checkbox::Component.new(color: :blue, checked: true)) { "Blue" }
        end

        def red
          render(InkComponents::Forms::Checkbox::Component.new(color: :red, checked: true)) { "Red" }
        end

        def green
          render(InkComponents::Forms::Checkbox::Component.new(color: :green, checked: true)) { "Green" }
        end

        def purple
          render(InkComponents::Forms::Checkbox::Component.new(color: :purple, checked: true)) { "Purple" }
        end

        def teal
          render(InkComponents::Forms::Checkbox::Component.new(color: :teal, checked: true)) { "Teal" }
        end

        def yellow
          render(InkComponents::Forms::Checkbox::Component.new(color: :yellow, checked: true)) { "Yellow" }
        end

        def orange
          render(InkComponents::Forms::Checkbox::Component.new(color: :orange, checked: true)) { "Orange" }
        end
        # @!endgroup

        # @!group With Html Attributes
        def disabled
          render(InkComponents::Forms::Checkbox::Component.new(disabled: true)) { "Disabled" }
        end

        def disabled_checked
          render(InkComponents::Forms::Checkbox::Component.new(checked: true, disabled: true)) { "Disabled" }
        end

        def with_id_and_name
          render(InkComponents::Forms::Checkbox::Component.new(id: "product", name: "product[some_value]")) { "Some value" }
        end
        # @!endgroup

        # @!group With Border
        def border
          render(InkComponents::Forms::Checkbox::Component.new(bordered: true)) { "Some value" }
        end

        def border_with_helper_text
          render(InkComponents::Forms::Checkbox::Component.new(bordered: true)) do |checkbox|
            checkbox.with_helper_text { "Some helper text" }
            "Some value"
          end
        end
        # @!endgroup

        def with_helper_text
          render(InkComponents::Forms::Checkbox::Component.new(id: "product", name: "product[some_value]")) do |checkbox|
            checkbox.with_helper_text { "Some helper text" }
            "Some value"
          end
        end
      end
    end
  end
end
