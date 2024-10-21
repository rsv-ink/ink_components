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

    def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0")
      checked = object.try(:public_send, attribute).in?([ true, checked_value ])

      checkbox_component(
        id: format_id(attribute), name: format_name(attribute), checked_value:, unchecked_value:, checked:, **options
      )
    end

    def text_field(attribute, **)
      state = field_state(attribute)
      input_field_component(type: :text, state:, **html_options(attribute), **)
    end

    def text_field_with_message(attribute, message_class: "", **)
      state = field_state(attribute)
      input_field_component(type: :text, state:, **html_options(attribute), **) do |input|
        # input.with_error_text(custom_classes: message_class) { error_messages(attribute) }
        yield input if block_given?
      end
    end

    def helper_text(attribute, **)
      state = field_state(attribute)
      helper_text_component(state:, **) { error_messages(attribute) }
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

    def html_options(attribute)
      {
        name: format_name(attribute),
        id: format_id(attribute),
        value: object.try(:public_send, attribute)
      }
    end

    def format_id(attribute)
      resource_name = object_name.present? ? object_name+"_" : ""

      "#{resource_name}#{attribute}".delete("]").tr("^-a-zA-Z0-9:.", "_")
    end

    def format_name(attribute)
      object_name.present? ? "#{object_name}[#{attribute}]" : attribute
    end
  end
end
