# frozen_string_literal: true

module InkComponents
  module Table
    class Preview < Lookbook::Preview
      # @param shadow toggle
      # @param rounded toggle
      # @param border toggle
      # @param hover toggle
      # @param displacement select { choices: [left, right, center] }
      def default(
        shadow: true,
        rounded: true,
        displacement: :left,
        border: true,
        hover: false
      )
        table_component(shadow:, rounded:, border:, hover:, displacement:) do |table|
          table.with_header do |header|
            header.with_cell { "Header 1" }
            header.with_cell { "Header 2" }
            header.with_cell { "Header 3" }
          end
          table.with_row do |row|
            row.with_cell { "Row 1, Cell 1" }
            row.with_cell { "Row 1, Cell 2" }
            row.with_cell { "Row 1, Cell 3" }
          end
          table.with_row do |row|
            row.with_cell { "Row 2, Cell 1" }
            row.with_cell { "Row 2, Cell 2" }
            row.with_cell { "Row 2, Cell 3" }
          end
          table.with_footer do |footer|
            footer.with_cell(scope: :row, type: :th) { "Footer" }
            footer.with_cell { "Footer" }
            footer.with_cell { "Footer" }
          end
        end
      end
    end
  end
end
