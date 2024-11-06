# frozen_string_literal: true

module InkComponents
  class FormBuilder < ActionView::Helpers::FormBuilder
    include InkComponents::ViewHelper

    attr_reader :template

    delegate :render, to: :template

    def label(attribute, content = nil, **opts, &)
      content ||= label_text(attribute)
      content = template.capture(&) if block_given?

      label_component(for: format_id(attribute, objectify_options(opts)), **sanitize_options(opts)) { content }
    end

    def radio_button(attribute, value, content = nil, **opts)
      checked = object.try(:public_send, attribute) == value
      id = format_id(attribute, objectify_options(opts).merge({ value: }))

      radio_component(id:, name: format_name(attribute, objectify_options(opts)), value:, checked:, **sanitize_options(opts)) { content }
    end

    def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0")
      checked = object.try(:public_send, attribute).in?([ true, checked_value ])
      multiple_attribute = checked_value.to_s.downcase if options[:multiple].present?
      id = format_id(attribute, objectify_options(options).merge({ value: multiple_attribute }))

      checkbox_component(
        id:, name: format_name(attribute, objectify_options(options)), checked_value:, unchecked_value:, checked:, **sanitize_options(options)
      )
    end

    def select(attribute, choices = nil, select_options = {}, tag_options = {}, &)
      html_options = html_options(attribute, objectify_options(tag_options))
      select_component(
        state: field_state(attribute),
        choices:,
        options:,
        selected: html_options[:value],
        **select_options,
        **sanitize_options(tag_options),
        **html_options,
        &
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
        input_field_component(type:, state:, **html_options(attribute, objectify_options(opts)), **sanitize_options(opts))
      end
    end

    def file_field(attribute, **opts)
      file_input_component(**html_options(attribute, objectify_options(opts)), **sanitize_options(opts))
    end

    def text_area(attribute, **options)
      state = field_state(attribute)
      text_area_component(state:, **html_options(attribute, objectify_options(options)), **sanitize_options(opts))
    end

    def error_message(attribute, **)
      state = field_state(attribute)
      helper_text_component(state:, **) { error_messages(attribute) }
    end

    def submit(content = nil, **options, &)
      content ||= submit_default_value
      content = template.capture(&) if block_given?

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

    def html_options(attribute, options)
      {
        name: format_name(attribute, options),
        id: format_id(attribute, options),
        value: object.try(attribute)
      }
    end

    def sanitize_options(opts)
      opts.except(
        :index, :namespace, :skip_default_ids, :allow_method_names_outside_object,
        :builder, :parent_builder, :child_index
      )
    end

    def format_id(attribute, options = {})
      parts = [
        options[:namespace],
        object_name.presence,
        options[:index],
        attribute,
        options[:value].presence
      ]

      parts.compact.join("_").delete("]").tr("^-a-zA-Z0-9:.", "_")
    end

    def format_name(attribute, options = {})
      multiple_suffix = options[:multiple] ? "[]" : ""

      if object_name.blank?
        "#{attribute}#{multiple_suffix}"
      elsif options[:index].present?
        "#{object_name}[#{options[:index]}][#{attribute}]#{multiple_suffix}"
      else
        "#{object_name}[#{attribute}]#{multiple_suffix}"
      end
    end
  end
end
