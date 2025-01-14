# frozen_string_literal: true

module InkComponents
  module Modal
    module Header
      class Component < ApplicationComponent
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
