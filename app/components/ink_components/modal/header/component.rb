# frozen_string_literal: true

module InkComponents
  module Modal
    module Header
      class Component < ApplicationComponent
        renders_one :close_button, ->(**attrs) { CloseButton::Component.new(modal_id: @modal_id, **attrs) }

        attr_reader :modal_id, :title, :subtitle

        def initialize(modal_id:, title:, subtitle: nil)
          @modal_id = modal_id
          @title = title
          @subtitle = subtitle
        end
      end
    end
  end
end
