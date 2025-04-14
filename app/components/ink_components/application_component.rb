# frozen_string_literal: true

require "tailwind_merge"

module InkComponents
  class ApplicationComponent < ViewComponentContrib::Base
    include ViewComponentContrib::StyleVariants
    include Helpers

    TAILWIND_MERGER = TailwindMerge::Merger.new.freeze

    attr_reader :attributes

    def initialize(**extra_attributes)
      @attributes = mix(default_attributes, extra_attributes)
    end

    def mix(default_attributes, extra_attributes)
      attributes = super(default_attributes, extra_attributes)

      if attributes[:class].is_a?(String)
        attributes[:class] = TAILWIND_MERGER.merge(attributes[:class])
      end

      attributes
    end

    private
    def default_attributes
      {}
    end
  end
end
