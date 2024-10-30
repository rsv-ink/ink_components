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
          select_component(state:, size:, disabled:, choices: DEFAULT_OPTIONS, options: { prompt: })
        end

        # @!group Html Attributes
        def with_prompt
          select_component(choices: DEFAULT_OPTIONS, options: { prompt: "Selecione uma cor" })
        end

        def with_selected_option
          select_component(choices: DEFAULT_OPTIONS, options: { selected: "Blue" })
        end

        def with_multiple_options
          select_component(choices: DEFAULT_OPTIONS, multiple: true)
        end

        def with_html_attributes
          select_component(choices: DEFAULT_OPTIONS, id: "color", name: "color")
        end
        # @!endgroup

        # @!group States
        def default
          select_component(state: :default, choices: DEFAULT_OPTIONS)
        end

        def success
          select_component(state: :success, choices: DEFAULT_OPTIONS)
        end

        def error
          select_component(state: :error, choices: DEFAULT_OPTIONS)
        end

        def disabled
          select_component(choices: DEFAULT_OPTIONS, disabled: true)
        end
        # @!endgroup

        # @!group Sizes
        def small
          select_component(size: :sm, choices: DEFAULT_OPTIONS)
        end

        def medium
          select_component(size: :md, choices: DEFAULT_OPTIONS)
        end

        def large
          select_component(size: :lg, choices: DEFAULT_OPTIONS)
        end
        # @!endgroup

        # @!group Underline
        def default
          select_component(underline: true, choices: DEFAULT_OPTIONS)
        end

        def small_size
          select_component(underline: true, size: :sm, choices: DEFAULT_OPTIONS)
        end

        def medium_size
          select_component(underline: true, size: :md, choices: DEFAULT_OPTIONS)
        end

        def large_size
          select_component(underline: true, size: :lg, choices: DEFAULT_OPTIONS)
        end

        def success_state
          select_component(underline: true, state: :success, choices: DEFAULT_OPTIONS)
        end

        def error_state
          select_component(underline: true, state: :error, choices: DEFAULT_OPTIONS)
        end
        # @!endgroup
      end
    end
  end
end
