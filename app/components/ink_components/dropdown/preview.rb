# frozen_string_literal: true

module InkComponents
  module Dropdown
    class Preview < Lookbook::Preview
      # Dropdown Playground
      # ---------------
      # This is a dropdown with a button trigger.
      # The dropdown has a header, a divider and an item.
      # This is a dropdown component with data attributes.
      # The list of data attributes are:
      # - dropdown toggle id: The id of the dropdown toggle button.
      # - dropdown trigger: The trigger of the dropdown. It can be 'click' or 'hover'.
      # - dropdown delay: The delay of the dropdown.
      # - dropdown placement: The placement of the dropdown. It can be 'top', 'right', 'bottom' or 'left'.
      # - dropdown offset distance: The offset distance of the dropdown(pixel).
      # - dropdown offset skidding: The offset skidding of the dropdown(pixel).
      # @param dropdown_toggle_id text
      # @param dropdown_trigger select { choices: [click, hover] }
      # @param dropdown_delay text
      # @param dropdown_placement select { choices: [top, right, bottom, left] }
      # @param dropdown_offset_skidding text
      def playground(
        dropdown_toggle_id: "dropdown-toggle-id",
        dropdown_trigger: "hover",
        dropdown_delay: "0",
        dropdown_placement: "bottom",
        dropdown_offset_distance: "0",
        dropdown_offset_skidding: "0"
      )
        dropdown_component(dropdown_toggle_id: dropdown_toggle_id) do |component|
          component.with_button(
            class: "m-40",
            data: {
              dropdown_trigger: dropdown_trigger,
              dropdown_delay: dropdown_delay,
              dropdown_placement: dropdown_placement,
              dropdown_offset_distance: dropdown_offset_distance,
              dropdown_offset_skidding: dropdown_offset_skidding
            }
          ) { "Dropdown" }

          component.with_header.with_content("Header")
          component.with_divider
          component.with_item.with_content("Teste")
          component.with_divider
          component.with_item.with_content("Teste")
        end
      end
    end
  end
end
