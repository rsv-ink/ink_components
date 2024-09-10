module InkComponents
  module Forms
    module HelperText
      class Preview < Lookbook::Preview
        # @param content text
        # @param size select { choices: [xs, sm] }
        # @param state select { choices: [default, success, error] }
        def playground(content: "Some text", size: :sm, state: :default)
          render InkComponents::Forms::HelperText::Component.new(size:, state:).with_content(content)
        end

        # @!group Sizes
        def extra_small
          render InkComponents::Forms::HelperText::Component.new(size: :xs).with_content(
            "We'll never share your details. Read our Privacy Policy."
          )
        end

        def small
          render InkComponents::Forms::HelperText::Component.new(size: :sm).with_content(
            "We'll never share your details. Read our Privacy Policy."
          )
        end
        # @!endgroup

        # @!group States
        def default
          render InkComponents::Forms::HelperText::Component.new(state: :default).with_content(
            "We'll never share your details. Read our Privacy Policy."
          )
        end

        def success
          render InkComponents::Forms::HelperText::Component.new(state: :success).with_content(
            "Well done! Some success message."
          )
        end

        def error
          render InkComponents::Forms::HelperText::Component.new(state: :error).with_content(
            "Oh, snapp! Some error message."
          )
        end
        # @!endgroup
      end
    end
  end
end
