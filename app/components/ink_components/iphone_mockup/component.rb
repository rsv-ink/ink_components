# frozen_string_literal: true

module InkComponents
  module IphoneMockup
    class Component < ApplicationComponent
      SIZES = %i[sm md lg].freeze

      COLORS = %i[space_black black_dark black_mid deep_blue silver].freeze

      SIDE_BUTTONS = {
        action: { side: :left, position: "top-[182px] h-[49px]" },
        volume_up: { side: :left, position: "top-[250px] h-[84px]" },
        volume_down: { side: :left, position: "top-[344px] h-[84px]" },
        power: { side: :right, position: "top-[258px] h-[125px]" }
      }.freeze

      style do
        base {
          %w[
            relative flex-none aspect-[115/244]
            [container-type:inline-size] [--frame:10px] [--radius:72px]
          ]
        }

        variants {
          size {
            sm { "w-[230px]" }
            md { "w-[345px]" }
            lg { "w-[460px]" }
          }
        }

        defaults { { size: :lg } }
      end

      style :device do
        base { %w[ relative w-[460px] h-[976px] [zoom:calc(100cqw_/_460px)] ] }
      end

      style :body do
        base { %w[ absolute inset-0 box-border bg-transparent rounded-[var(--radius)] border-[length:var(--frame)] ] }

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
        base { %w[ absolute w-[5px] ] }

        variants {
          color {
            space_black { "bg-[#9A9A9E]" }
            black_dark { "bg-[#8C8C8C]" }
            black_mid { "bg-[#A8A8AD]" }
            deep_blue { "bg-[#7F9BB8]" }
            silver { "bg-[#EDEFF1]" }
          }

          side {
            left { "-left-[3px] rounded-l-[2px]" }
            right { "-right-[3px] rounded-r-[2px]" }
          }
        }

        defaults { { color: :space_black, side: :left } }
      end

      style :screen do
        base {
          %w[
            absolute inset-[var(--frame)] rounded-[calc(var(--radius)-var(--frame))]
            overflow-hidden isolate
          ]
        }
      end

      style :dynamic_island do
        base { %w[ absolute left-[158px] top-[15px] w-[124px] h-[35px] rounded-full bg-black pointer-events-none ] }
      end

      style :home_indicator do
        base { %w[ absolute inset-x-0 bottom-[7px] flex justify-center pointer-events-none ] }
      end

      style :home_indicator_bar do
        base { %w[ w-[140px] h-[5px] rounded-full bg-[#0b0b0c] ] }
      end

      attr_reader :color, :size, :home_indicator

      def initialize(color: nil, size: nil, home_indicator: nil, **extra_attributes)
        @color = color&.to_sym
        @size = size&.to_sym
        @home_indicator = home_indicator.nil? || ActiveModel::Type::Boolean.new.cast(home_indicator)

        raise ArgumentError, "Invalid color #{color}, must be one of #{COLORS.join(", ")}" if @color && COLORS.exclude?(@color)
        raise ArgumentError, "Invalid size #{size}, must be one of #{SIZES.join(", ")}" if @size && SIZES.exclude?(@size)

        super(**extra_attributes)
      end

      def side_buttons
        SIDE_BUTTONS
      end

      def screen_state
        content.present? ? "filled" : "transparent"
      end

      def screen_class
        [ style(:screen), content.present? ? "bg-white" : "bg-transparent" ].join(" ")
      end

      def side_button_class(button)
        [ style(:side_button, color:, side: button[:side]), button[:position] ].join(" ")
      end

      private
      def default_attributes
        { class: style(size:), data: { iphone_mockup: "root" } }
      end
    end
  end
end
