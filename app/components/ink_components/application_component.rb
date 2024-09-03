# frozen_string_literal: true

require "tailwind_merge"

module InkComponents
  class ApplicationComponent < ViewComponent::Base

    attr_reader :attributes

    def initialize(default_attributes: {}, **user_attributes)
      @attributes = InkComponents::AttributeMerger.new(
        default_attributes: default_attributes,
        user_attributes: user_attributes
      ).merge

      if @attributes[:class].is_a?(String)
        @attributes[:class] = TailwindMerge::Merger.new.merge(@attributes[:class])
      end
    end
  end
end
