# frozen_string_literal: true

module InkComponents
  module Pagination
    module Form
      class Component < ApplicationComponent
        CONTROLS = %i[per_page_select page_field page_select].freeze

        OWNED_PARAMS = {
          per_page_select: %i[per_page page],
          page_field: %i[page],
          page_select: %i[page]
        }.freeze

        style do
          base { %w[ flex shrink-0 items-center gap-3 ] }
        end

        style :field do
          base { %w[ block box-border border rounded-lg shadow-sm ] }

          variants {
            size {
              sm { %w[ text-sm p-2 ] }
              md { %w[ text-sm p-2.5 ] }
              lg { %w[ text-base px-4 py-3 ] }
            }
            state {
              enabled { %w[ bg-gray-50 border-gray-300 text-gray-900 dark:bg-gray-700 dark:border-gray-600 dark:text-white ] }
              disabled { %w[ bg-gray-100 border-gray-300 text-gray-500 cursor-not-allowed dark:bg-gray-800 dark:border-gray-700 dark:text-gray-500 ] }
            }
          }

          defaults { { size: :md, state: :enabled } }
        end

        style :ring do
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

        style :label do
          base { %w[ text-sm font-medium text-gray-500 shrink-0 dark:text-gray-400 ] }
        end

        delegate :url, :form_path, :forwarded_query_params, :param_name, :per_page_param, :per_page,
                 :per_page_options, :per_page_choices, :page_choices, :current_page, :total_pages,
                 :selectable_pages?, :of_pages_text, :select_option_label, :go_to_label, :page_label,
                 :go_label, :field_id, to: :pagination

        attr_reader :pagination, :control, :auto_submit, :submit, :color, :size

        def initialize(pagination:, control: :per_page_select, auto_submit: true, submit: false,
                       color: :pink, size: :md, **extra_attributes)
          @pagination = pagination
          @control = control.to_sym
          @auto_submit = auto_submit
          @submit = submit
          @color = color
          @size = size

          raise ArgumentError, "Invalid control #{control}, must be one of #{CONTROLS.join(", ")}" unless CONTROLS.include?(@control)

          if pagination.url.respond_to?(:call)
            raise ArgumentError, "url must be a String for a pagination form, whose submit is a GET"
          end

          super(**extra_attributes)
        end

        # The action needs the request, so it is merged at render time rather than in
        # default_attributes, which the initializer evaluates.
        def form_attributes = attributes.merge(action: form_path)

        def hidden_fields
          pairs = forwarded_query_params(owned_params)

          safe_join(pairs.map { |name, value| tag.input(type: "hidden", name:, value:) })
        end

        # Only a select needs a handler to be submitted; a field submits on Enter.
        def handler? = select_control? && auto_submit

        def handler_attributes = handler? ? { onchange: "this.form.requestSubmit()" } : {}

        def submit_button? = submit || (select_control? && !auto_submit)

        def select_control?
          return true if control == :per_page_select

          control == :page_select && selectable_pages?
        end

        def per_page_select? = control == :per_page_select

        def page_select? = control == :page_select

        def page_field? = control == :page_field

        def field_classes(extra = nil)
          token_list(style(:field, size:), style(:ring, color:), extra)
        end

        def disabled_field_classes(extra = nil)
          token_list(style(:field, size:, state: :disabled), extra)
        end

        def submit_classes = style(:submit, size:, color:)

        def label_classes = style(:label)

        def per_page_select_id = field_id("per-page")

        def page_field_id = field_id("page")

        def total_pages_field_id = field_id("total-pages")

        private

        def default_attributes
          { class: style, method: :get }
        end

        def owned_params
          OWNED_PARAMS.fetch(control).map { |field| field == :per_page ? per_page_param : param_name }
        end
      end
    end
  end
end
