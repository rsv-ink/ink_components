# frozen_string_literal: true

module InkComponents
  module Pagination
    module Entries
      class Component < ApplicationComponent
        style do
          base { %w[ text-sm text-gray-500 dark:text-gray-400 ] }
        end

        style :strong do
          base { %w[ font-semibold text-gray-900 dark:text-white ] }
        end

        delegate :entries?, :first_entry, :last_entry, :total_entries, :entries_translation, to: :pagination

        attr_reader :pagination

        def initialize(pagination:, **extra_attributes)
          @pagination = pagination

          super(**extra_attributes)
        end

        def text
          entries_translation(from: strong(first_entry), to: strong(last_entry), total: strong(total_entries))
        end

        def render? = entries?

        private

        def default_attributes
          { class: style }
        end

        def strong(value) = tag.span(value, class: style(:strong))
      end
    end
  end
end
