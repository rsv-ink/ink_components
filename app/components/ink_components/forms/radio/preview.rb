# frozen_string_literal: true

module InkComponents
  module Forms
    module Radio
      class Preview < Lookbook::Preview
        # @param content text
        # @param color select { choices: [pink, blue, red, green, teal, yellow, orange, purple] }
        # @param checked select { choices: [true, false] }
        # @param disabled select { choices: [true, false] }
        # @param bordered select { choices: [true, false] }
        # @param helper_text text
        def playground(content: "Some text", color: :pink, checked: false, disabled: false, bordered: false, helper_text: nil)
          radio_component(id: "default-radio-1", name: "name-radio", value: "value-1", color:, checked:, disabled:, bordered:) do |radio|
            radio.with_helper_text { helper_text }
            content
          end
        end

        # @!group Colors
        def pink
          radio_component(id: "default-radio-1", name: "name-radio-1", value: "value-1", color: :pink, checked: true) { "Pink" }
        end

        def blue
          radio_component(id: "default-radio-2", name: "name-radio-2", value: "value-2", color: :blue, checked: true) { "Blue" }
        end

        def red
          radio_component(id: "default-radio-3", name: "name-radio-3", value: "value-3", color: :red, checked: true) { "Red" }
        end

        def green
          radio_component(id: "default-radio-4", name: "name-radio-4", value: "value-4", color: :green, checked: true) { "Green" }
        end

        def teal
          radio_component(id: "default-radio-5", name: "name-radio-5", value: "value-5", color: :teal, checked: true) { "Teal" }
        end

        def purple
          radio_component(id: "default-radio-6", name: "name-radio-6", value: "value-6", color: :purple, checked: true) { "Purple" }
        end

        def yellow
          radio_component(id: "default-radio-7", name: "name-radio-7", value: "value-7", color: :yellow, checked: true) { "Yellow" }
        end

        def orange
          radio_component(id: "default-radio-8", name: "name-radio-8", value: "value-8", color: :orange, checked: true) { "Orange" }
        end
        # @!endgroup

        def disabled
          radio_component(id: "default-radio-9", name: "name-radio-9", value: "value-9", disabled: true) { "Disabled" }
        end

        def bordered
          radio_component(id: "default-radio-10", name: "name-radio-10", value: "value-10", bordered: true) { "Bordered" }
        end

        def with_help_text
          radio_component(id: "default-radio-11", name: "name-radio-11", value: "value-11") do |radio|
            radio.with_helper_text { "For orders shipped from $25 in books or $29 in other categories" }
            "Free shipping via Flowbite"
          end
        end
      end
    end
  end
end
