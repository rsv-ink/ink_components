module InkComponents
  module Modal
    class Component < ApplicationComponent
      renders_one :header, "HeaderComponent"
      renders_one :body, "BodyComponent"
      renders_one :footer, "FooterComponent"


      style do
        variants {
          size {
            sm { "max-w-md" }
            md { "max-w-lg" }
            lg { "max-w-4xl" }
            xl { "max-w-7xl" }
          }
        }
      end

      attr_reader :id, :size
      def initialize(id:, size: nil)
        @id = id
        @size = size
      end

      class HeaderComponent < ApplicationComponent
        def call
          content_tag :div, class: "w-full flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600" do
            safe_concat(content_tag(:h3, content, class: "text-xl font-semibold text-gray-900 dark:text-white"))

            safe_concat(content_tag(:button, type: "button", class: "text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white", data: { modal_hide: "default-modal" }) do
              safe_concat(raw('<svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>'))
              safe_concat(content_tag(:span, "Close modal", class: "sr-only"))
            end)
          end
        end

        def render?
          content.present?
        end
      end

      class BodyComponent < ApplicationComponent
        def call
          content_tag :div, class: "w-full p-4 md:p-5 space-y-4" do
            content
          end
        end

        def render?
          content.present?
        end
      end

      class FooterComponent < ApplicationComponent
        def call
          content_tag :div, class: "w-full flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600" do
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
