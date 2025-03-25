# frozen_string_literal: true

module InkComponents
  module Accordion
    module Body
      class Component < ApplicationComponent
        attr_reader :data_target, :flush

        def initialize(data_target:, flush: false, **extra_attributes)
          @data_target = data_target
          @flush = flush

          super(**extra_attributes)
        end

        private
        def default_attributes
          {
            class: flush ? "py-5 border-b border-gray-200 dark:border-gray-700" : "p-5 border-gray-200 dark:border-gray-700"
          }
        end

        def external_div_attributes
          {
            id: "accordion-collapse-body-#{data_target}",
            "aria-labelledby": "accordion-collapse-heading-#{data_target}",
            class: flush ? "hidden" : "hidden border border-b-0 last:border-t-0"
          }
        end
      end
    end
  end
end
