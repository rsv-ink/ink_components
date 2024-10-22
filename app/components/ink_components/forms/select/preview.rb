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
          select_component(state:, size:, prompt:, disabled:, options: DEFAULT_OPTIONS)
        end

        # @!group Html Attributes
        def with_prompt
          select_component(prompt: "Selecione uma cor", options: DEFAULT_OPTIONS)
        end

        def with_selected_option
          select_component(selected: "Green", options: DEFAULT_OPTIONS)
        end

        def with_multiple_options
          select_component(multiple: true, options: DEFAULT_OPTIONS)
        end

        def with_html_attributes
          select_component(id: "color", name: "color", options: DEFAULT_OPTIONS)
        end
        # @!endgroup

        # @!group States
        def default
          select_component(state: :default, options: DEFAULT_OPTIONS)
        end

        def success
          select_component(state: :success, options: DEFAULT_OPTIONS)
        end

        def error
          select_component(state: :error, options: DEFAULT_OPTIONS)
        end

        def disabled
          select_component(options: DEFAULT_OPTIONS, disabled: true)
        end
        # @!endgroup

        # @!group Sizes
        def small
          select_component(size: :sm, options: DEFAULT_OPTIONS)
        end

        def medium
          select_component(size: :md, options: DEFAULT_OPTIONS)
        end

        def large
          select_component(size: :lg, options: DEFAULT_OPTIONS)
        end
        # @!endgroup

        # @!group Underline
        def default
          select_component(underline: true, options: DEFAULT_OPTIONS)
        end

        def small_size
          select_component(underline: true, size: :sm, options: DEFAULT_OPTIONS)
        end

        def medium_size
          select_component(underline: true, size: :md, options: DEFAULT_OPTIONS)
        end

        def large_size
          select_component(underline: true, size: :lg, options: DEFAULT_OPTIONS)
        end

        def success_state
          select_component(underline: true, state: :success, options: DEFAULT_OPTIONS)
        end

        def error_state
          select_component(underline: true, state: :error, options: DEFAULT_OPTIONS)
        end
        # @!endgroup
      end
    end
  end
end
