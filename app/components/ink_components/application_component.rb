# frozen_string_literal: true

require "tailwind_merge"

module InkComponents
  class ApplicationComponent < ViewComponentContrib::Base
    include ViewComponentContrib::StyleVariants

    attr_reader :attributes

    def initialize(**extra_attributes)
      @attributes = mix(default_attributes, extra_attributes)
    end

    def mix(default_attributes, extra_attributes)
      attributes = AttributeMerger.new(default_attributes:, extra_attributes:).merge

      if attributes[:class].is_a?(String)
        attributes[:class] = TailwindMerge::Merger.new.merge(attributes[:class])
      end

      attributes
    end

    private
    def default_attributes
      {}
    end
  end
end
