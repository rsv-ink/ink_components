# frozen_string_literal: true

module InkComponents
  module Forms
    module Select
      class Component < ApplicationComponent
        style do
          base { %w[ border rounded-lg block w-full ] }

          variants {
            state {
              default {
                %w[
                  bg-gray-50 border-gray-300 text-gray-900 focus:ring-pink-500 focus:border-pink-500
                  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white
                  dark:focus:ring-pink-500 dark:focus:border-pink-500
                ]
              }
              success {
                %w[
                  bg-green-50 border-green-500 text-green-900 placeholder-green-700 focus:ring-green-500 focus:border-green-500
                  dark:bg-gray-700 dark:text-green-400 dark:placeholder-green-500 dark:border-green-500
                  dark:focus:ring-green-500 dark:focus:border-green-500
                ]
              }
              error {
                %w[
                  bg-red-50 border-red-500 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500
                  dark:bg-gray-700 dark:text-red-500 dark:placeholder-red-500 dark:border-red-500
                  dark:focus:ring-red-500 dark:focus:border-red-500
                ]
              }
            }

            size {
              sm { "text-sm p-2" }
              md { "text-sm p-2.5" }
              lg { "text-base px-4 py-3" }
            }
          }
          defaults { { state: :default, size: :md } }
        end

        style :underline do
          base {
            %w[
              block px-0 w-full bg-transparent border-0 border-b-2 appearance-none
              focus:outline-none focus:ring-0 peer
            ]
          }

          variants {
            state {
              default { %w[ text-gray-500 border-gray-200 dark:text-gray-400 dark:border-gray-700 focus:border-gray-200 ] }
              success { %w[ text-green-900 border-green-500 dark:text-green-400 dark:border-green-500 focus:border-green-500 ] }
              error { %w[ text-red-900 border-red-500 dark:text-red-500 dark:border-red-500 focus:border-red-500 ] }
            }

            size {
              sm { "text-sm py-2" }
              md { "text-sm py-2.5" }
              lg { "text-base py-3" }
            }
          }

          defaults { { size: :md, state: :default } }
        end

        attr_reader :state, :size, :choices, :options, :underline

        def initialize(state: nil, size: nil, underline: false, choices: {}, options: {}, **extra_attributes)
          @state = state
          @size = size
          @underline = underline
          @choices = choices
          @options = options
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: classes }
        end

        def classes
          underline ? style(:underline, state:, size:) : style(state:, size:)
        end
      end
    end
  end
end
