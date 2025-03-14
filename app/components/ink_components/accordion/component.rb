# frozen_string_literal: true

module InkComponents
  module Accordion
    class Component < ApplicationComponent
      renders_many :sections, ->(**attrs) { InkComponents::Accordion::Section::Component.new(flush:, **attrs) }

      attr_reader :flush, :data_accordion

      def initialize(flush: false, data_accordion: :collapse, **extra_attributes)
        @flush = flush
        @data_accordion = data_accordion

        super(**extra_attributes)
      end

      private
      def default_attributes
        {
          "data-accordion": data_accordion,
        }.tap do |attrs|
          if flush
            attrs["data-active-classes"] = "bg-white dark:bg-gray-900 text-gray-900 dark:text-white"
            attrs["data-inactive-classes"] = "text-gray-500 dark:text-gray-400"
          end
        end
      end
    end
  end
end
