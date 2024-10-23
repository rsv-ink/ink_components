# frozen_string_literal: true

module InkComponents
  module Forms
    module FileInput
      class Preview < Lookbook::Preview
        # @param size select { choices: [xs, sm, lg] }
        def playground(size: :sm)
          file_input_component(size:)
        end

        # @!group Sizes
        def extra_small
          file_input_component(size: :xs)
        end

        def small
          file_input_component(size: :sm)
        end

        def large
          file_input_component(size: :lg)
        end
        # @!endgroup

        def with_helper_text
          file_input_component do |input|
            input.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)." }
          end
        end

        def with_multiple_files
          file_input_component(multiple: true)
        end
      end
    end
  end
end
