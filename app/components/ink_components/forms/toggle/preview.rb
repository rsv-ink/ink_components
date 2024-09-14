# frozen_string_literal: true

module InkComponents
  module Forms
    module Toggle
      class Preview < Lookbook::Preview
        # @param text text
        # @param size select { choices: [sm, md, lg] }
        # @param color select { choices: [pink, blue, red, green, purple, yellow, teal, orange] }
        # @param disabled toggle
        # @param checked toggle
        def playground(text: "Some Text", size: :md, color: :pink, disabled: false, checked: false)
          render InkComponents::Forms::Toggle::Component.new(text:, size:, color:, disabled:, checked:)
        end

        def checked_state
          render InkComponents::Forms::Toggle::Component.new(text: "Checked toggle", size: :md, color: :pink, checked: true)
        end

        # @!group Disabled
        def disabled_toggle
          render InkComponents::Forms::Toggle::Component.new(text: "Text", size: :md, color: :pink, disabled: true, checked: false)
        end

        def disabled_checked
          render InkComponents::Forms::Toggle::Component.new(text: "Text", size: :md, color: :pink, disabled: true, checked: true)
        end
        # @!endgroup

        # @!group Colors
        def pink
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :pink, checked: true)
        end

        def blue
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :blue, checked: true)
        end

        def red
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :red, checked: true)
        end

        def green
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :green, checked: true)
        end

        def purple
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :purple, checked: true)
        end

        def yellow
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :yellow, checked: true)
        end

        def teal
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :teal, checked: true)
        end

        def orange
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :orange, checked: true)
        end
        # @!endgroup

        # @!group Sizes
        def small
          render InkComponents::Forms::Toggle::Component.new(size: :sm, color: :pink)
        end

        def medium
          render InkComponents::Forms::Toggle::Component.new(size: :md, color: :pink)
        end

        def large
          render InkComponents::Forms::Toggle::Component.new(size: :lg, color: :pink)
        end
        # @!endgroup
      end
    end
  end
end