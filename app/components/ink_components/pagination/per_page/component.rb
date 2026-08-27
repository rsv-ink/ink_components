# frozen_string_literal: true

module InkComponents
  module Pagination
    module PerPage
      class Component < ApplicationComponent
        BUTTON_SIZES = { sm: :xs, md: :sm, lg: :md }.freeze

        style do
          base { %w[ flex shrink-0 items-center gap-2 ] }
        end

        delegate :form_action, :forwarded_query_params, :per_page_param, :per_page_size,
                 :per_page_choices, :select_option_label, :go_label, :field_id, to: :pagination

        attr_reader :pagination, :color, :size

        def initialize(pagination:, color: :pink, size: :md, **extra_attributes)
          @pagination = pagination
          @color = color
          @size = size

          if pagination.url.respond_to?(:call)
            raise ArgumentError, "url must be a String for the per page form, whose submit is a GET"
          end

          super(**extra_attributes)
        end

        # The action needs the request, so it is merged at render time rather than in
        # default_attributes, which the initializer evaluates.
        def form_attributes = attributes.merge(action: form_action)

        def select_id = field_id("per-page")

        def hidden_fields
          safe_join(forwarded_query_params.map { |name, value| tag.input(type: "hidden", name:, value:) })
        end

        def select_component
          InkComponents::Forms::Select::Component.new(
            size:,
            choices: per_page_choices,
            options: { selected: per_page_size },
            name: per_page_param,
            id: select_id,
            class: "w-auto"
          )
        end

        def submit_component
          InkComponents::Button::Component.new(
            builder: :button_tag,
            color:,
            size: BUTTON_SIZES.fetch(size),
            type: "submit",
            name: nil
          )
        end

        private

        def default_attributes
          { class: style, method: :get }
        end
      end
    end
  end
end
