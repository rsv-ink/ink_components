# frozen_string_literal: true

module InkComponents
  module Accordion
    module Body
      class Component < ApplicationComponent
        style do
          base { %w[ p-5 border border-gray-200 dark:border-gray-700 ] }

          variants {
            position {
              first { "border-b-0 dark:bg-gray-900" }
              middle { "border-b-0" }
              last { "border-t-0" }
            }

            defaults { { position: :middle } }
          }
        end

        attr_reader :data_target, :position, :flush

        def initialize(data_target:, position: :middle, flush: false, **extra_attributes)
          @data_target = data_target
          @position = position
          @flush = flush

          super(**extra_attributes)
        end

        private
        def default_attributes
          {
            class: flush ? "py-5 border-b border-gray-200 dark:border-gray-700" : style(position:)
          }
        end

        def external_div_attributes
          {
            id: "accordion-collapse-body-#{data_target}",
            "aria-labelledby": "accordion-collapse-heading-#{data_target}",
            class: "hidden"
          }
        end
      end
    end
  end
end
