# frozen_string_literal: true

module InkComponents
  module Table
    module Cell
      class Component < ApplicationComponent
        def initialize(type: :td)
          @type = type
        end

        def call
          content_tag(@type) do
            content
          end
        end
      end
    end
  end
end
