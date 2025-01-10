# frozen_string_literal: true

module InkComponents
  module Modal
    module Footer
      class Component < ApplicationComponent
        def call
          content_tag :div, class: "w-full p-4 md:p-5 space-y-4" do
            content
          end
        end

        def render?
          content.present?
        end
      end
    end
  end
end
