# frozen_string_literal: true

module InkComponents
  module Table
    module Header
      class Component < ApplicationComponent
        renders_many :cells, -> { InkComponents::Table::Cell::Component.new(type: :th) }

        def initialize; end
      end
    end
  end
end
