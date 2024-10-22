# frozen_string_literal: true

module InkComponents
  module Forms
    module Label
      class Preview < Lookbook::Preview
        # @param content text
        # @param state select { choices: [default, success, error] }
        def default(content: "Your name", state: :default)
          label_component(state:) { content }
        end

        def with_html_attributes
          label_component(id: "name") { "Your name" }
        end
      end
    end
  end
end
