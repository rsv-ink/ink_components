# frozen_string_literal: true

module InkComponents
  module Popover
    class Component < ApplicationComponent
      renders_one :button, "InkComponents::Button::Component"
      renders_one :title, "TitleComponent"
      renders_one :body, "BodyComponent"
      renders_one :arrow

      style do
        base { %w[ absolute z-10 invisible inline-block w-64 text-sm text-gray-500 transition-opacity duration-300 bg-white border border-gray-200 rounded-lg shadow-xs opacity-0 dark:text-gray-400 dark:border-gray-600 dark:bg-gray-800 ] }
      end

      def initialize(id:, **extra_attributes)
        @id = id

        super(**extra_attributes)
      end

      private
      def render?
        button.present? && body.present?
      end

      def default_attributes
        {
          id: @id,
          class: style,
          role: :tooltip,
          data: { popover: true },
          aria: { hidden: true }
        }
      end

      class TitleComponent < ApplicationComponent
        def call
          content
        end

        def render?
          content.present?
        end
      end

      class BodyComponent < ApplicationComponent
        def call
          content
        end

        def render?
          content.present?
        end
      end
    end
  end
end
