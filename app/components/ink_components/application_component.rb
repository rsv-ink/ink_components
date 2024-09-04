# frozen_string_literal: true

require "tailwind_merge"

module InkComponents
  class ApplicationComponent < ViewComponentContrib::Base
    include ViewComponentContrib::StyleVariants

    attr_reader :attributes

    def initialize(**user_attributes)
      @attributes = InkComponents::AttributeMerger.new(
        default_attributes: default_attributes,
        user_attributes: user_attributes
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
