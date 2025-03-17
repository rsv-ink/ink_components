# frozen_string_literal: true

module InkComponents
  module Accordion
    module Header
      class Component < ApplicationComponent
        style do
          base { %w[ flex items-center justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-800 gap-3 ] }

          variants {
            position {
              first { "border-b-0 border-gray-200 rounded-t-xl focus:ring-4" }
              middle { "border-b-0 border-gray-200 focus:ring-4" }
              last { "border-gray-200 focus:ring-4" }
            }

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

            defaults { { position: :middle, color: :default } }
          }
        end

        attr_reader :data_target, :position, :flush, :expanded, :color

        def initialize(data_target:, color: nil, position: :middle, flush: false, expanded: false, **extra_attributes)
          @data_target = data_target
          @position = position
          @flush = flush
          @expanded = expanded
          @color = color

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
            class: flush ? "flex items-center justify-between w-full py-5 font-medium rtl:text-right text-gray-500 border-b border-gray-200 dark:border-gray-700 dark:text-gray-400 gap-3" : style(position:, color:)
          }
        end
      end
    end
  end
end
