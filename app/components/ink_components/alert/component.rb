# frozen_string_literal: true

module InkComponents
  module Alert
    class Component < ApplicationComponent
      renders_one :title, "TitleComponent"
      renders_one :body, "BodyComponent"
      renders_one :actions, "ActionsComponent"

      style do
        base { %w[ p-4 mb-4 text-sm rounded-lg dark:bg-gray-800 ] }

        variants {
          state {
            info { %w[ text-pink-800 bg-pink-50 dark:text-pink-400 border-pink-300 ] }
            success { %w[ text-green-800 bg-green-50 dark:text-green-400 border-green-300 ] }
            danger { %w[ text-red-800 bg-red-50 dark:text-red-400 border-red-300 ] }
            warning { %w[ text-yellow-800 bg-yellow-50 dark:text-yellow-300 border-yellow-300 ] }
            dark { %w[ text-gray-800 bg-gray-50 dark:text-gray-300 border-gray-300 ] }
          }

          bordered {
            yes { "border" }
          }

          bordered_accent {
            yes { "border-t-4 rounded-none" }
          }
        }

        defaults { { state: :info } }
      end

      attr_reader :state, :bordered, :bordered_accent, :dismissable

      def initialize(state: nil, bordered: false, bordered_accent: false, dismissable: false, **extra_attributes)
        @state = state
        @bordered = bordered
        @bordered_accent = bordered_accent
        @dismissable = dismissable
        super(**extra_attributes)
      end

      private
      def default_attributes
        { class: style(state:, bordered:, bordered_accent:), role: :alert }
      end

      class TitleComponent < ApplicationComponent
        def call
          content_tag :h3, content, class: "text-lg font-medium"
        end

        def render?
          content.present?
        end
      end

      class BodyComponent < ApplicationComponent
        def call
          content_tag :div, content, class: "mt-2 mb-4 text-sm"
        end

        def render?
          content.present?
        end
      end

      class ActionsComponent < ApplicationComponent
        def call
          content_tag :div, content, class: "flex space-x-3"
        end

        def render?
          content.present?
        end
      end
    end
  end
end
