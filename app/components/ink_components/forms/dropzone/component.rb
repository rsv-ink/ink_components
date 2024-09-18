# frozen_string_literal: true

module InkComponents
  module Forms
    module Dropzone
      class Component < ApplicationComponent
        renders_one :label, Label::Component
        renders_one :helper_text, HelperText::Component

        private
        def default_attributes
          { class: "hidden" }
        end
      end
    end
  end
end
