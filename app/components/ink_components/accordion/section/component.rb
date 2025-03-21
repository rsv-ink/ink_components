# frozen_string_literal: true

module InkComponents
  module Accordion
    module Section
      class Component < ApplicationComponent
        renders_one :header, ->(**attrs) { InkComponents::Accordion::Header::Component.new(data_target:, flush:, color:, expanded:, **attrs) }
        renders_one :body, ->(**attrs) { InkComponents::Accordion::Body::Component.new(data_target:, flush:, **attrs) }

        attr_reader :data_target, :flush, :expanded, :color

        def initialize(data_target:, flush: false, expanded: false, color: nil)
          @data_target = data_target
          @flush = flush
          @expanded = expanded
          @color = color
        end
      end
    end
  end
end
