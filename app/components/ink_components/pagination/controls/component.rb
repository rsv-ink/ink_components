# frozen_string_literal: true

module InkComponents
  module Pagination
    module Controls
      class Component < ApplicationComponent
        EDGES = InkComponents::Pagination::Component::EDGES
        GROUPINGS = %i[spaced joined].freeze

        style do
          variants {
            grouping {
              spaced { %w[ flex gap-2 ] }
              joined { %w[ inline-flex -space-x-px ] }
            }
            offset { yes { %w[ mt-4 ] } }
          }

          defaults { { grouping: :spaced, offset: false } }
        end

        delegate :edge_cell_options, to: :pagination

        attr_reader :pagination, :edges, :grouping, :offset, :color, :size

        def initialize(pagination:, edges: :text, grouping: :spaced, offset: false,
                       color: :pink, size: :md, **extra_attributes)
          @pagination = pagination
          @edges = edges.to_sym
          @grouping = grouping.to_sym
          @offset = offset
          @color = color
          @size = size

          raise ArgumentError, "Invalid edges #{edges}, must be one of #{EDGES.join(", ")}" unless EDGES.include?(@edges)
          raise ArgumentError, "Invalid grouping #{grouping}, must be one of #{GROUPINGS.join(", ")}" unless GROUPINGS.include?(@grouping)

          super(**extra_attributes)
        end

        def edge_cell(direction)
          render InkComponents::Pagination::Cell::Component.new(
            **edge_cell_options(direction, edges),
            variant: :standalone,
            position: position(direction),
            color:,
            size:
          )
        end

        def group_role = grouping == :joined ? "group" : nil

        private

        def default_attributes
          { class: style(grouping:, offset:), role: group_role }
        end

        def position(direction)
          return :alone if grouping == :spaced

          direction == :previous ? :leading : :trailing
        end
      end
    end
  end
end
