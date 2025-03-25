module InkComponents
  module Breadcrumb
    module List
      module Item
        class Component < ApplicationComponent
          renders_one :icon, lambda { |data|
            InkComponents::Icon::Component.new(**data)
          }
          renders_one :separator, lambda { InkComponents::Icon::Component.new(name: "chevron-right", type: :outline, class: "rtl:rotate-180 h-6 w-6 text-gray-400 mx-1") }
          renders_one :previous_page, "PreviousPageComponent"
          renders_one :current_page, "CurrentPageComponent"

          style do
            base { %w[inline-flex items-center] }
          end

          def initialize(**extra_attributes)
            super(**extra_attributes)
          end

          private

          def default_attributes
            { class: style }
          end

          class PreviousPageComponent < ApplicationComponent
            style do
              base { %w[inline-flex items-center text-sm font-medium text-gray-700 hover:text-pink-600 dark:text-gray-400 dark:hover:text-white] }
            end

            attr_reader :href

            def initialize(href: "#", **extra_attributes)
              @href = href

              super(**extra_attributes)
            end

            def call
              link_to href, attributes do
                content
              end
            end

            private

            def default_attributes
              { class: style }
            end
          end

          class CurrentPageComponent < ApplicationComponent
            style do
              base { %w[ms-1 text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-400] }
            end

            def call
              tag.span(attributes) do
                content
              end
            end

            private

            def default_attributes
              {
                class: style
              }
            end
          end
        end
      end
    end
  end
end
