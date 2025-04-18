# frozen_string_literal: true

module InkComponents
  module Accordion
    module Header
      class Component < ApplicationComponent
        style do
          base { %w[ first:rounded-t-xl border border-b-0 flex items-center justify-between w-full p-5 font-medium rtl:text-right text-gray-500 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-800 gap-3 border-gray-200 focus:ring-4 ] }

          variants {
            color {
              default { "focus:ring-gray-200 dark:focus:ring-gray-800 hover:bg-gray-100" }
              pink { "focus:ring-pink-200 dark:focus:ring-pink-800 hover:bg-pink-100" }
              blue { "focus:ring-blue-200 dark:focus:ring-blue-800 hover:bg-blue-100" }
              red { "focus:ring-red-200 dark:focus:ring-red-800 hover:bg-red-100" }
              green { "focus:ring-green-200 dark:focus:ring-green-800 hover:bg-green-100" }
              purple { "focus:ring-purple-200 dark:focus:ring-purple-800 hover:bg-purple-100" }
              orange { "focus:ring-orange-200 dark:focus:ring-orange-800 hover:bg-orange-100" }
              yellow { "focus:ring-yellow-200 dark:focus:ring-yellow-800 hover:bg-yellow-100" }
            }

            defaults { { color: :default } }
          }
        end

        attr_reader :data_target, :flush, :expanded, :color, :has_arrow

        def initialize(data_target:, color: nil, flush: false, expanded: false, has_arrow: true, **extra_attributes)
          @data_target = data_target
          @flush = flush
          @expanded = expanded
          @color = color
          @has_arrow = has_arrow

          super(**extra_attributes)
        end

        private
        def default_attributes
          {
            id: "accordion-collapse-heading-#{data_target}",
            "data-accordion-target": "#accordion-collapse-body-#{data_target}",
            "aria-controls": "accordion-collapse-body-#{data_target}",
            "aria-expanded": expanded,
            type: "button",
            class: flush ? "flex items-center justify-between w-full py-5 font-medium rtl:text-right text-gray-500 border-b border-gray-200 dark:border-gray-700 dark:text-gray-400 gap-3" : style(color:)
          }
        end
      end
    end
  end
end
