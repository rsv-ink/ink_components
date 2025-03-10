# frozen_string_literal: true

module InkComponents
  module Table
    module Row
      class Component < ApplicationComponent
        renders_many :cells, Cell::Component

        def initialize; end
      end
    end
  end
end
