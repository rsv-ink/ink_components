# frozen_string_literal: true

module InkComponents
  module Forms
    module Toggle
      class Component < ApplicationComponent
        style do
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

            defaults { { size: :md, color: :pink } }
          }
        end

        attr_reader :text, :size, :color, :disabled, :checked

        def initialize(text: nil, size: nil, color: nil, disabled: false, checked: false, **extra_attributes)
          @text = text
          @size = size
          @color = color
          @disabled = disabled
          @checked = checked
          super(**extra_attributes)
        end

        private
        def default_attributes
          h = {
            class: style(size:, color:)
          }

          add_attribute_disabled(h)
          add_attribute_checked(h)

          h
        end

        def add_attribute_disabled(h)
          h[:disabled] = "disabled" if disabled
        end

        def add_attribute_checked(h)
          h[:checked] = "checked" if checked
        end

        def text_classes
          disabled ? "text-gray-400" : "text-gray-900"
        end
      end
    end
  end
end
