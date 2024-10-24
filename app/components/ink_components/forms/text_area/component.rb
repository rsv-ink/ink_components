# frozen_string_literal: true

module InkComponents
  module Forms
    module TextArea
      class Component < ApplicationComponent
        style do
          base {
            %w[ block p-2.5 w-full text-sm rounded-lg border dark:bg-gray-700 ]
          }
          variants {
            state {
              default {
                %w[
                  bg-gray-50 border-gray-300 text-gray-900 focus:ring-pink-500 focus:border-pink-500
                  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-pink-500
                  dark:focus:border-pink-500
                ]
              }
              success {
                %w[
                  bg-green-50 border-green-500 text-green-900 dark:text-green-400 placeholder-green-700
                  dark:placeholder-green-500 focus:ring-green-500 focus:border-green-500 dark:border-green-500
                ]
              }
              error {
                %w[
                  bg-red-50 border-red-500 text-red-900 placeholder-red-700 focus:ring-red-500
                  focus:border-red-500 dark:text-red-500 dark:placeholder-red-500 dark:border-red-500
                ]
              }
            }
          }
          defaults { { state: :default } }
        end

        attr_reader :state

        def initialize(state: :default, **extra_attributes)
          @state = state
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(state:) }
        end
      end
    end
  end
end
