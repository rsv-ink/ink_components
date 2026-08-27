# frozen_string_literal: true

module InkComponents
  module Pagination
    class Component < ApplicationComponent
      # Mirrors the colors of Button::Component, which renders the submit of the per page form.
      COLORS = %i[pink blue dark green red yellow purple].freeze
      SIZES = %i[sm md lg].freeze
      LAYOUTS = %i[row stack].freeze
      EDGES = %i[text chevron arrow].freeze

      EDGE_ICONS = {
        chevron: { previous: "chevron-left", next: "chevron-right" },
        arrow: { previous: "arrow-left", next: "arrow-right" }
      }.freeze

      I18N_SCOPE = "ink_components.pagination"
      DEFAULT_PER_PAGE_OPTIONS = [ 10, 25, 50, 100 ].freeze
      MAX_WINDOW = 50

      # Recipes from the Flowbite docs. Each one only fills slots, so a caller composing by hand
      # passes type: nil and needs none of this.
      PRESETS = {
        default: { pages: {} },
        icons: { pages: { edges: :chevron } },
        spaced: { pages: { spaced: true } },
        spaced_icons: { pages: { spaced: true, edges: :chevron } },
        simple: { controls: {} },
        simple_icons: { controls: { edges: :arrow } },
        table: { layout: :stack, entries: {}, controls: { grouping: :joined, offset: true } },
        table_icons: { layout: :stack, entries: {}, controls: { grouping: :joined, offset: true, edges: :arrow } },
        dropdown: { layout: :row, pages: {}, per_page: {} }
      }.freeze

      style do
        variants {
          layout {
            row { %w[ flex items-center gap-4 ] }
            stack { %w[ flex flex-col items-center ] }
          }
        }
      end

      renders_one :pages, ->(**attrs) { Pages::Component.new(**child_options, **attrs) }
      renders_one :controls, ->(**attrs) { Controls::Component.new(**child_options, **attrs) }
      renders_one :per_page, ->(**attrs) { PerPage::Component.new(**child_options, **attrs) }
      renders_one :entries, ->(**attrs) { Entries::Component.new(pagination: self, **attrs) }

      attr_reader :id, :type, :color, :size, :layout, :current_page, :total_pages, :total_entries,
                  :per_page_size, :per_page_options, :param_name, :per_page_param, :window, :url

      def initialize(id:, type: :default, color: :pink, size: :md, layout: nil,
                     current_page: 1, total_pages: nil, total_entries: nil, per_page: 10,
                     per_page_options: DEFAULT_PER_PAGE_OPTIONS, param_name: :page,
                     per_page_param: :per_page, window: 1, url: nil,
                     previous_label: nil, next_label: nil, aria_label: nil, **extra_attributes)
        @id = id
        @type = type&.to_sym
        @color = color.to_sym
        @size = size.to_sym
        @url = url
        @param_name = param_name
        @per_page_param = per_page_param
        @previous_label = previous_label
        @next_label = next_label
        @aria_label = aria_label

        raise ArgumentError, "Invalid type #{type}, must be one of #{PRESETS.keys.join(", ")}" unless @type.nil? || PRESETS.key?(@type)
        raise ArgumentError, "Invalid color #{color}, must be one of #{COLORS.join(", ")}" unless COLORS.include?(@color)
        raise ArgumentError, "Invalid size #{size}, must be one of #{SIZES.join(", ")}" unless SIZES.include?(@size)

        @layout = (layout || PRESETS.dig(@type, :layout))&.to_sym

        raise ArgumentError, "Invalid layout #{@layout}, must be one of #{LAYOUTS.join(", ")}" unless @layout.nil? || LAYOUTS.include?(@layout)

        @total_entries = total_entries&.to_i
        @per_page_size = [ per_page.to_i, 1 ].max
        @per_page_options = normalize_per_page_options(per_page_options)
        @total_pages = [ (total_pages || derived_total_pages).to_i, 1 ].max
        @current_page = current_page.to_i.clamp(1, @total_pages)
        @window = window.to_i.clamp(0, MAX_WINDOW)

        super(**extra_attributes)

        apply_preset
      end

      def previous_label = @previous_label || translation(:previous)

      def next_label = @next_label || translation(:next)

      def aria_label = @aria_label || translation(:aria_label)

      def edge_label(direction) = direction == :previous ? previous_label : next_label

      def go_label = translation(:go)

      def select_option_label = translation(:select_option)

      def per_page_label(count) = translation(:per_page, count:)

      # The _html suffix marks the result as safe and escapes the interpolations, so the counters
      # can be emphasized without escaping the whole sentence.
      def entries_translation(**options) = t("#{I18N_SCOPE}.entries_html", **options)

      def current_page?(page) = page == current_page

      def edge_page(direction) = direction == :previous ? previous_page : next_page

      def edge_url(direction)
        page = edge_page(direction)

        page && page_url(page)
      end

      # Everything a prev/next cell needs, so Pages and Controls do not each build it.
      def edge_cell_options(direction, edges)
        href = edge_url(direction)

        {
          href:,
          label: edge_label(direction),
          icon: EDGE_ICONS.dig(edges, direction),
          icon_only: edges == :chevron,
          icon_position: direction == :previous ? :leading : :trailing,
          appearance: href.present? ? :idle : :muted
        }
      end

      def entries? = total_entries.present?

      def first_entry
        return 0 if total_entries.to_i.zero?

        [ ((current_page - 1) * per_page_size) + 1, total_entries.to_i ].min
      end

      def last_entry = [ current_page * per_page_size, total_entries.to_i ].min

      def page_items
        first = (current_page - window).clamp(1, total_pages)
        last = (current_page + window).clamp(1, total_pages)
        candidates = ([ 1, total_pages ] + (first..last).to_a).uniq.sort

        candidates.each_with_object([]) do |page, items|
          items << :gap if items.last.is_a?(Integer) && page - items.last > 1
          items << page
        end
      end

      def page_url(page)
        return url.call(page).to_s if url.respond_to?(:call)

        build_url([ *query_prefix, "#{escape(param_name)}=#{escape(page)}" ].join("&"))
      end

      def per_page_choices
        per_page_options.map { |option| [ per_page_label(option), option ] }
      end

      def form_path = target[0]

      # A form submits with GET, so the fragment has to survive the action the same way it
      # survives the page links.
      def form_action = target[2].present? ? "#{form_path}##{target[2]}" : form_path

      # Fields the form renders itself are dropped, so the visible control wins over the hidden
      # one. The per page form also drops the page, so a new page size restarts from the first.
      def forwarded_query_params
        flat_query_params(target[1].except(per_page_param.to_s, param_name.to_s))
      end

      def field_id(suffix) = "#{id}-#{suffix}"

      # Resolved here rather than in default_attributes so the locale is the one of the render.
      def nav_attributes
        return attributes if attributes.key?(:"aria-label") || attributes.dig(:aria, :label).present?

        attributes.merge("aria-label": aria_label)
      end

      private

      def default_attributes
        { id:, class: style(layout:).presence }
      end

      def child_options = { pagination: self, color:, size: }

      def apply_preset
        return if type.nil?

        preset = PRESETS.fetch(type)

        with_pages(**preset[:pages]) if preset.key?(:pages)
        with_entries if preset.key?(:entries)
        with_per_page(**preset[:per_page]) if preset.key?(:per_page)
        with_controls(**preset[:controls]) if preset.key?(:controls)
      end

      def normalize_per_page_options(options)
        options = options.map(&:to_i)

        (options.include?(per_page_size) ? options : options + [ per_page_size ]).sort
      end

      def derived_total_pages
        return 1 if total_entries.to_i.zero?

        (total_entries.to_f / per_page_size).ceil
      end

      def previous_page = current_page > 1 ? current_page - 1 : nil

      def next_page = current_page < total_pages ? current_page + 1 : nil

      # The request query comes from Rails, which already parsed and validated it. A url: string is
      # parsed here, and a malformed one degrades to an empty query rather than raising in the view.
      def target
        @target ||= url.present? ? split_url(url) : [ request&.path.to_s, request&.query_parameters.to_h, "" ]
      end

      def split_url(value)
        base, _hash, fragment = value.to_s.partition("#")
        path, _question, query = base.partition("?")

        [ path, parse_query(query), fragment ]
      end

      def parse_query(query)
        Rack::Utils.parse_nested_query(query.gsub(/[^\x00-\x7F]+/) { |char| escape(char) })
      rescue Rack::Utils::ParameterTypeError, Rack::Utils::InvalidParameterError
        {}
      end

      def query_prefix
        @query_prefix ||= begin
          rest = target[1].except(param_name.to_s)

          rest.any? ? [ Rack::Utils.build_nested_query(rest) ] : []
        end
      end

      def build_url(query)
        base = query.present? ? "#{form_path}?#{query}" : form_path
        fragment = target[2]

        fragment.present? ? "#{base}##{fragment}" : base
      end

      def escape(value) = Rack::Utils.escape(value.to_s)

      def translation(key, **options) = I18n.t("#{I18N_SCOPE}.#{key}", **options)
    end
  end
end
