# frozen_string_literal: true

module InkComponents
  module Table
    module Footer
      class Component < ApplicationComponent
        renders_many :cells, Cell::Component

        def initialize; end
      end
    end
  end
end
