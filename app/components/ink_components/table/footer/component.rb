# frozen_string_literal: true

module InkComponents
  module Table
    module Footer
      class Component < ApplicationComponent
        renders_one :pagination, InkComponents::Table::Footer::Pagination::Component

        def initialize; end
      end
    end
  end
end
