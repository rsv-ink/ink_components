# frozen_string_literal: true

module InkComponents
  module Button
    class Component < ApplicationComponent
      style do
        base { %w[ focus:ring-4 font-medium text-center focus:outline-none ] }

        variants {
          color {
            pink {
              %w[
                text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600
                dark:hover:bg-pink-700 dark:focus:ring-pink-800
              ]
            }
            blue {
              %w[
                text-white bg-blue-700 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600
                dark:hover:bg-blue-700 dark:focus:ring-blue-800
              ]
            }
            alternative {
              %w[
                text-gray-900 bg-white border border-gray-200 hover:bg-gray-100 hover:text-pink-600
                focus:z-10 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400
                dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700
              ]
            }
            dark {
              %w[
                text-white bg-gray-800 hover:bg-gray-900 focus:ring-gray-300 dark:bg-gray-800
                dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700
              ]
            }
            light {
              %w[
                text-gray-900 bg-white border border-gray-300 hover:bg-gray-100 focus:ring-gray-100
                dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700
                dark:hover:border-gray-600 dark:focus:ring-gray-700
              ]
            }
            green {
              %w[
                text-white bg-green-700 hover:bg-green-800 focus:ring-green-300 dark:bg-green-600
                dark:hover:bg-green-700 dark:focus:ring-green-800
              ]
            }
            red {
              %w[
                text-white bg-red-700 hover:bg-red-800 focus:ring-red-300 dark:bg-red-600
                dark:hover:bg-red-700 dark:focus:ring-red-900
              ]
            }
            yellow {
              %w[ text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-yellow-300 dark:focus:ring-yellow-900 ]
            }
            purple {
              %w[
                text-white bg-purple-700 hover:bg-purple-800 focus:ring-purple-300 dark:bg-purple-600
                dark:hover:bg-purple-700 dark:focus:ring-purple-900
              ]
            }
          }

          shape {
            default { %w[ rounded-lg ] }
            pill { %w[ rounded-full ] }
          }

          size {
            xs { %w[ px-3 py-2 text-xs ] }
            sm { %w[ px-3 py-2 text-sm ] }
            md { %w[ px-5 py-2.5 text-sm ] }
            lg { %w[ px-5 py-3 text-base ] }
            xl { %w[ px-6 py-3.5 text-base ] }
          }

          disabled {
            yes { %w[ cursor-not-allowed ] }
          }
        }

        compound(color: :pink, disabled: true) { %w[ bg-pink-400 dark:bg-pink-500 hover:bg-pink-400 dark:hover:bg-pink-500 ] }
        compound(color: :blue, disabled: true) { %w[ bg-blue-400 dark:bg-blue-500 hover:bg-blue-400 dark:hover:bg-blue-500 ] }
        compound(color: :green, disabled: true) { %w[ bg-green-400 dark:bg-green-500 hover:bg-green-400 dark:hover:bg-green-500 ] }
        compound(color: :yellow, disabled: true) { %w[ bg-yellow-400 dark:bg-yellow-500 hover:bg-yellow-400 dark:hover:bg-yellow-500 ] }
        compound(color: :purple, disabled: true) { %w[ bg-purple-400 dark:bg-purple-500 hover:bg-purple-400 dark:hover:bg-purple-500 ] }
        compound(color: :red, disabled: true) { %w[ bg-red-400 dark:bg-red-500 hover:bg-red-400 dark:hover:bg-red-500 ] }
        compound(color: :dark, disabled: true) { %w[ bg-gray-400 dark:bg-gray-500 hover:bg-gray-400 dark:hover:bg-gray-500 ] }
        compound(color: :light, disabled: true) do
          %w[ text-gray-400 bg-white dark:bg-white hover:bg-white dark:hover:bg-white dark:hover:text-gray-400 dark:text-gray-400 ]
        end
        compound(color: :alternative, disabled: true) do
          %w[ text-gray-400 bg-white dark:bg-white hover:bg-white dark:hover:bg-white hover:text-gray-400 dark:hover:text-gray-400 ]
        end

        defaults { { color: :pink, shape: :default, size: :md } }
      end

      style :outline do
        base {
          %w[
            focus:ring-4 font-medium text-center focus:outline-none
            rounded-lg hover:text-white dark:hover:text-white border bg-transparent dark:bg-transparent
          ]
        }

        variants {
          color {
            pink { %w[ hover:bg-pink-800 text-pink-600 border-pink-600 dark:border-pink-500 dark:text-pink-500 dark:hover:bg-pink-500 ] }
            blue { %w[ hover:bg-blue-800 text-blue-700 border-blue-700 dark:border-blue-500 dark:text-blue-500 dark:hover:bg-blue-500 ] }
            dark { %w[ hover:bg-gray-900 text-gray-800 border-gray-800 dark:border-gray-600 dark:text-gray-400 dark:hover:bg-gray-600 ] }
            green { %w[ hover:bg-green-800 text-green-700 border-green-700 dark:border-green-500 dark:text-green-500 dark:hover:bg-green-600 ] }
            red { %w[ hover:bg-red-800 text-red-700 border-red-700 dark:border-red-500 dark:text-red-500 dark:hover:bg-red-600 ] }
            yellow { %w[ hover:bg-yellow-500 text-yellow-400 border-yellow-400 dark:border-yellow-300 dark:text-yellow-300 dark:hover:bg-yellow-400 ] }
            purple { %w[ hover:bg-purple-800 text-purple-700 border-purple-700 dark:border-purple-400 dark:text-purple-400 dark:hover:bg-purple-500 ] }
          }

          size {
            xs { %w[ px-3 py-2 text-xs ] }
            sm { %w[ px-3 py-2 text-sm ] }
            md { %w[ px-5 py-2.5 text-sm ] }
            lg { %w[ px-5 py-3 text-base ] }
            xl { %w[ px-6 py-3.5 text-base ] }
          }

          disabled {
            yes { %w[ cursor-not-allowed ] }
          }
        }

        defaults { { color: :pink, size: :md } }
      end

      attr_reader :builder, :shape, :color, :size, :href, :disabled

      def initialize(builder: :button_tag, shape: :default, color: nil, size: nil, href: "#", **extra_attributes)
        @builder = builder
        @shape = shape
        @color = color
        @size = size
        @href = href
        @disabled = extra_attributes[:disabled]
        super(**extra_attributes)
      end

      private
      def default_attributes
        classes = shape == :outline ? outline_classes : default_classes

        { class: classes }
      end

      def outline_classes
        style(:outline, color:, size:, disabled:)
      end

      def default_classes
        style(color:, shape:, size:, disabled:)
      end

      def render?
        content.present?
      end
    end
  end
end
