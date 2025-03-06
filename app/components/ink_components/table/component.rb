# frozen_string_literal: true

module InkComponents
 module Table
  class Component < ApplicationComponent
    renders_one :header, InkComponents::Table::Header::Component
    renders_one :footer, InkComponents::Table::Footer::Component
    renders_many :rows, InkComponents::Table::Row::Component

    def initialize; end
  end
 end
end
