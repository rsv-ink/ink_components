# frozen_string_literal: true

module InkComponents
  module Pagination
    module Controls
      class Component < ApplicationComponent
        LAYOUTS = %i[spaced joined].freeze
        VARIANTS = %i[standalone cell].freeze

        ICONS = InkComponents::Pagination::Pages::Component::ICONS
        EDGES = InkComponents::Pagination::Pages::Component::EDGES

        style do
          variants {
            layout {
              spaced { %w[ flex gap-2 ] }
              joined { %w[ inline-flex -space-x-px ] }
            }
            offset { yes { %w[ mt-4 ] } }
            shadowed { yes { %w[ rounded-lg shadow-sm ] } }
          }

          defaults { { layout: :spaced, offset: false, shadowed: false } }
        end

        delegate :edge_url, :edge_label, :page_of_text, to: :pagination

        attr_reader :pagination, :edges, :layout, :variant, :offset, :shadowed, :counter, :color, :size

        def initialize(pagination:, edges: :text, layout: :spaced, variant: :standalone, offset: false,
                       shadowed: false, counter: false, color: :pink, size: :md, **extra_attributes)
          @pagination = pagination
          @edges = edges.to_sym
          @layout = layout.to_sym
          @variant = variant.to_sym
          @offset = offset
          @shadowed = shadowed
          @counter = counter
          @color = color
          @size = size

          raise ArgumentError, "Invalid edges #{edges}, must be one of #{EDGES.join(", ")}" unless EDGES.include?(@edges)
          raise ArgumentError, "Invalid layout #{layout}, must be one of #{LAYOUTS.join(", ")}" unless LAYOUTS.include?(@layout)
          raise ArgumentError, "Invalid variant #{variant}, must be one of #{VARIANTS.join(", ")}" unless VARIANTS.include?(@variant)

          super(**extra_attributes)
        end

        def counter? = counter

        def edge_cell(direction)
          href = edge_url(direction)

          cell(
            href:,
            label: edge_label(direction),
            icon: ICONS.dig(edges, direction),
            icon_only: edges == :chevron,
            icon_position: direction == :previous ? :leading : :trailing,
            square: variant == :cell && edges == :chevron,
            position: position(direction),
            appearance: href.present? ? :idle : :muted
          )
        end

        def counter_cell
          cell(label: page_of_text, appearance: :static, class: "shrink-0")
        end

        def group_role = layout == :joined ? "group" : nil

        private

        def default_attributes
          { class: style(layout:, offset:, shadowed:), role: group_role }
        end

        def cell(**options)
          render InkComponents::Pagination::Cell::Component.new(variant:, color:, size:, **options)
        end

        def position(direction)
          return :alone if layout == :spaced

          direction == :previous ? :leading : :trailing
        end
      end
    end
  end
end
