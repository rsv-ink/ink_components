# frozen_string_literal: true

module InkComponents
  module Skeleton
    class NodeComponent < ApplicationComponent
      style do
        base do
          %w[
            bg-gray-200 dark:bg-gray-700 rounded-full
          ]
        end
      end

      def initialize(**extra_attributes)
        super(**extra_attributes)
      end

      def call
        tag.div(content, **attributes)
      end

      private
      def default_attributes
        {
          class: style
        }
      end
    end
  end
end
