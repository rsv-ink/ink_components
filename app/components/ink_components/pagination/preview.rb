module InkComponents
  module Pagination
    class Preview < Lookbook::Preview
      # @param type select { choices: [default, icons, spaced, spaced_icons, simple, simple_icons, table, table_icons, dropdown, input, input_button, select_buttons, single] }
      # @param color select { choices: [pink, blue, red, green, purple, yellow, teal, orange, indigo, dark] }
      # @param size select { choices: [sm, md, lg] }
      # @param current_page number
      # @param total_pages number
      # @param total_entries number
      # @param per_page number
      # @param window number
      def playground(type: :default, color: :pink, size: :md, current_page: 3, total_pages: 10,
                     total_entries: 100, per_page: 10, window: 1)
        pagination_component(
          id: "playground-pagination",
          type:, color:, size:, current_page:, total_pages:, total_entries:, per_page:, window:
        )
      end

      def default
        pagination_component(id: "default-pagination", current_page: 3, total_pages: 5)
      end

      # @!group Colors
      def pink
        pagination_component(id: "pink-pagination", color: :pink, current_page: 3, total_pages: 5)
      end

      def blue
        pagination_component(id: "blue-pagination", color: :blue, current_page: 3, total_pages: 5)
      end

      def red
        pagination_component(id: "red-pagination", color: :red, current_page: 3, total_pages: 5)
      end

      def green
        pagination_component(id: "green-pagination", color: :green, current_page: 3, total_pages: 5)
      end

      def purple
        pagination_component(id: "purple-pagination", color: :purple, current_page: 3, total_pages: 5)
      end

      def yellow
        pagination_component(id: "yellow-pagination", color: :yellow, current_page: 3, total_pages: 5)
      end

      def teal
        pagination_component(id: "teal-pagination", color: :teal, current_page: 3, total_pages: 5)
      end

      def orange
        pagination_component(id: "orange-pagination", color: :orange, current_page: 3, total_pages: 5)
      end

      def indigo
        pagination_component(id: "indigo-pagination", color: :indigo, current_page: 3, total_pages: 5)
      end

      def dark
        pagination_component(id: "dark-pagination", color: :dark, current_page: 3, total_pages: 5)
      end
      # @!endgroup

      # @!group Sizes
      def small
        pagination_component(id: "small-pagination", size: :sm, current_page: 3, total_pages: 5)
      end

      def medium
        pagination_component(id: "medium-pagination", size: :md, current_page: 3, total_pages: 5)
      end

      def large
        pagination_component(id: "large-pagination", size: :lg, current_page: 3, total_pages: 5)
      end
      # @!endgroup

      # @!group Truncation
      def without_gaps
        pagination_component(id: "without-gaps-pagination", current_page: 3, total_pages: 5)
      end

      def with_gaps
        pagination_component(id: "with-gaps-pagination", current_page: 12, total_pages: 40)
      end

      def wide_window
        pagination_component(id: "wide-window-pagination", current_page: 12, total_pages: 40, window: 3)
      end
      # @!endgroup
    end
  end
end
