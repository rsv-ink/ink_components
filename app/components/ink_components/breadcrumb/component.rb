# frozen_string_literal: true

module InkComponents
  module Breadcrumb
    class Component < ApplicationComponent
      style do
        variants {
          background {
            transparent { %w[flex] }
            solid { %w[ flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700 ] }
          }
        }

        defaults { { background: :transparent } }
      end

      renders_one :list, InkComponents::Breadcrumb::List::Component

      attr_reader :background

      def initialize(background: nil, **extra_attributes)
        @background = background

        super(**extra_attributes)
      end

      private

      def default_attributes
        { class: style(background:) }
      end
    end
  end
end
