# frozen_string_literal: true

module InkComponents
  module Forms
    module Toggle
      class Component < ApplicationComponent
        style :div do
          base {
            %w[
              peer relative rounded-full bg-gray-200 after:absolute after:start-[2px] after:top-[2px] after:rounded-full
              after:border after:border-gray-300 after:bg-white after:transition-all after:content-['']
              peer-checked:after:translate-x-full peer-checked:after:border-white peer-focus:outline-none
              peer-focus:ring-4 dark:border-gray-600 dark:bg-gray-700 rtl:peer-checked:after:-translate-x-full
            ]
          }
          variants {
            color {
              pink { %w[peer-checked:bg-pink-600 peer-focus:ring-pink-300 dark:peer-focus:ring-pink-800] }
              blue { %w[peer-checked:bg-blue-600 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800] }
              red { %w[peer-checked:bg-red-600 peer-focus:ring-red-300 dark:peer-focus:ring-red-800] }
              green { %w[peer-checked:bg-green-600 peer-focus:ring-green-300 dark:peer-focus:ring-green-800] }
              purple { %w[peer-checked:bg-purple-600 peer-focus:ring-purple-300 dark:peer-focus:ring-purple-800] }
              yellow { %w[peer-checked:bg-yellow-600 peer-focus:ring-yellow-300 dark:peer-focus:ring-yellow-800] }
              teal { %w[peer-checked:bg-teal-600 peer-focus:ring-teal-300 dark:peer-focus:ring-teal-800] }
              orange { %w[peer-checked:bg-orange-600 peer-focus:ring-orange-300 dark:peer-focus:ring-orange-800] }
            }
            size {
              sm { %w[h-5 w-9 after:h-4 after:w-4] }
              md { %w[h-6 w-11 after:h-5 after:w-5] }
              lg { %w[h-7 w-14 after:h-6 after:w-6] }
            }
          }

          defaults { { size: :md, color: :pink } }
        end

        style :span do
          base { %w[ms-3 text-sm font-medium dark:text-gray-300] }
          variants {
            disabled {
              yes { %w[text-gray-400] }
              no { %w[text-gray-900] }
            }
          }

          defaults { { disabled: false } }
        end

        attr_reader :text, :size, :color

        def initialize(text: nil, size: nil, color: nil, **extra_attributes)
          @text = text
          @size = size
          @color = color
          super(**extra_attributes)
        end

        def disabled
          attributes[:disabled]
        end
      end
    end
  end
end
