# frozen_string_literal: true

module InkComponents
  module DateRangePicker
    class Preview < Lookbook::Preview
      CAMPAIGNS = [
        { id: "fathers-day-2025", label: "Dia dos Pais 2025", starts_on: Date.new(2025, 8, 4), ends_on: Date.new(2025, 8, 10) },
        { id: "christmas-2025", label: "Natal 2025", starts_on: Date.new(2025, 12, 1), ends_on: Date.new(2025, 12, 25) }
      ].freeze

      # @param months select { choices: [1, 2] }
      # @param show_presets toggle
      # @param campaigns toggle
      # @param color select { choices: [pink, blue, red, green, purple, yellow, teal, orange, dark] }
      # @param type select { choices: [both, label, range] }
      # @param align select { choices: [out_right, right, mid_right, mid, mid_left, left, out_left] }
      # @param submit_on_apply toggle
      def playground(months: 2, show_presets: true, campaigns: true, color: :pink, type: :both, align: :right, submit_on_apply: false)
        stage do
          date_range_picker_component(
            id: "playground-date-range-picker",
            months: months.to_i,
            show_presets:,
            color:,
            type:,
            align:,
            submit_on_apply:,
            campaigns: campaigns ? CAMPAIGNS : []
          )
        end
      end

      def default
        date_range_picker_component(id: "default-date-range-picker", submit_on_apply: false)
      end

      # @!group Alignments

      # Opens fully to the right of the trigger.
      def out_right
        stage { date_range_picker_component(id: "out-right-date-range-picker", align: :out_right, submit_on_apply: false) }
      end

      # Left edges meet.
      def right
        stage { date_range_picker_component(id: "right-date-range-picker", align: :right, submit_on_apply: false) }
      end

      # Starts at the trigger's centre, opening right.
      def mid_right
        stage { date_range_picker_component(id: "mid-right-date-range-picker", align: :mid_right, submit_on_apply: false) }
      end

      # Centres meet.
      def mid
        stage { date_range_picker_component(id: "mid-date-range-picker", align: :mid, submit_on_apply: false) }
      end

      # Ends at the trigger's centre, opening left.
      def mid_left
        stage { date_range_picker_component(id: "mid-left-date-range-picker", align: :mid_left, submit_on_apply: false) }
      end

      # Right edges meet.
      def left
        stage { date_range_picker_component(id: "left-date-range-picker", align: :left, submit_on_apply: false) }
      end

      # Opens fully to the left of the trigger.
      def out_left
        stage { date_range_picker_component(id: "out-left-date-range-picker", align: :out_left, submit_on_apply: false) }
      end

      # @!endgroup

      # @!group Colors
      def pink
        date_range_picker_component(id: "pink-date-range-picker", color: :pink, submit_on_apply: false)
      end

      def blue
        date_range_picker_component(id: "blue-date-range-picker", color: :blue, submit_on_apply: false)
      end

      def red
        date_range_picker_component(id: "red-date-range-picker", color: :red, submit_on_apply: false)
      end

      def green
        date_range_picker_component(id: "green-date-range-picker", color: :green, submit_on_apply: false)
      end

      def purple
        date_range_picker_component(id: "purple-date-range-picker", color: :purple, submit_on_apply: false)
      end

      def yellow
        date_range_picker_component(id: "yellow-date-range-picker", color: :yellow, submit_on_apply: false)
      end

      def teal
        date_range_picker_component(id: "teal-date-range-picker", color: :teal, submit_on_apply: false)
      end

      def orange
        date_range_picker_component(id: "orange-date-range-picker", color: :orange, submit_on_apply: false)
      end

      def dark
        date_range_picker_component(id: "dark-date-range-picker", color: :dark, submit_on_apply: false)
      end
      # @!endgroup

      private

      # Centres the trigger and reserves room below it, so every align is visible for what it
      # is instead of being pushed back inside the viewport by the panel's own clamping.
      def stage(&)
        content_tag(:div, class: "flex min-h-[520px] items-start justify-center", &)
      end
    end
  end
end
