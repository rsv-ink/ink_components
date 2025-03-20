module InkComponents
  module Breadcrumb
    module List
      module Item
        class Component < ApplicationComponent
          renders_one :icon, lambda { |data|
            InkComponents::Icon::Component.new(**data)
          }

          style do
            base { %w[inline-flex items-center] }
          end

          renders_one :next_page, lambda { InkComponents::Icon::Component.new(name: "chevron-right", type: :outline, class: "rtl:rotate-180 h-6 w-6 text-gray-400 mx-1") }

          def initialize(href: "#", **extra_attributes)
            @href = href

            super(**extra_attributes)
          end

          private

          def default_attributes
            { class: style }
          end
        end
      end
    end
  end
end
