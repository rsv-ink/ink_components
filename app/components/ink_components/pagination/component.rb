# frozen_string_literal: true

module InkComponents
  module Pagination
    class Component < ApplicationComponent
      TYPES = %i[
        default icons spaced spaced_icons simple simple_icons table table_icons
        dropdown input input_button select_buttons single
      ].freeze

      NUMBERED_TYPES = %i[default icons spaced spaced_icons dropdown input].freeze
      SPACED_TYPES = %i[spaced spaced_icons].freeze
      SIMPLE_TYPES = %i[simple simple_icons].freeze
      TABLE_TYPES = %i[table table_icons].freeze
      CHEVRON_TYPES = %i[icons spaced_icons select_buttons single].freeze
      ARROW_TYPES = %i[simple_icons table_icons].freeze

      I18N_SCOPE = "ink_components.pagination"

      DEFAULT_PER_PAGE_OPTIONS = [ 10, 25, 50, 100 ].freeze
      MAX_PAGE_OPTIONS = 100

      style do
        variants {
          type {
            default { [] }
            icons { [] }
            spaced { [] }
            spaced_icons { [] }
            simple { [] }
            simple_icons { [] }
            single { [] }
            input_button { %w[ inline-flex items-center gap-3 ] }
            select_buttons { %w[ inline-flex items-center gap-3 ] }
            dropdown { %w[ flex items-center gap-4 ] }
            input { %w[ flex items-center gap-4 ] }
            table { %w[ flex flex-col items-center ] }
            table_icons { %w[ flex flex-col items-center ] }
          }
        }

        defaults { { type: :default } }
      end

      style :list do
        base { %w[ flex text-sm ] }

        variants {
          spaced {
            yes { %w[ gap-1 ] }
            no { %w[ -space-x-px ] }
          }
        }

        defaults { { spaced: :no } }
      end

      style :group do
        base { %w[ inline-flex -space-x-px ] }

        variants {
          spaced { yes { %w[ mt-4 ] } }
          shadowed { yes { %w[ rounded-lg shadow-sm ] } }
        }

        defaults { { spaced: :no, shadowed: :no } }
      end

      style :simple_group do
        base { %w[ flex gap-2 ] }
      end

      style :cell do
        base { %w[ flex items-center justify-center box-border border font-medium focus:outline-none ] }

        variants {
          size {
            sm { %w[ h-8 text-sm ] }
            md { %w[ h-9 text-sm ] }
            lg { %w[ h-10 text-base ] }
          }
          position {
            leading { %w[ rounded-s-lg ] }
            trailing { %w[ rounded-e-lg ] }
            alone { %w[ rounded-lg shadow-sm ] }
            none { [] }
          }
          square {
            yes { [] }
            no { [] }
          }
        }

        compound(size: :sm, square: true) { %w[ w-8 ] }
        compound(size: :md, square: true) { %w[ w-9 ] }
        compound(size: :lg, square: true) { %w[ w-10 ] }
        compound(size: :sm, square: false) { %w[ px-3 ] }
        compound(size: :md, square: false) { %w[ px-3 ] }
        compound(size: :lg, square: false) { %w[ px-4 ] }

        defaults { { size: :md, position: :none, square: :no } }
      end

      style :standalone do
        base { %w[ inline-flex items-center box-border border font-medium leading-5 shadow-sm focus:outline-none ] }

        variants {
          size {
            sm { %w[ text-sm px-3 py-1.5 ] }
            md { %w[ text-sm px-3 py-2 ] }
            lg { %w[ text-base px-4 py-2.5 ] }
          }
          position {
            leading { %w[ rounded-s-lg ] }
            trailing { %w[ rounded-e-lg ] }
            alone { %w[ rounded-lg ] }
            none { [] }
          }
        }

        defaults { { size: :md, position: :alone } }
      end

      style :idle do
        base { %w[ text-gray-500 bg-white border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 ] }
      end

      style :soft_hover do
        variants {
          color {
            pink { %w[ hover:bg-pink-50 hover:text-pink-700 dark:hover:bg-pink-900/20 dark:hover:text-pink-200 ] }
            blue { %w[ hover:bg-blue-50 hover:text-blue-700 dark:hover:bg-blue-900/20 dark:hover:text-blue-200 ] }
            red { %w[ hover:bg-red-50 hover:text-red-700 dark:hover:bg-red-900/20 dark:hover:text-red-200 ] }
            green { %w[ hover:bg-green-50 hover:text-green-700 dark:hover:bg-green-900/20 dark:hover:text-green-200 ] }
            purple { %w[ hover:bg-purple-50 hover:text-purple-700 dark:hover:bg-purple-900/20 dark:hover:text-purple-200 ] }
            yellow { %w[ hover:bg-yellow-50 hover:text-yellow-700 dark:hover:bg-yellow-900/20 dark:hover:text-yellow-200 ] }
            teal { %w[ hover:bg-teal-50 hover:text-teal-700 dark:hover:bg-teal-900/20 dark:hover:text-teal-200 ] }
            orange { %w[ hover:bg-orange-50 hover:text-orange-700 dark:hover:bg-orange-900/20 dark:hover:text-orange-200 ] }
            indigo { %w[ hover:bg-indigo-50 hover:text-indigo-700 dark:hover:bg-indigo-900/20 dark:hover:text-indigo-200 ] }
            dark { %w[ hover:bg-gray-100 hover:text-gray-900 dark:hover:bg-gray-700 dark:hover:text-white ] }
          }
        }

        defaults { { color: :pink } }
      end

      style :muted do
        base {
          %w[
            text-gray-300 bg-white border-gray-300 cursor-not-allowed
            dark:bg-gray-800 dark:border-gray-700 dark:text-gray-600
          ]
        }
      end

      style :active do
        variants {
          color {
            pink { %w[ z-10 text-pink-600 bg-pink-50 border-pink-300 hover:bg-pink-100 hover:text-pink-700 dark:bg-pink-900/30 dark:border-pink-800 dark:text-pink-200 dark:hover:bg-pink-900/40 ] }
            blue { %w[ z-10 text-blue-600 bg-blue-50 border-blue-300 hover:bg-blue-100 hover:text-blue-700 dark:bg-blue-900/30 dark:border-blue-800 dark:text-blue-200 dark:hover:bg-blue-900/40 ] }
            red { %w[ z-10 text-red-600 bg-red-50 border-red-300 hover:bg-red-100 hover:text-red-700 dark:bg-red-900/30 dark:border-red-800 dark:text-red-200 dark:hover:bg-red-900/40 ] }
            green { %w[ z-10 text-green-600 bg-green-50 border-green-300 hover:bg-green-100 hover:text-green-700 dark:bg-green-900/30 dark:border-green-800 dark:text-green-200 dark:hover:bg-green-900/40 ] }
            purple { %w[ z-10 text-purple-600 bg-purple-50 border-purple-300 hover:bg-purple-100 hover:text-purple-700 dark:bg-purple-900/30 dark:border-purple-800 dark:text-purple-200 dark:hover:bg-purple-900/40 ] }
            yellow { %w[ z-10 text-yellow-600 bg-yellow-50 border-yellow-300 hover:bg-yellow-100 hover:text-yellow-700 dark:bg-yellow-900/30 dark:border-yellow-800 dark:text-yellow-200 dark:hover:bg-yellow-900/40 ] }
            teal { %w[ z-10 text-teal-600 bg-teal-50 border-teal-300 hover:bg-teal-100 hover:text-teal-700 dark:bg-teal-900/30 dark:border-teal-800 dark:text-teal-200 dark:hover:bg-teal-900/40 ] }
            orange { %w[ z-10 text-orange-600 bg-orange-50 border-orange-300 hover:bg-orange-100 hover:text-orange-700 dark:bg-orange-900/30 dark:border-orange-800 dark:text-orange-200 dark:hover:bg-orange-900/40 ] }
            indigo { %w[ z-10 text-indigo-600 bg-indigo-50 border-indigo-300 hover:bg-indigo-100 hover:text-indigo-700 dark:bg-indigo-900/30 dark:border-indigo-800 dark:text-indigo-200 dark:hover:bg-indigo-900/40 ] }
            dark { %w[ z-10 text-gray-900 bg-gray-100 border-gray-400 hover:bg-gray-200 hover:text-gray-900 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:bg-gray-600 ] }
          }
        }

        defaults { { color: :pink } }
      end

      style :help_text do
        base { %w[ text-sm text-gray-500 dark:text-gray-400 ] }
      end

      style :help_strong do
        base { %w[ font-semibold text-gray-900 dark:text-white ] }
      end

      style :field do
        base {
          %w[
            block box-border border rounded-lg shadow-sm bg-gray-50 border-gray-300 text-gray-900
            dark:bg-gray-700 dark:border-gray-600 dark:text-white
          ]
        }

        variants {
          size {
            sm { %w[ text-sm p-2 ] }
            md { %w[ text-sm p-2.5 ] }
            lg { %w[ text-base px-4 py-3 ] }
          }
        }

        defaults { { size: :md } }
      end

      style :disabled_field do
        base {
          %w[
            block box-border border rounded-lg shadow-sm bg-gray-100 border-gray-300 text-gray-500 cursor-not-allowed
            dark:bg-gray-800 dark:border-gray-700 dark:text-gray-500
          ]
        }

        variants {
          size {
            sm { %w[ text-sm p-2 ] }
            md { %w[ text-sm p-2.5 ] }
            lg { %w[ text-base px-4 py-3 ] }
          }
        }

        defaults { { size: :md } }
      end

      style :field_ring do
        variants {
          color {
            pink { %w[ focus:ring-pink-500 focus:border-pink-500 dark:focus:ring-pink-500 dark:focus:border-pink-500 ] }
            blue { %w[ focus:ring-blue-500 focus:border-blue-500 dark:focus:ring-blue-500 dark:focus:border-blue-500 ] }
            red { %w[ focus:ring-red-500 focus:border-red-500 dark:focus:ring-red-500 dark:focus:border-red-500 ] }
            green { %w[ focus:ring-green-500 focus:border-green-500 dark:focus:ring-green-500 dark:focus:border-green-500 ] }
            purple { %w[ focus:ring-purple-500 focus:border-purple-500 dark:focus:ring-purple-500 dark:focus:border-purple-500 ] }
            yellow { %w[ focus:ring-yellow-400 focus:border-yellow-400 dark:focus:ring-yellow-400 dark:focus:border-yellow-400 ] }
            teal { %w[ focus:ring-teal-500 focus:border-teal-500 dark:focus:ring-teal-500 dark:focus:border-teal-500 ] }
            orange { %w[ focus:ring-orange-500 focus:border-orange-500 dark:focus:ring-orange-500 dark:focus:border-orange-500 ] }
            indigo { %w[ focus:ring-indigo-500 focus:border-indigo-500 dark:focus:ring-indigo-500 dark:focus:border-indigo-500 ] }
            dark { %w[ focus:ring-gray-500 focus:border-gray-500 dark:focus:ring-gray-500 dark:focus:border-gray-500 ] }
          }
        }

        defaults { { color: :pink } }
      end

      style :submit do
        base { %w[ box-border border border-transparent rounded-lg shadow-sm font-medium leading-5 text-white focus:outline-none focus:ring-4 ] }

        variants {
          size {
            sm { %w[ text-sm px-3 py-1.5 ] }
            md { %w[ text-sm px-3 py-2 ] }
            lg { %w[ text-base px-4 py-2.5 ] }
          }
          color {
            pink { %w[ bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 ] }
            blue { %w[ bg-blue-600 hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 ] }
            red { %w[ bg-red-600 hover:bg-red-800 focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800 ] }
            green { %w[ bg-green-600 hover:bg-green-800 focus:ring-green-300 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800 ] }
            purple { %w[ bg-purple-600 hover:bg-purple-800 focus:ring-purple-300 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-800 ] }
            yellow { %w[ bg-yellow-400 hover:bg-yellow-500 focus:ring-yellow-300 dark:bg-yellow-400 dark:hover:bg-yellow-500 dark:focus:ring-yellow-800 ] }
            teal { %w[ bg-teal-600 hover:bg-teal-800 focus:ring-teal-300 dark:bg-teal-600 dark:hover:bg-teal-700 dark:focus:ring-teal-800 ] }
            orange { %w[ bg-orange-500 hover:bg-orange-600 focus:ring-orange-300 dark:bg-orange-500 dark:hover:bg-orange-600 dark:focus:ring-orange-800 ] }
            indigo { %w[ bg-indigo-600 hover:bg-indigo-800 focus:ring-indigo-300 dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800 ] }
            dark { %w[ bg-gray-800 hover:bg-gray-900 focus:ring-gray-300 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 ] }
          }
        }

        defaults { { size: :md, color: :pink } }
      end

      style :icon do
        base { %w[ w-4 h-4 shrink-0 rtl:rotate-180 ] }
      end

      style :label do
        base { %w[ text-sm font-medium text-gray-500 shrink-0 dark:text-gray-400 ] }
      end

      attr_reader :id, :current_page, :total_pages, :total_entries, :per_page, :type, :color, :size,
                  :url, :param_name, :per_page_param, :per_page_options, :window, :auto_submit

      def initialize(current_page: 1, total_pages: nil, total_entries: nil, per_page: 10, type: :default,
                     color: :pink, size: :md, url: nil, param_name: :page, per_page_param: :per_page,
                     per_page_options: DEFAULT_PER_PAGE_OPTIONS, window: 1, auto_submit: true,
                     previous_label: nil, next_label: nil, aria_label: nil, id: nil, **extra_attributes)
        @type = type.to_sym

        raise ArgumentError, "Invalid type #{type}, must be one of #{TYPES.join(", ")}" unless TYPES.include?(@type)

        @id = id.presence || "pagination-#{SecureRandom.hex(4)}"
        @total_entries = total_entries&.to_i
        @per_page = [ per_page.to_i, 1 ].max
        @total_pages = [ (total_pages || derived_total_pages).to_i, 1 ].max
        @current_page = current_page.to_i.clamp(1, @total_pages)
        @color = color
        @size = size
        @url = url
        @param_name = param_name
        @per_page_param = per_page_param
        @per_page_options = per_page_options
        @window = [ window.to_i, 0 ].max
        @auto_submit = auto_submit
        @previous_label = previous_label
        @next_label = next_label
        @aria_label = aria_label

        super(**extra_attributes)
      end

      def numbered? = NUMBERED_TYPES.include?(type)

      def spaced? = SPACED_TYPES.include?(type)

      def simple? = SIMPLE_TYPES.include?(type)

      def table? = TABLE_TYPES.include?(type)

      def chevron_edges? = CHEVRON_TYPES.include?(type)

      def arrow_edges? = ARROW_TYPES.include?(type)

      def previous_label = @previous_label || translation(:previous)

      def next_label = @next_label || translation(:next)

      def aria_label = @aria_label || translation(:aria_label)

      def first_entry
        return 0 if total_entries.to_i.zero?

        ((current_page - 1) * per_page) + 1
      end

      def last_entry = [ current_page * per_page, total_entries.to_i ].min

      def entries_text
        t("#{I18N_SCOPE}.entries_html", from: strong(first_entry), to: strong(last_entry), total: strong(total_entries))
      end

      def page_of_text = translation(:page_of, current: current_page, total: total_pages)

      def of_pages_text = translation(:of_pages, count: total_pages)

      def page_items
        candidates = ([ 1, total_pages ] + ((current_page - window)..(current_page + window)).to_a)
                       .select { |page| page.between?(1, total_pages) }
                       .uniq
                       .sort

        candidates.each_with_object([]) do |page, items|
          items << :gap if items.last.is_a?(Integer) && page - items.last > 1
          items << page
        end
      end

      def page_url(page)
        return "#" if page.blank?
        return url.call(page).to_s if url.respond_to?(:call)

        uri = URI.parse(url.presence || request&.fullpath.presence || "")
        uri.query = Rack::Utils.parse_nested_query(uri.query).merge(param_name.to_s => page).to_query
        uri.to_s
      end

      def page_cell(page)
        classes = cell_classes(square: true, position: number_position)

        return tag.span("…", class: token_list(classes, style(:muted))) if page == :gap

        link_to(
          page,
          page_url(page),
          class: token_list(classes, page_state_classes(page)),
          aria: { current: (current_page?(page) ? "page" : nil) }
        )
      end

      def edge_cell(direction, position: nil)
        position ||= edge_position(direction)

        cell(edge_content(direction), direction, cell_classes(square: chevron_edges?, position:))
      end

      def list_classes = style(:list, spaced: spaced?)

      def standalone_edge(direction, position: :alone)
        cell(edge_content(direction), direction, style(:standalone, size:, position:))
      end

      def entries_label(direction) = direction == :previous ? previous_label : next_label

      def per_page_choices
        per_page_options.map { |option| [ translation(:per_page, count: option), option ] }
      end

      def page_choices
        page_options.map { |page| [ page.to_s, page ] }
      end

      def form_action = url.respond_to?(:call) ? nil : url.presence || request&.path

      def forwarded_query_params
        query = request&.query_parameters.to_h.except(param_name.to_s, per_page_param.to_s)

        Rack::Utils.parse_query(query.to_query).flat_map do |name, value|
          Array(value).map { |item| [ name, item ] }
        end
      end

      def auto_submit_attributes = auto_submit ? { onchange: "this.form.requestSubmit()" } : {}

      def field_classes = token_list(style(:field, size:), style(:field_ring, color:))

      def disabled_field_classes = style(:disabled_field, size:)

      def submit_classes = style(:submit, size:, color:)

      def per_page_select_id = "#{id}-per-page"

      def page_field_id = "#{id}-page"

      def total_pages_field_id = "#{id}-total-pages"

      def translation(key, **options) = I18n.t("#{I18N_SCOPE}.#{key}", **options)

      def hidden_query_params
        safe_join(forwarded_query_params.map { |name, value| tag.input(type: "hidden", name:, value:) })
      end

      def single_label_classes
        token_list(style(:cell, size:, square: false), style(:idle), "shrink-0")
      end

      private

      def default_attributes
        { id:, class: style(type:).presence, "aria-label": aria_label }
      end

      def derived_total_pages
        return 1 if total_entries.to_i.zero?

        (total_entries.to_f / per_page).ceil
      end

      def number_position = spaced? ? :alone : :none

      def edge_position(direction)
        return :alone if spaced?

        direction == :previous ? :leading : :trailing
      end

      def current_page?(page) = page == current_page

      def previous_page = current_page > 1 ? current_page - 1 : nil

      def next_page = current_page < total_pages ? current_page + 1 : nil

      def edge_page(direction) = direction == :previous ? previous_page : next_page

      def disabled?(direction) = edge_page(direction).nil?

      def cell(content, direction, base_classes)
        classes = token_list(base_classes, disabled?(direction) ? style(:muted) : interactive_classes)

        return tag.span(content, class: classes, aria: { disabled: true }) if disabled?(direction)

        link_to(content, page_url(edge_page(direction)), class: classes)
      end

      def cell_classes(square: false, position: :none)
        style(:cell, size:, square:, position:)
      end

      def page_state_classes(page)
        current_page?(page) ? style(:active, color:) : interactive_classes
      end

      def interactive_classes = token_list(style(:idle), style(:soft_hover, color:))

      def edge_content(direction)
        label = entries_label(direction)
        side = direction == :previous ? :left : :right

        if chevron_edges?
          safe_join([ tag.span(label, class: "sr-only"), icon("chevron-#{side}") ])
        elsif arrow_edges?
          parts = [ icon("arrow-#{side}", arrow_spacing(direction)), label ]

          safe_join(direction == :previous ? parts : parts.reverse)
        else
          label
        end
      end

      def arrow_spacing(direction)
        direction == :previous ? "me-1.5 -ms-0.5" : "ms-1.5 -me-0.5"
      end

      def icon(name, extra_classes = nil)
        render InkComponents::Icon::Component.new(name:, type: :outline, class: token_list(style(:icon), extra_classes))
      end

      def strong(value) = tag.span(value, class: style(:help_strong))

      def page_options
        return (1..total_pages).to_a if total_pages <= MAX_PAGE_OPTIONS

        half = MAX_PAGE_OPTIONS / 2
        first = (current_page - half).clamp(1, [ total_pages - MAX_PAGE_OPTIONS + 1, 1 ].max)

        (first...(first + MAX_PAGE_OPTIONS)).to_a
      end
    end
  end
end
