# frozen_string_literal: true

module InkComponents
  module Modal
    module Header
      class Component < ApplicationComponent
        attr_reader :modal_id, :title

        def initialize(modal_id:, title:)
          @modal_id = modal_id
          @title = title
        end
      end
    end
  end
end
