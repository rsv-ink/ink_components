# frozen_string_literal: true

module InkComponents
  class FormBuilder < ActionView::Helpers::FormBuilder
    include InkComponents::ViewHelper

    attr_reader :template

    delegate :render, to: :template

    def label(attribute, content = nil, **)
      content = attribute.to_s.humanize if content.nil?

      label_component(for: format_id(attribute), **) { content }
    end

    def check_box(attribute, options = {}, checked_value = "1", unchecked_value = "0")
      checkbox_component(
        id: format_id(attribute), name: format_name(attribute), checked_value:, unchecked_value:, **options
      )
    end

    private

    def format_id(attribute)
      resource_name = object_name.present? ? object_name+"_" : ""

      "#{resource_name}#{attribute}".delete("]").tr("^-a-zA-Z0-9:.", "_")
    end

    def format_name(attribute)
      object_name.present? ? "#{object_name}[#{attribute}]" : attribute
    end
  end
end
