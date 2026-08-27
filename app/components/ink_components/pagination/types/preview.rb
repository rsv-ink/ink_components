module InkComponents
  module Pagination
    module Types
      class Preview < Lookbook::Preview
        def default
          pagination_component(id: "type-default-pagination", type: :default, current_page: 3, total_pages: 5)
        end

        def icons
          pagination_component(id: "type-icons-pagination", type: :icons, current_page: 3, total_pages: 5)
        end

        def spaced
          pagination_component(id: "type-spaced-pagination", type: :spaced, current_page: 3, total_pages: 5)
        end

        def spaced_icons
          pagination_component(id: "type-spaced-icons-pagination", type: :spaced_icons, current_page: 3, total_pages: 5)
        end

        def simple
          pagination_component(id: "type-simple-pagination", type: :simple, current_page: 3, total_pages: 5)
        end

        def simple_icons
          pagination_component(id: "type-simple-icons-pagination", type: :simple_icons, current_page: 3, total_pages: 5)
        end

        def table
          pagination_component(id: "type-table-pagination", type: :table, current_page: 1, total_entries: 100, per_page: 10)
        end

        def table_icons
          pagination_component(id: "type-table-icons-pagination", type: :table_icons, current_page: 1, total_entries: 100, per_page: 10)
        end

        def dropdown
          pagination_component(id: "type-dropdown-pagination", type: :dropdown, current_page: 3, total_pages: 5)
        end
      end
    end
  end
end
