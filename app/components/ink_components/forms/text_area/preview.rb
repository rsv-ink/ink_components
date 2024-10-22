# frozen_string_literal: true

module InkComponents
  module Forms
    module TextArea
      class Preview < Lookbook::Preview
        # @param placeholder text
        # @param value text
        # @param rows number
        # @param cols number
        def playground(placeholder: "Write your thoughts here...", value: nil, rows: nil, cols: nil)
          text_area_component(placeholder:, value:, rows:, cols:)
        end
      end
    end
  end
end
