# frozen_string_literal: true

module InkComponents
  module Forms
    module Dropzone
      class Component < ApplicationComponent
        renders_one :label_text, InkComponents::Forms::Label::Component
        renders_one :helper_text, InkComponents::Forms::HelperText::Component

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: "hidden" }
        end
      end
    end
  end
end
