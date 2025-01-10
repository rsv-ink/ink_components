# frozen_string_literal: true

module InkComponents
  module Modal
    module Header
      class Component < ApplicationComponent
        attr_reader :modal_id, :title
        def initialize(modal_id:, title:)
          @modal_id = modal_id
          @title = title
        end

        def call
          content_tag :div, class: "w-full flex items-center justify-between p-4 md:p-5 rounded-t" do
            safe_concat(content_tag(:h3, title, class: "text-xl font-semibold text-gray-900 dark:text-white"))

            safe_concat(content_tag(:button, type: "button", class: "text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center",
                                    data: { modal_hide: modal_id }) do
              safe_concat(close_icon)
              safe_concat(content_tag(:span, "Close modal", class: "sr-only"))
            end)
          end
        end

        def close_icon
          raw('<svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>')
        end
      end
    end
  end
end
