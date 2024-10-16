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

    def format_id(attribute)
      resource_name = object_name.present? ? object_name+"_" : ""

      "#{resource_name}#{attribute}".delete("]").tr("^-a-zA-Z0-9:.", "_")
    end
  end
end
