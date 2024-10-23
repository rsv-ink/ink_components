# frozen_string_literal: true

module InkComponents
  module Forms
    module Toggle
      class Preview < Lookbook::Preview
        # @param content text
        # @param size select { choices: [sm, md, lg] }
        # @param color select { choices: [pink, blue, red, green, purple, yellow, teal, orange] }
        # @param disabled toggle
        # @param checked toggle
        def playground(content: "Some Text", size: :md, color: :pink, disabled: false, checked: false)
          toggle_component(size:, color:, disabled:, checked:) { content }
        end

        def checked_state
          toggle_component(size: :md, color: :pink, checked: true) { "Checked toggle" }
        end

        # @!group Disabled
        def disabled_toggle
          toggle_component(size: :md, color: :pink, disabled: true, checked: false) { "Disabled toggle" }
        end

        def disabled_checked
          toggle_component(size: :md, color: :pink, disabled: true, checked: true) { "Disabled checked toggle" }
        end
        # @!endgroup

        # @!group Colors
        def pink
          toggle_component(size: :md, color: :pink, checked: true)
        end

        def blue
          toggle_component(size: :md, color: :blue, checked: true)
        end

        def red
          toggle_component(size: :md, color: :red, checked: true)
        end

        def green
          toggle_component(size: :md, color: :green, checked: true)
        end

        def purple
          toggle_component(size: :md, color: :purple, checked: true)
        end

        def yellow
          toggle_component(size: :md, color: :yellow, checked: true)
        end

        def teal
          toggle_component(size: :md, color: :teal, checked: true)
        end

        def orange
          toggle_component(size: :md, color: :orange, checked: true)
        end
        # @!endgroup

        # @!group Sizes
        def small
          toggle_component(size: :sm, color: :pink)
        end

        def medium
          toggle_component(size: :md, color: :pink)
        end

        def large
          toggle_component(size: :lg, color: :pink)
        end
        # @!endgroup
      end
    end
  end
end
