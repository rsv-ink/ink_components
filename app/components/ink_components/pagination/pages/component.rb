# frozen_string_literal: true

module InkComponents
  module Pagination
    module Pages
      class Component < ApplicationComponent
        EDGES = %i[text chevron arrow].freeze

        ICONS = {
          chevron: { previous: "chevron-left", next: "chevron-right" },
          arrow: { previous: "arrow-left", next: "arrow-right" }
        }.freeze

        style do
          base { %w[ flex text-sm ] }

          variants {
            spaced {
              yes { %w[ gap-1 ] }
              no { %w[ -space-x-px ] }
            }
          }

          defaults { { spaced: false } }
        end

        delegate :page_items, :page_url, :current_page?, :edge_url, :edge_label, to: :pagination

        attr_reader :pagination, :edges, :spaced, :color, :size

        def initialize(pagination:, edges: :text, spaced: false, color: :pink, size: :md, **extra_attributes)
          @pagination = pagination
          @edges = edges.to_sym
          @spaced = spaced
          @color = color
          @size = size

          raise ArgumentError, "Invalid edges #{edges}, must be one of #{EDGES.join(", ")}" unless EDGES.include?(@edges)

          super(**extra_attributes)
        end

        def items = page_items

        def page_cell(page)
          return gap_cell if page == :gap

          cell(
            href: page_url(page),
            label: page,
            square: true,
            position: number_position,
            appearance: current_page?(page) ? :active : :idle,
            current: current_page?(page)
          )
        end

        def edge_cell(direction)
          href = edge_url(direction)

          cell(
            href:,
            label: edge_label(direction),
            icon: ICONS.dig(edges, direction),
            icon_only: edges == :chevron,
            icon_position: direction == :previous ? :leading : :trailing,
            square: edges == :chevron,
            position: edge_position(direction),
            appearance: href.present? ? :idle : :muted
          )
        end

        private

        def default_attributes
          { class: style(spaced:) }
        end

        def cell(**options)
          render InkComponents::Pagination::Cell::Component.new(color:, size:, **options)
        end

        def gap_cell
          cell(label: "…", square: true, appearance: :decorative, position: number_position)
        end

        def number_position = spaced ? :alone : :none

        def edge_position(direction)
          return :alone if spaced

          direction == :previous ? :leading : :trailing
        end
      end
    end
  end
end
