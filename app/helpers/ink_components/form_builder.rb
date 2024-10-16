# frozen_string_literal: true

module InkComponents
  class FormBuilder < ActionView::Helpers::FormBuilder
    def label(attribute, content, **)
      label_component(for: id(attribute), **) { content }
    end

    # def label_options(attribute)
    #   # html_options(attribute).transform_keys({ id: :for })
    #   { for: id(attribute) }
    # end

    # def html_options(attribute)
    #   {
    #     name: name(attribute),
    #     id: id(attribute),
    #     value: object.try(:public_send, attribute)
    #   }
    # end

    # def name(attribute)
    #   "#{object_name}[#{attribute}]"
    # end

    def id(attribute)
      "#{object_name}_#{attribute}".delete("]").tr("^-a-zA-Z0-9:.", "_")
    end
  end
end
