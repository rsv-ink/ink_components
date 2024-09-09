# frozen_string_literal: true

module InkComponents
  module AvatarStatus
    class Component < ApplicationComponent
      include ViewComponentContrib::StyleVariants

      renders_one :avatar, InkComponents::Avatar::Component

      style do
        base {
          %w[ w-3.5 h-3.5 border-2 border-white dark:border-gray-800 rounded-full absolute ]
        }
        variants {
          status {
            online { "bg-green-400" }
            offline { "bg-red-400" }
          }
          position {
            top { "top-0" }
            bottom { "bottom-0" }
          }
          avatar_shape {
            circle { "left-7" }
            square { "left-8 transform -translate-y-1/2" }
          }
        }

        compound(position: :top, avatar_shape: :square) { %w[-translate-y-1/2] }
        compound(position: :bottom, avatar_shape: :square) { %w[-translate-y-1/4] }

        defaults { { status: :online, position: :top, avatar_shape: :circle } }
      end

      attr_reader :status, :position, :avatar_shape, :extra_attributes

      def initialize(status: nil, position: nil, avatar_shape: nil, **extra_attributes)
        @status = status
        @position = position
        @avatar_shape = avatar_shape
        @extra_attributes = extra_attributes

        super(**extra_attributes)
      end

      def default_attributes
        {
          class: style(status:, position:, avatar_shape:)
        }
      end
    end
  end
end
