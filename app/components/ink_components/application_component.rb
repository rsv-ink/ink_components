# frozen_string_literal: true

require "tailwind_merge"

module InkComponents
  class ApplicationComponent < ViewComponentContrib::Base
    include ViewComponentContrib::StyleVariants

    attr_reader :attributes

    def initialize(**extra_attributes)
      @attributes = InkComponents::AttributeMerger.new(
        default_attributes: default_attributes,
        extra_attributes: extra_attributes
      ).merge

      if @attributes[:class].is_a?(String)
        @attributes[:class] = TailwindMerge::Merger.new.merge(@attributes[:class])
      end
    end

    private
    def default_attributes
      {}
    end
  end
end
