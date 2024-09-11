module InkComponents
  module Forms
    module Select
      class Preview < Lookbook::Preview
        DEFAULT_OPTIONS = { red: "Red", green: "Green", blue: "Blue" }.freeze

        # @param prompt text
        # @param size select { choices: [sm, md, lg] }
        # @param state select { choices: [default, success, error] }
        # @param disabled toggle
        def playground(state: :default, size: :md, prompt: "Selecione", disabled: false)
          render InkComponents::Forms::Select::Component.new(state:, size:, prompt:, disabled:, options: DEFAULT_OPTIONS)
        end

        # @!group Html Attributes
        def with_prompt
          render InkComponents::Forms::Select::Component.new(prompt: "Selecione uma cor", options: DEFAULT_OPTIONS)
        end

        def with_selected_option
          render InkComponents::Forms::Select::Component.new(selected: "Green", options: DEFAULT_OPTIONS)
        end

        def with_html_attributes
          render InkComponents::Forms::Select::Component.new(id: "color", name: "color", options: DEFAULT_OPTIONS)
        end
        # @!endgroup

        # @!group States
        def default
          render InkComponents::Forms::Select::Component.new(state: :default, options: DEFAULT_OPTIONS)
        end

        def success
          render InkComponents::Forms::Select::Component.new(state: :success, options: DEFAULT_OPTIONS)
        end

        def error
          render InkComponents::Forms::Select::Component.new(state: :error, options: DEFAULT_OPTIONS)
        end

        def disabled
          render InkComponents::Forms::Select::Component.new(options: DEFAULT_OPTIONS, disabled: true)
        end
        # @!endgroup

        # @!group Sizes
        def small
          render InkComponents::Forms::Select::Component.new(size: :sm, options: DEFAULT_OPTIONS)
        end

        def medium
          render InkComponents::Forms::Select::Component.new(size: :md, options: DEFAULT_OPTIONS)
        end

        def large
          render InkComponents::Forms::Select::Component.new(size: :lg, options: DEFAULT_OPTIONS)
        end
        # @!endgroup

        # @!group Underline
        def default
          render InkComponents::Forms::Select::Component.new(underline: true, options: DEFAULT_OPTIONS)
        end

        def small_size
          render InkComponents::Forms::Select::Component.new(underline: true, size: :sm, options: DEFAULT_OPTIONS)
        end

        def medium_size
          render InkComponents::Forms::Select::Component.new(underline: true, size: :md, options: DEFAULT_OPTIONS)
        end

        def large_size
          render InkComponents::Forms::Select::Component.new(underline: true, size: :lg, options: DEFAULT_OPTIONS)
        end

        def success_state
          render InkComponents::Forms::Select::Component.new(underline: true, state: :success, options: DEFAULT_OPTIONS)
        end

        def error_state
          render InkComponents::Forms::Select::Component.new(underline: true, state: :error, options: DEFAULT_OPTIONS)
        end
        # @!endgroup
      end
    end
  end
end
