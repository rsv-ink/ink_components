# frozen_string_literal: true

module InkComponents
  module Accordion
    module Header
      class Component < ApplicationComponent
        style do
          base { %w[ flex items-center justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-800 gap-3 ] }

          variants {
            position {
              first { "border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200" }
              middle { "border-b-0 border-gray-200 focus:ring-4 focus:ring-gray-200" }
              last { "border-gray-200 focus:ring-4 focus:ring-gray-200" }
            }

            defaults { { position: :middle } }
          }
        end

        attr_reader :data_target, :position, :flush, :expanded

        def initialize(data_target:, position: :middle, flush: false, expanded: false, **extra_attributes)
          @data_target = data_target
          @position = position
          @flush = flush
          @expanded = expanded

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
            class: flush ? "flex items-center justify-between w-full py-5 font-medium rtl:text-right text-gray-500 border-b border-gray-200 dark:border-gray-700 dark:text-gray-400 gap-3" : style(position:)
          }
        end
      end
    end
  end
end
