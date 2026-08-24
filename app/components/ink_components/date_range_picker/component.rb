# frozen_string_literal: true

module InkComponents
  module DateRangePicker
    class Component < ApplicationComponent
      MOVING_PRESETS = %w[today yesterday last_7_days last_30_days last_90_days].freeze
      CLOSED_PRESETS = %w[this_week last_week this_month last_month this_year max].freeze
      CUSTOM_PRESET = "custom"

      OWN_PARAMS = %w[start_date end_date preset].freeze

      TYPES = %i[both label range].freeze

      DEFAULT_EPOCH = Date.new(2019, 1, 1)
      DEFAULT_DATE_FORMAT = "%d/%m/%Y"

      LABELS = {
        apply: "Atualizar",
        cancel: "Cancelar",
        selected: "Período selecionado:",
        weekdays: %w[Dom Seg Ter Qua Qui Sex Sáb],
        months: %w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro],
        months_abbr: %w[Jan Fev Mar Abr Mai Jun Jul Ago Set Out Nov Dez],
        groups: { moving: "JANELA MÓVEL", closed: "PERÍODO FECHADO", campaigns: "CAMPANHAS" },
        presets: {
          today: "Hoje",
          yesterday: "Ontem",
          last_7_days: "Últimos 7 dias",
          last_30_days: "Últimos 30 dias",
          last_90_days: "Últimos 90 dias",
          this_week: "Esta semana",
          last_week: "Semana passada",
          this_month: "Este mês",
          last_month: "Mês passado",
          this_year: "Este ano",
          max: "Máximo",
          custom: "Personalizado"
        }
      }.freeze

      style do
        base { %w[ relative inline-block text-left ] }
      end

      style :trigger do
        base {
          %w[
            inline-flex items-center gap-2.5 px-3.5 py-2.5 text-sm font-medium text-gray-900 bg-white
            border border-gray-300 rounded-lg shadow-sm hover:bg-gray-100 focus:outline-none focus:ring-4
            focus:ring-gray-100 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700
            dark:focus:ring-gray-700
          ]
        }
      end

      style :panel do
        base {
          %w[
            hidden absolute left-0 z-20 mt-2 w-max overflow-hidden bg-white border border-gray-200
            rounded-lg shadow-md dark:bg-gray-800 dark:border-gray-700
          ]
        }
      end

      style :preset_row do
        base {
          %w[
            flex w-full items-center gap-2.5 rounded-lg px-3 py-2.5 text-left box-border
            hover:bg-gray-100 dark:hover:bg-gray-700
          ]
        }
        variants {
          selected {
            pink { %w[ bg-pink-50 hover:bg-pink-50 dark:bg-pink-900/20 dark:hover:bg-pink-900/20 ] }
            blue { %w[ bg-blue-50 hover:bg-blue-50 dark:bg-blue-900/20 dark:hover:bg-blue-900/20 ] }
            red { %w[ bg-red-50 hover:bg-red-50 dark:bg-red-900/20 dark:hover:bg-red-900/20 ] }
            green { %w[ bg-green-50 hover:bg-green-50 dark:bg-green-900/20 dark:hover:bg-green-900/20 ] }
            purple { %w[ bg-purple-50 hover:bg-purple-50 dark:bg-purple-900/20 dark:hover:bg-purple-900/20 ] }
            yellow { %w[ bg-yellow-50 hover:bg-yellow-50 dark:bg-yellow-900/20 dark:hover:bg-yellow-900/20 ] }
            teal { %w[ bg-teal-50 hover:bg-teal-50 dark:bg-teal-900/20 dark:hover:bg-teal-900/20 ] }
            orange { %w[ bg-orange-50 hover:bg-orange-50 dark:bg-orange-900/20 dark:hover:bg-orange-900/20 ] }
            dark { %w[ bg-gray-100 hover:bg-gray-100 dark:bg-gray-700 dark:hover:bg-gray-700 ] }
            no { [] }
          }
        }
        defaults { { selected: false } }
      end

      style :accent_solid do
        variants {
          color {
            pink { %w[ bg-pink-600 text-white dark:bg-pink-600 ] }
            blue { %w[ bg-blue-600 text-white dark:bg-blue-600 ] }
            red { %w[ bg-red-600 text-white dark:bg-red-600 ] }
            green { %w[ bg-green-600 text-white dark:bg-green-600 ] }
            purple { %w[ bg-purple-600 text-white dark:bg-purple-600 ] }
            yellow { %w[ bg-yellow-400 text-white dark:bg-yellow-400 ] }
            teal { %w[ bg-teal-600 text-white dark:bg-teal-600 ] }
            orange { %w[ bg-orange-500 text-white dark:bg-orange-500 ] }
            dark { %w[ bg-gray-800 text-white dark:bg-gray-800 ] }
          }
        }
        defaults { { color: :pink } }
      end

      style :accent_button do
        variants {
          color {
            pink { %w[ bg-pink-600 text-white hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 ] }
            blue { %w[ bg-blue-600 text-white hover:bg-blue-800 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 ] }
            red { %w[ bg-red-600 text-white hover:bg-red-800 focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800 ] }
            green { %w[ bg-green-600 text-white hover:bg-green-800 focus:ring-green-300 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800 ] }
            purple { %w[ bg-purple-600 text-white hover:bg-purple-800 focus:ring-purple-300 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-800 ] }
            yellow { %w[ bg-yellow-400 text-white hover:bg-yellow-500 focus:ring-yellow-300 dark:bg-yellow-400 dark:hover:bg-yellow-500 dark:focus:ring-yellow-800 ] }
            teal { %w[ bg-teal-600 text-white hover:bg-teal-800 focus:ring-teal-300 dark:bg-teal-600 dark:hover:bg-teal-700 dark:focus:ring-teal-800 ] }
            orange { %w[ bg-orange-500 text-white hover:bg-orange-600 focus:ring-orange-300 dark:bg-orange-500 dark:hover:bg-orange-600 dark:focus:ring-orange-800 ] }
            dark { %w[ bg-gray-800 text-white hover:bg-gray-900 focus:ring-gray-300 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 ] }
          }
        }
        defaults { { color: :pink } }
      end

      style :accent_range do
        variants {
          color {
            pink { %w[ bg-pink-50 text-pink-800 dark:bg-pink-900/20 dark:text-pink-200 ] }
            blue { %w[ bg-blue-50 text-blue-800 dark:bg-blue-900/20 dark:text-blue-200 ] }
            red { %w[ bg-red-50 text-red-800 dark:bg-red-900/20 dark:text-red-200 ] }
            green { %w[ bg-green-50 text-green-800 dark:bg-green-900/20 dark:text-green-200 ] }
            purple { %w[ bg-purple-50 text-purple-800 dark:bg-purple-900/20 dark:text-purple-200 ] }
            yellow { %w[ bg-yellow-50 text-yellow-800 dark:bg-yellow-900/20 dark:text-yellow-200 ] }
            teal { %w[ bg-teal-50 text-teal-800 dark:bg-teal-900/20 dark:text-teal-200 ] }
            orange { %w[ bg-orange-50 text-orange-800 dark:bg-orange-900/20 dark:text-orange-200 ] }
            dark { %w[ bg-gray-100 text-gray-900 dark:bg-gray-700 dark:text-white ] }
          }
        }
        defaults { { color: :pink } }
      end

      style :accent_ring do
        variants {
          color {
            pink { %w[ ring-1 ring-inset ring-pink-300 dark:ring-pink-700 ] }
            blue { %w[ ring-1 ring-inset ring-blue-300 dark:ring-blue-700 ] }
            red { %w[ ring-1 ring-inset ring-red-300 dark:ring-red-700 ] }
            green { %w[ ring-1 ring-inset ring-green-300 dark:ring-green-700 ] }
            purple { %w[ ring-1 ring-inset ring-purple-300 dark:ring-purple-700 ] }
            yellow { %w[ ring-1 ring-inset ring-yellow-300 dark:ring-yellow-700 ] }
            teal { %w[ ring-1 ring-inset ring-teal-300 dark:ring-teal-700 ] }
            orange { %w[ ring-1 ring-inset ring-orange-300 dark:ring-orange-700 ] }
            dark { %w[ ring-1 ring-inset ring-gray-300 dark:ring-gray-600 ] }
          }
        }
        defaults { { color: :pink } }
      end

      style :accent_text do
        variants {
          color {
            pink { %w[ text-pink-600 dark:text-pink-400 ] }
            blue { %w[ text-blue-600 dark:text-blue-400 ] }
            red { %w[ text-red-600 dark:text-red-400 ] }
            green { %w[ text-green-600 dark:text-green-400 ] }
            purple { %w[ text-purple-600 dark:text-purple-400 ] }
            yellow { %w[ text-yellow-400 dark:text-yellow-400 ] }
            teal { %w[ text-teal-600 dark:text-teal-400 ] }
            orange { %w[ text-orange-500 dark:text-orange-400 ] }
            dark { %w[ text-gray-900 dark:text-gray-200 ] }
          }
        }
        defaults { { color: :pink } }
      end

      style :accent_border do
        variants {
          color {
            pink { %w[ border-[5px] border-pink-600 ] }
            blue { %w[ border-[5px] border-blue-600 ] }
            red { %w[ border-[5px] border-red-600 ] }
            green { %w[ border-[5px] border-green-600 ] }
            purple { %w[ border-[5px] border-purple-600 ] }
            yellow { %w[ border-[5px] border-yellow-400 ] }
            teal { %w[ border-[5px] border-teal-600 ] }
            orange { %w[ border-[5px] border-orange-500 ] }
            dark { %w[ border-[5px] border-gray-800 ] }
          }
        }
        defaults { { color: :pink } }
      end

      renders_one :action

      attr_reader :id, :start_date, :end_date, :campaigns, :epoch, :months,
                  :show_presets, :color, :type, :url, :form_method, :submit_on_apply,
                  :date_format, :labels

      def initialize(id:, start_date: nil, end_date: nil, preset: nil, campaigns: [],
                     epoch: DEFAULT_EPOCH, months: 2, show_presets: true, color: :pink,
                     type: :both, url: nil, form_method: :get, submit_on_apply: true,
                     date_format: DEFAULT_DATE_FORMAT, labels: {}, **extra_attributes)
        @id = id
        @campaigns = campaigns.map { |campaign| normalize_campaign(campaign) }
        @epoch = epoch.to_date
        @months = months.to_i.clamp(1, 2)
        @show_presets = show_presets
        @color = color
        @type = type.to_sym

        raise ArgumentError, "Invalid type #{type}, must be one of #{TYPES.join(", ")}" unless TYPES.include?(@type)
        @url = url
        @form_method = form_method
        @submit_on_apply = submit_on_apply
        @date_format = date_format
        @labels = LABELS.deep_merge(labels.deep_symbolize_keys)

        @preset = preset.presence&.to_s
        range = @preset ? resolve(@preset) : nil
        @start_date = start_date&.to_date || range&.first || Date.current - 6
        @end_date = end_date&.to_date || range&.last || Date.current
        @start_date, @end_date = @end_date, @start_date if @start_date > @end_date

        super(**extra_attributes)
      end

      def preset
        @preset || inferred_preset || CUSTOM_PRESET
      end

      def preset_groups
        groups = [
          { title: labels.dig(:groups, :moving), items: MOVING_PRESETS.map { |preset_id| preset_item(preset_id) } },
          { title: labels.dig(:groups, :closed), items: CLOSED_PRESETS.map { |preset_id| preset_item(preset_id) } }
        ]

        groups << { title: labels.dig(:groups, :campaigns), items: campaigns.map { |campaign| campaign_item(campaign) } } if campaigns.any?
        groups << { title: nil, items: [ { id: CUSTOM_PRESET, label: preset_label(CUSTOM_PRESET), range: nil } ] }
        groups
      end

      def resolve(preset_id)
        today = Date.current

        case preset_id.to_s
        when "today" then today..today
        when "yesterday" then (today - 1)..(today - 1)
        when "last_7_days" then (today - 6)..today
        when "last_30_days" then (today - 29)..today
        when "last_90_days" then (today - 89)..today
        when "this_week" then week_start(today)..today
        when "last_week" then (week_start(today) - 7)..(week_start(today) - 1)
        when "this_month" then today.beginning_of_month..today
        when "last_month" then (today - 1.month).beginning_of_month..(today - 1.month).end_of_month
        when "this_year" then today.beginning_of_year..today
        when "max" then epoch..today
        else
          campaign = campaigns.find { |candidate| campaign_id(candidate) == preset_id.to_s }
          campaign && (campaign[:starts_on]..campaign[:ends_on])
        end
      end

      def preset_label(preset_id)
        label = labels.dig(:presets, preset_id.to_sym)
        return label if label

        campaign_item_for(preset_id)&.dig(:label).to_s.presence || preset_id.to_s.humanize
      end

      def show_preset_label? = type != :range

      def show_range_label? = type != :label

      def trigger_preset_label
        "#{preset_label(preset)}#{preset_label_suffix}"
      end

      def trigger_sizer_label
        longest = preset_groups.flat_map { |group| group[:items] }.map { |item| item[:label].to_s }.max_by(&:length)

        "#{longest}#{preset_label_suffix}"
      end

      def trigger_range_label
        "#{format_date(start_date)} - #{format_date(end_date)}"
      end

      def range_label
        "#{format_date(start_date)} — #{format_date(end_date)}"
      end

      def preset_hint(item)
        return "" if item[:range].blank?

        first, last = item[:range].first, item[:range].last
        first == last ? format_date(first) : "#{format_date(first)} – #{format_date(last)}"
      end

      def format_date(date)
        date&.strftime(date_format).to_s
      end

      def forwarded_query_params
        return [] if url.present? || form_method.to_sym != :get

        query = request&.query_parameters.to_h.except(*OWN_PARAMS)

        Rack::Utils.parse_query(query.to_query).flat_map do |name, value|
          Array(value).map { |item| [ name, item ] }
        end
      end

      def panel_id = "#{id}-panel"
      def form_id = "#{id}-form"

      def selected?(item) = item[:id] == preset

      def preset_row_classes(item) = style(:preset_row, selected: selected?(item) ? color : false)

      def preset_label_classes(item)
        base = %w[ block text-sm font-medium whitespace-nowrap ]
        base + (selected?(item) ? [ style(:accent_text, color:) ] : [ "text-gray-700 dark:text-gray-300" ])
      end

      def preset_dot_classes(item)
        base = %w[ box-border block size-4 shrink-0 rounded-full bg-white dark:bg-gray-800 ]
        base + (selected?(item) ? [ style(:accent_border, color:) ] : [ "border border-gray-300 dark:border-gray-600" ])
      end

      def preset_hint_classes(item)
        classes = [ "mt-0.5 block text-[11px] font-normal whitespace-nowrap", style(:accent_text, color:) ]
        classes << "hidden" unless selected?(item) && item[:range].present?
        classes
      end

      def client_config
        {
          start: iso(start_date),
          end: iso(end_date),
          preset: preset,
          months: months,
          submitOnApply: submit_on_apply,
          dateFormat: date_format,
          presets: preset_groups.flat_map { |group| group[:items] }.filter_map do |item|
            next if item[:range].blank?

            { id: item[:id], start: iso(item[:range].first), end: iso(item[:range].last) }
          end,
          labels: {
            presetSuffix: preset_label_suffix,
            weekdays: labels[:weekdays],
            months: labels[:months],
            monthsAbbr: labels[:months_abbr],
            custom: preset_label(CUSTOM_PRESET)
          },
          classes: client_classes
        }.to_json
      end

      private

      def default_attributes
        { id:, class: style }
      end

      def client_classes
        {
          pane: "flex w-[266px] shrink-0 flex-col gap-3",
          paneHeader: "flex items-center justify-between gap-1",
          navButton: "flex size-[30px] items-center justify-center rounded-lg text-gray-500 hover:bg-gray-100 hover:text-gray-900 disabled:cursor-not-allowed disabled:opacity-40 disabled:hover:bg-transparent disabled:hover:text-gray-500 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white dark:disabled:hover:bg-transparent dark:disabled:hover:text-gray-400",
          gap: "self-center select-none text-xl font-semibold text-gray-400 dark:text-gray-500",
          gapHidden: "invisible",
          title: "inline-flex items-center gap-1 rounded-lg px-2 py-[5px] text-sm font-semibold text-gray-900 dark:text-white",
          titleActive: "bg-gray-100 dark:bg-gray-700",
          weekdayRow: "grid grid-cols-7",
          weekday: "pb-1 text-center text-[11px] font-medium text-gray-500 dark:text-gray-400",
          dayGrid: "grid grid-cols-7 gap-y-0.5",
          day: "flex h-[34px] items-center justify-center rounded-lg text-sm font-medium text-gray-900 transition-colors duration-[120ms] dark:text-white",
          dayHover: "hover:bg-gray-100 dark:hover:bg-gray-700",
          daySelected: style(:accent_solid, color:),
          dayInRange: style(:accent_range, color:),
          dayToday: style(:accent_ring, color:),
          monthGrid: "grid grid-cols-3 gap-1.5",
          monthButton: "rounded-lg py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700",
          monthCurrent: style(:accent_solid, color:),
          year: "text-sm font-semibold text-gray-900 dark:text-white",
          presetRow: style(:preset_row, selected: false),
          presetRowSelected: style(:preset_row, selected: color),
          presetLabel: "block text-sm font-medium whitespace-nowrap text-gray-700 dark:text-gray-300",
          presetLabelSelected: "block text-sm font-medium whitespace-nowrap #{style(:accent_text, color:)}",
          presetDot: "box-border block size-4 shrink-0 rounded-full bg-white border border-gray-300 dark:bg-gray-800 dark:border-gray-600",
          presetDotSelected: "box-border block size-4 shrink-0 rounded-full bg-white dark:bg-gray-800 #{style(:accent_border, color:)}"
        }
      end

      def preset_item(preset_id)
        { id: preset_id, label: preset_label(preset_id), range: resolve(preset_id) }
      end

      def campaign_item(campaign)
        { id: campaign_id(campaign), label: campaign[:label], range: campaign[:starts_on]..campaign[:ends_on] }
      end

      def campaign_item_for(preset_id)
        campaigns.map { |campaign| campaign_item(campaign) }.find { |item| item[:id] == preset_id.to_s }
      end

      def campaign_id(campaign) = "campaign:#{campaign[:id]}"

      def normalize_campaign(campaign)
        fetch = lambda do |key|
          if campaign.is_a?(Hash)
            campaign[key] || campaign[key.to_s]
          elsif campaign.respond_to?(key)
            campaign.public_send(key)
          end
        end

        {
          id: fetch.call(:id),
          label: fetch.call(:label) || fetch.call(:name),
          starts_on: fetch.call(:starts_on).to_date,
          ends_on: fetch.call(:ends_on).to_date
        }
      end

      def inferred_preset
        (MOVING_PRESETS + CLOSED_PRESETS + campaigns.map { |campaign| campaign_id(campaign) }).find do |preset_id|
          range = resolve(preset_id)
          range && range.first == start_date && range.last == end_date
        end
      end

      def preset_label_suffix = type == :both ? ":" : ""

      def week_start(date) = date - date.wday

      def iso(date) = date.strftime("%Y-%m-%d")
    end
  end
end
