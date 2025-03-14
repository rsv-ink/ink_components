# frozen_string_literal: true

module InkComponents
  module Accordion
    module Section
      class Component < ApplicationComponent
        renders_one :header, ->(**attrs) { InkComponents::Accordion::Header::Component.new(data_target:, position:, flush:, expanded:, **attrs) }
        renders_one :body, ->(**attrs) { InkComponents::Accordion::Body::Component.new(data_target:, position:, flush:, **attrs) }

        attr_reader :data_target, :position, :flush, :expanded

        def initialize(data_target:, position: :middle, flush: false, expanded: false)
          @data_target = data_target
          @position = position
          @flush = flush
          @expanded = expanded
        end
      end
    end
  end
end
