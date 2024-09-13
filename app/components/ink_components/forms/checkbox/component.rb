# frozen_string_literal: true

module InkComponents
  module Forms
    module Checkbox
      class Component < ApplicationComponent
        renders_one :helper_text, ->(&block) { HelperText::Component.new(size: :xs, class: "mt-0 ms-2") }

        style do
          base {
            %w[
              w-4 h-4 bg-gray-100 border-gray-300 rounded dark:ring-offset-gray-800
              focus:ring-2 dark:bg-gray-700 dark:border-gray-600
            ]
          }

          variants {
            color {
              pink { %w[ text-pink-600 focus:ring-pink-500 dark:focus:ring-pink-600 ] }
              blue { %w[ text-blue-600 focus:ring-blue-500 dark:focus:ring-blue-600 ] }
              red { %w[ text-red-600 focus:ring-red-500 dark:focus:ring-red-600 ] }
              green { %w[ text-green-600 focus:ring-green-500 dark:focus:ring-green-600 ] }
              purple { %w[ text-purple-600 focus:ring-purple-500 dark:focus:ring-purple-600 ] }
              yellow { %w[ text-yellow-400 focus:ring-yellow-500 dark:focus:ring-yellow-600 ] }
              teal { %w[ text-teal-600 focus:ring-teal-500 dark:focus:ring-teal-600 ] }
              orange { %w[ text-orange-500 focus:ring-orange-500 dark:focus:ring-orange-600 ] }
            }
          }

          defaults { { color: :pink } }
        end

        style :label do
          base { %w[ ms-2 mb-0 ] }

          variants {
            disabled {
              yes { %w[ text-gray-400 dark:text-gray-500 ] }
              no { %w[ dark:text-gray-300 ]}
            }

            bordered {
              yes { %w[ w-full py-4 ]}
            }
          }
        end

        style :wrapper_div do
          base { %w[ flex items-center ] }

          variants {
            bordered {
              yes { %w[ ps-4 border border-gray-200 rounded dark:border-gray-700 ] }
            }
          }
        end

        attr_reader :checked, :unchecked_value, :disabled, :bordered, :color

        def initialize(checked: false, unchecked_value: "0", disabled: false, bordered: false, color: nil, **extra_attributes)
          @checked = checked
          @disabled = disabled
          @unchecked_value = unchecked_value
          @bordered = bordered
          @color = color
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style(color:), disabled: }
        end

        def label_attributes
          { for: checkbox_id, class: style(:label, disabled:, bordered:) }
        end

        def checkbox_name
          attributes[:name] || checkbox_id
        end

        def checkbox_id
          attributes[:id] || content&.tr(" ", "_")&.downcase
        end

        def helper_text_classes
          %w[ flex flex-col h-5 ] if helper_text?
        end
      end
    end
  end
end
