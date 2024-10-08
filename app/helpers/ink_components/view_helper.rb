# frozen_string_literal: true

module InkComponents
  module ViewHelper
    # Add in directory order
    COMPONENTS = {
      alert: "InkComponents::Alert::Component",
      avatar: "InkComponents::Avatar::Component",
      avatar_collection: "InkComponents::AvatarCollection::Component",
      avatar_status: "InkComponents::AvatarStatus::Component",
      badge: "InkComponents::Badge::Component",
      button: "InkComponents::Button::Component",
      card: "InkComponents::Card::Component",
      checkbox: "InkComponents::Forms::Checkbox::Component",
      dropzone: "InkComponents::Forms::Dropzone::Component",
      file_input: "InkComponents::Forms::FileInput::Component",
      helper_text: "InkComponents::Forms::HelperText::Component",
      label: "InkComponents::Forms::Label::Component",
      radio: "InkComponents::Forms::Radio::Component",
      select: "InkComponents::Forms::Select::Component",
      text_area: "InkComponents::Forms::TextArea::Component",
      toggle: "InkComponents::Forms::Toggle::Component",
      progress_bar: "InkComponents::ProgressBar::Component",
    }.freeze

    COMPONENTS.each do |component, klass|
      define_method("ink_#{component}") do |**kwargs, &block|
        component_klass = klass.constantize
        render component_klass.new(**kwargs), &block
      end
    end
  end
end

# test one of the components
component = InkComponents::ViewHelper::COMPONENTS[:alert]
define_method("ink_alert") do |**kwargs, &block|
  component_klass = component.constantize
  render component_klass.new(**kwargs), &block
end