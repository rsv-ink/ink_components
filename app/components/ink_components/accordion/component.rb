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

      style :flush do
        base { %w[ bg-white ] }

        variants {
          active {
            pink { "text-pink-600" }
            blue { "text-blue-600" }
            red { "text-red-600" }
            green { "text-green-600" }
            purple { "text-purple-600" }
            orange { "text-orange-600" }
            yellow { "text-yellow-600" }
            gray { "text-gray-900" }
          }
          inactive {
            pink { "text-pink-500" }
            blue { "text-blue-500" }
            red { "text-red-500" }
            green { "text-green-500" }
            purple { "text-purple-500" }
            orange { "text-orange-500" }
            yellow { "text-yellow-500" }
            gray { "text-gray-500" }
          }
        }
      end

      attr_reader :flush, :data_accordion, :color

      def initialize(color: :gray, flush: false, data_accordion: :collapse, **extra_attributes)
        @flush = flush
        @data_accordion = data_accordion
        @color = color

        super(**extra_attributes)
      end

      private
      def default_attributes
        {
          "data-accordion": data_accordion,
          class: !flush && "border-b border-gray-200",
          "data-active-classes": flush ? style(:flush, active: color) : style(color:),
          "data-inactive-classes": flush ? style(:flush, inactive: color) : style(color:)
        }
      end
    end
  end
end
