# frozen_string_literal: true

module InkComponents
  module Forms
    module Checkbox
      class Preview < Lookbook::Preview
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
          checkbox_component(checked:, disabled:, bordered:, color:) do |checkbox|
            checkbox.with_helper_text { helper_text } if helper_text.present?
            content
          end
        end

        # @!group Colors
        def blue
          checkbox_component(color: :blue, checked: true) { "Blue" }
        end

        def red
          checkbox_component(color: :red, checked: true) { "Red" }
        end

        def green
          checkbox_component(color: :green, checked: true) { "Green" }
        end

        def purple
          checkbox_component(color: :purple, checked: true) { "Purple" }
        end

        def teal
          checkbox_component(color: :teal, checked: true) { "Teal" }
        end

        def yellow
          checkbox_component(color: :yellow, checked: true) { "Yellow" }
        end

        def orange
          checkbox_component(color: :orange, checked: true) { "Orange" }
        end
        # @!endgroup

        # @!group With Html Attributes
        def disabled
          checkbox_component(disabled: true) { "Disabled" }
        end

        def disabled_checked
          checkbox_component(checked: true, disabled: true) { "Disabled" }
        end

        def with_id_and_name
          checkbox_component(id: "product", name: "product[some_value]") { "Some value" }
        end
        # @!endgroup

        # @!group With Border
        def border
          checkbox_component(bordered: true) { "Some value" }
        end

        def border_with_helper_text
          checkbox_component(bordered: true) do |checkbox|
            checkbox.with_helper_text { "Some helper text" }
            "Another value"
          end
        end
        # @!endgroup

        def with_helper_text
          checkbox_component(id: "product", name: "product[some_value]") do |checkbox|
            checkbox.with_helper_text { "Some helper text" }
            "Some value"
          end
        end
      end
    end
  end
end
