# frozen_string_literal: true

module InkComponents
  module Accordion
    class Component < ApplicationComponent
      renders_many :sections, ->(**attrs) { InkComponents::Accordion::Section::Component.new(flush:, color:, **attrs) }

      style do
        base { %w[ dark:bg-gray-800 dark:text-white ] }

        variants {
          color {
            pink { "bg-pink-100 text-pink-600" }
            blue { "bg-blue-100 text-blue-600" }
            red { "bg-red-100 text-red-600" }
            green { "bg-green-100 text-green-600" }
            purple { "bg-purple-100 text-purple-600" }
            orange { "bg-orange-100 text-orange-600" }
            yellow { "bg-yellow-100 text-yellow-600" }
          }
        }
      end

      attr_reader :flush, :data_accordion, :color

      def initialize(color: nil, flush: false, data_accordion: :collapse, **extra_attributes)
        @flush = flush
        @data_accordion = data_accordion
        @color = color

        super(**extra_attributes)
      end

      private
      def default_attributes
        {
          "data-accordion": data_accordion,
          class: !flush && "border-b border-gray-200"
        }.tap do |attrs|
          if flush
            attrs["data-active-classes"] = "bg-white dark:bg-gray-900 text-gray-900 dark:text-white"
            attrs["data-inactive-classes"] = "text-gray-500 dark:text-gray-400"
          else
            attrs["data-active-classes"] = style(color:) if color
          end
        end
      end
    end
  end
end
