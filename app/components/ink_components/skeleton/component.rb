# frozen_string_literal: true

module InkComponents
  module Skeleton
    class Component < ApplicationComponent
      style do
        variants {
          loading {
            yes { "animate-pulse" }
          }
        }

        defaults { { loading: true } }
      end

      renders_many :nodes, NodeComponent

      attr_reader :loading

      def initialize(loading: true, **extra_attributes)
        @loading = loading

        super(**extra_attributes)
      end

      private
      def default_attributes
        { role: "status", class: style(loading:) }
      end
    end
  end
end
