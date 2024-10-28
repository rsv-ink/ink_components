# frozen_string_literal: true

module InkComponents
  module Forms
    module TextArea
      class Preview < Lookbook::Preview
        # @param placeholder text
        # @param state select { choices: [default, success, error] }
        # @param value text
        # @param rows number
        # @param cols number
        def playground(placeholder: "Write your thoughts here...", value: nil, rows: nil, cols: nil, state: :default)
          text_area_component(placeholder:, value:, rows:, cols:, state:)
        end

        # @!group States
        def default
          text_area_component
        end

        def success
          text_area_component(state: :success)
        end

        def error
          text_area_component(state: :error)
        end
        # @!endgroup
      end
    end
  end
end
