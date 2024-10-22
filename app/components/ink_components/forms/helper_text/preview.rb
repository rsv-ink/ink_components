# frozen_string_literal: true

module InkComponents
  module Forms
    module HelperText
      class Preview < Lookbook::Preview
        # @param content text
        # @param size select { choices: [xs, sm] }
        # @param state select { choices: [default, success, error] }
        def playground(content: "Some text", size: :sm, state: :default)
          helper_text_component(size:, state:) { content }
        end

        # @!group Sizes
        def extra_small
          helper_text_component(size: :xs) { "We'll never share your details. Read our Privacy Policy." }
        end

        def small
          helper_text_component(size: :sm) { "We'll never share your details. Read our Privacy Policy." }
        end
        # @!endgroup

        # @!group States
        def default
          helper_text_component(state: :default) { "We'll never share your details. Read our Privacy Policy." }
        end

        def success
          helper_text_component(state: :success) { "Well done! Some success message." }
        end

        def error
          helper_text_component(state: :error) { "Oh, snapp! Some error message." }
        end
        # @!endgroup
      end
    end
  end
end
