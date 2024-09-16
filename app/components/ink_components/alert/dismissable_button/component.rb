# frozen_string_literal: true

module InkComponents
  module Alert
    module DismissableButton
      class Component < ApplicationComponent
        style do
          base {
            %w[
              ms-auto -mx-1.5 -my-1.5 rounded-lg focus:ring-2 p-1.5 inline-flex items-center
              justify-center h-8 w-8 dark:bg-gray-800 dark:hover:bg-gray-700
            ]
          }

          variants {
            state {
              info { %w[ bg-pink-50 text-pink-500 focus:ring-pink-400 hover:bg-pink-200 dark:text-pink-400 ] }
              success { %w[ bg-green-50 text-green-500 focus:ring-green-400 hover:bg-green-200 dark:text-green-400 ] }
              danger { %w[ bg-red-50 text-red-500 focus:ring-red-400 hover:bg-red-200 dark:text-red-400 ] }
              warning { %w[ bg-yellow-50 text-yellow-500 focus:ring-yellow-400 hover:bg-yellow-200 dark:text-yellow-400 ] }
              dark { %w[ bg-gray-50 text-gray-500 focus:ring-gray-400 hover:bg-gray-200 dark:text-gray-400 ] }
            }
          }

          defaults { { state: :info } }
        end

        attr_reader :id, :state

        def initialize(id:, state: nil, **extra_attributes)
          @id = id
          @state = state
          super(**extra_attributes)
        end

        private
        def default_attributes
          {
            class: style(state:),
            type: :button,
            data: { dismiss_target: "##{id}" },
            aria: { label: :close }
          }
        end
      end
    end
  end
end
