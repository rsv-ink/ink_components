# frozen_string_literal: true

module InkComponents
  module DateRangePicker
    class Preview < Lookbook::Preview
      CAMPAIGNS = [
        { id: "fathers-day-2025", label: "Dia dos Pais 2025", starts_on: Date.new(2025, 8, 4), ends_on: Date.new(2025, 8, 10) },
        { id: "christmas-2025", label: "Natal 2025", starts_on: Date.new(2025, 12, 1), ends_on: Date.new(2025, 12, 25) }
      ].freeze

      # Date Range Picker Playground
      # ---------------
      # Filtro de período com presets agrupados, meses navegáveis e seleção de range.
      # Ao aplicar, os campos ocultos `start_date`, `end_date` e `preset` são preenchidos,
      # o evento `ink:date-range-picker:change` é disparado e o formulário é submetido.
      #
      # @param months select { choices: [1, 2] }
      # @param show_presets toggle
      # @param campaigns toggle
      # @param color select { choices: [pink, blue, red, green, purple, yellow, teal, orange, dark] }
      # @param type select { choices: [both, label, range] }
      # @param submit_on_apply toggle
      def playground(months: 2, show_presets: true, campaigns: true, color: :pink, type: :both, submit_on_apply: false)
        date_range_picker_component(
          id: "playground-date-range-picker",
          months: months.to_i,
          show_presets:,
          color:,
          type:,
          submit_on_apply:,
          campaigns: campaigns ? CAMPAIGNS : []
        )
      end

      def default
        date_range_picker_component(id: "default-date-range-picker", submit_on_apply: false)
      end

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
    end
  end
end
