# frozen_string_literal: true

module InkComponents
  class FormBuilder < ActionView::Helpers::FormBuilder
    include InkComponents::ViewHelper

    attr_reader :template

    delegate :render, to: :template

    def label(attribute, content = nil, **)
      content ||= label_text(attribute)

      label_component(for: format_id(attribute), **) { content }
    end

    def radio_button(attribute, value, content = nil, **)
      checked = object.try(:public_send, attribute) == value

      radio_component(id: format_id(attribute, value), name: format_name(attribute), value:, checked:, **) { content }
    end

    def check_box(attribute, options = {}, value = 1, checked_value = "1", unchecked_value = "0")
      checked = object.try(:public_send, attribute).in?([ true, checked_value ])

      id = options[:multiple] ? format_id(attribute, value.to_s.downcase) : format_id(attribute)

      checkbox_component(
        id:, name: format_name(attribute, options[:multiple]), checked_value:, unchecked_value:, checked:, value:, **options
      )
    end

    def select(attribute, choices = nil, select_options = {}, tag_options = {})
      html_options = html_options(attribute)
      select_component(
        state: field_state(attribute),
        options: choices,
        selected: html_options[:value],
        **select_options,
        **tag_options,
        **html_options,
      )
    end

    [
      [ :text_field, :text ],
      [ :email_field, :email ],
      [ :password_field, :password ],
      [ :telephone_field, :tel ],
      [ :url_field, :url ],
      [ :number_field, :number ],
      [ :date_field, :date ],
      [ :datetime_local_field, :"datetime-local" ],
      [ :month_field, :month ],
      [ :week_field, :week ],
      [ :time_field, :time ],
      [ :color_field, :color ],
      [ :search_field, :search ]
    ].each do |method, type|
      define_method(method) do |attribute, **opts|
        state = field_state(attribute)
        input_field_component(type:, state:, **html_options(attribute), **opts)
      end
    end

    def file_field(attribute, **opts)
      file_input_component(**html_options(attribute, opts[:multiple]), **opts)
    end

    def text_area(attribute, **)
      state = field_state(attribute)
      text_area_component(state:, **html_options(attribute), **)
    end

    def error_message(attribute, **)
      state = field_state(attribute)
      helper_text_component(state:, **) { error_messages(attribute) }
    end

    def submit(content = nil, **options)
      content ||= submit_default_value
      options[:data] = { disable_with: content }.merge(options[:data] || {})
      button_component(builder: :button_tag, value: content, **options) { content }
    end

    private
    def label_text(attribute)
      content ||= if object_name.present?
        ActionView::Helpers::Tags::Translator.new(object, object_name, attribute, scope: "helpers.label").translate
      else
        I18n.t("helpers.label.#{attribute}", default: attribute.to_s.humanize)
      end
    end

    def field_state(attribute)
      return :default if object.nil?

      object.errors.include?(attribute) ? :error : :default
    end

    def error_messages(attribute)
      return if object.nil?

      object.errors[attribute].to_sentence.capitalize.presence&.concat(".")
    end

    def html_options(attribute, multiple = false)
      {
        name: format_name(attribute, multiple),
        id: format_id(attribute),
        value: object.try(attribute)
      }
    end

    def format_id(attribute, value = nil)
      resource_name = "#{object_name}_" if object_name.present?
      tag_value = "_#{value}" if value.present?
      index_value = "#{index}_" if index.present?

      "#{resource_name}#{index_value}#{attribute}#{tag_value}".delete("]").tr("^-a-zA-Z0-9:.", "_")
    end

    def format_name(attribute, multiple = false)
      if index.present?
        "#{object_name}[#{index}][#{attribute}]#{multiple ? "[]" : ""}"
      else
        object_name.present? ? "#{object_name}[#{attribute}]#{multiple ? "[]" : ""}" : attribute.to_s
      end
    end
  end
end
