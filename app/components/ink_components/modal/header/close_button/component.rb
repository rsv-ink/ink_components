# frozen_string_literal: true

module InkComponents
  module Modal
    module Header
      module CloseButton
        class Component < ApplicationComponent
          style do
            base { %w[text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center] }
          end

          def initialize(modal_id:, **extra_attributes)
            @modal_id = modal_id

            super(**extra_attributes)
          end

          private
          def default_attributes
            { type: :button, class: style, data: { modal_hide: @modal_id } }
          end
        end
      end
    end
  end
end
