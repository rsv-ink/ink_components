module InkComponents
  module Forms
    module Label
      class Preview < Lookbook::Preview
        # @param content text
        # @param state select { choices: [default, success, error] }
        def default(content: "Your name", state: :default)
          render InkComponents::Forms::Label::Component.new(state:).with_content(content)
        end

        def with_html_attributes
          render InkComponents::Forms::Label::Component.new(id: "name").with_content("Your name")
        end
      end
    end
  end
end
