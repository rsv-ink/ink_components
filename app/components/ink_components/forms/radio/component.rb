# frozen_string_literal: true

module InkComponents
    module Forms
      module Radio
        class Component < ApplicationComponent
          renders_one :helper_text, InkComponents::Forms::HelperText::Component

          style do
            base { "w-4 h-4 bg-gray-100 border-gray-300 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" }
            
            variants {
              color {
                pink { "text-pink-600 focus:ring-pink-500 dark:focus:ring-pink-600" }
                blue { "text-blue-600 focus:ring-blue-500 dark:focus:ring-blue-600" }
                green { "text-green-600 focus:ring-green-500 dark:focus:ring-green-600" }
                red { "text-red-600 focus:ring-red-500 dark:focus:ring-red-600" }
                teal { "text-teal-600 focus:ring-teal-500 dark:focus:ring-teal-600" }
                purple { "text-purple-600 focus:ring-purple-500 dark:focus:ring-purple-600" }
                yellow { "text-yellow-400 focus:ring-yellow-500 dark:focus:ring-yellow-600" }
                orange { "text-orange-500 focus:ring-orange-500 dark:focus:ring-orange-600" }
              }
            }

            defaults { { color: :pink } }
          end

          style :label do
            base { "ms-2 text-sm font-medium" }

            variants {
              disabled {
                yes { "text-gray-400 dark:text-gray-500" }
                no { "text-gray-900 dark:text-gray-300" }
              }
            }

            defaults { { disabled: :no } }
          end

          style :div do
            base { "flex items-center" }

            variants {
              bordered {
                yes { "ps-4 border border-gray-200 rounded dark:border-gray-700 h-12" }
              }
            }

            defaults { { bordered: :no } }
          end

  
          attr_reader :color, :disabled, :bordered

          def initialize(color: nil, disabled: nil, bordered: nil, **extra_attributes)
            @color = color
            @disabled = disabled
            @bordered = bordered

            super(**extra_attributes)
          end
  
          private
          def default_attributes
            { type: "radio", class: style(color:) }
          end

          def label_attributes
            { class: style(:label, disabled:) }
          end

          def div_attributes
            { class: style(:div, bordered:) }
          end
        end
      end
    end
  end