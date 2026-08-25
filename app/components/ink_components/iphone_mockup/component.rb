# frozen_string_literal: true

module InkComponents
  module IphoneMockup
    class Component < ApplicationComponent
      SIZES = %i[sm md lg].freeze

      COLORS = %i[space_black black_dark black_mid deep_blue silver].freeze

      SIDE_BUTTONS = {
        action: "-left-[0.6522cqw] rounded-l-[0.4348cqw] top-[39.5652cqw] h-[10.6522cqw]",
        volume_up: "-left-[0.6522cqw] rounded-l-[0.4348cqw] top-[54.3478cqw] h-[18.2609cqw]",
        volume_down: "-left-[0.6522cqw] rounded-l-[0.4348cqw] top-[74.7826cqw] h-[18.2609cqw]",
        power: "-right-[0.6522cqw] rounded-r-[0.4348cqw] top-[56.087cqw] h-[27.1739cqw]"
      }.freeze

      style do
        base { %w[ relative flex-none [container-type:inline-size] w-[460px] aspect-[115/244] ] }

        variants {
          size {
            sm { "[zoom:0.5]" }
            md { "[zoom:0.75]" }
            lg { "[zoom:1]" }
          }
        }

        defaults { { size: :lg } }
      end

      style :body do
        base { %w[ absolute inset-0 box-border bg-transparent rounded-[15.6522cqw] border-[2.1739cqw] ] }

        variants {
          color {
            space_black { "border-[#2E2E31]" }
            black_dark { "border-[#171717]" }
            black_mid { "border-[#414146]" }
            deep_blue { "border-[#26405B]" }
            silver { "border-[#BFC3C8]" }
          }
        }

        defaults { { color: :space_black } }
      end

      style :side_button do
        base { %w[ absolute w-[1.087cqw] ] }

        variants {
          color {
            space_black { "bg-[#9A9A9E]" }
            black_dark { "bg-[#8C8C8C]" }
            black_mid { "bg-[#A8A8AD]" }
            deep_blue { "bg-[#7F9BB8]" }
            silver { "bg-[#EDEFF1]" }
          }
        }

        defaults { { color: :space_black } }
      end

      style :screen do
        base { %w[ absolute inset-[2.1739cqw] rounded-[13.4783cqw] overflow-hidden isolate ] }
      end

      style :dynamic_island do
        base {
          %w[
            absolute left-[34.3478cqw] top-[3.2609cqw] w-[26.9565cqw] h-[7.6087cqw]
            rounded-full bg-black pointer-events-none
          ]
        }
      end

      style :home_indicator do
        base { %w[ absolute inset-x-0 bottom-[1.5217cqw] flex justify-center pointer-events-none ] }
      end

      style :home_indicator_bar do
        base { %w[ w-[30.4348cqw] h-[1.087cqw] rounded-full bg-[#0b0b0c] ] }
      end

      attr_reader :color, :size, :home_indicator

      def initialize(color: :space_black, size: :lg, home_indicator: true, **extra_attributes)
        @color = color.to_sym
        @size = size.to_sym
        @home_indicator = home_indicator

        raise ArgumentError, "Invalid color #{color}, must be one of #{COLORS.join(", ")}" unless COLORS.include?(@color)
        raise ArgumentError, "Invalid size #{size}, must be one of #{SIZES.join(", ")}" unless SIZES.include?(@size)

        super(**extra_attributes)
      end

      def side_buttons
        SIDE_BUTTONS
      end

      def screen_class
        [ style(:screen), content.present? ? "bg-white" : "bg-transparent" ].join(" ")
      end

      def side_button_class(geometry)
        [ style(:side_button, color:), geometry ].join(" ")
      end

      private
      def default_attributes
        { class: style(size:) }
      end
    end
  end
end
