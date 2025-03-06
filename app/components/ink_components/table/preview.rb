# frozen_string_literal: true

module InkComponents
  module Table
    class Preview < Lookbook::Preview
      def default
        table_component do |table|
          table.with_header do |header|
            header.with_cell { "Header 1" }
            header.with_cell { "Header 2" }
            header.with_cell { "Header 3" }
          end
          table.with_row do |row|
            row.with_cell { "Row 1, Cell 1" }
            row.with_cell { "Row 1, Cell 2" }
          end
          table.with_row do |row|
            row.with_cell { "Row 2, Cell 1" }
          end
          table.with_footer do
            "testing"
          end
        end
      end
    end
  end
end
