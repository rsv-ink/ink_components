# frozen_string_literal: true

module InkComponents
  module Forms
    module FileInput
      class Preview < Lookbook::Preview
        # @param size select { choices: [xs, sm, lg] }
        def playground(size: :sm)
          render InkComponents::Forms::FileInput::Component.new(size:)
        end

        # @!group Sizes
        def extra_small
          render InkComponents::Forms::FileInput::Component.new(size: :xs)
        end

        def small
          render InkComponents::Forms::FileInput::Component.new(size: :sm)
        end

        def large
          render InkComponents::Forms::FileInput::Component.new(size: :lg)
        end
        # @!endgroup

        def with_helper_text
          render InkComponents::Forms::FileInput::Component.new do |input|
            input.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)." }
          end
        end

        def with_multiple_files
          render InkComponents::Forms::FileInput::Component.new(multiple: true)
        end
      end
    end
  end
end
