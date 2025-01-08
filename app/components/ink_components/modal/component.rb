module InkComponents
  module Modal
    class Component < ApplicationComponent
      renders_one :header, "HeaderComponent"
      renders_one :body, "BodyComponent"
      renders_one :footer, "FooterComponent"

      style do
        variants {
          max_width {
            sm { "max-w-md" }
            md { "max-w-lg" }
            lg { "max-w-4xl" }
            xl { "max-w-7xl" }
          }

          type {
            dynamic { "dynamic" }
            static { "static" }
          }

          placement {
            center { "center" }
            top_left { "top-left" }
            top_right { "top-right" }
            bottom_left { "bottom-left" }
            bottom_right { "bottom-right" }
          }

          placement_classes {
            center { "justify-center items-center " }
            top_left { "justify-start items-start" }
            top_right { "justify-end items-start" }
            bottom_left { "justify-start items-end" }
            bottom_right { "justify-end items-end" }
          }
        }
      end

      attr_reader :modal_id, :max_width, :width, :type, :placement

      def initialize(modal_id:, max_width:, width: nil, type: :dynamic, placement: :center)
        @modal_id = modal_id
        @max_width = max_width
        @width = width
        @type = type
        @placement = placement
      end

      class HeaderComponent < ApplicationComponent
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
              safe_concat(raw('<svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>'))
              safe_concat(content_tag(:span, "Close modal", class: "sr-only"))
            end)
          end
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
