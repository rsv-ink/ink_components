# frozen_string_literal: true

module InkComponents
 module Table
  class Component < ApplicationComponent
    renders_one :header, InkComponents::Table::Header::Component
    renders_one :footer, InkComponents::Table::Footer::Component
    renders_many :rows, InkComponents::Table::Row::Component

    style :wrapper do
      base { %w[relative overflow-x-auto] }

      variants {
        rounded {
          lg { %w[rounded-lg] }
        }
      }
    end

    style do
      base { %w[w-full ] }

      variants {
        displacement {
          left { %w[text-left] }
          right { %w[text-right] }
          center { %w[text-center] }
        }
      }

      defaults { { displacement: :left } }
    end

    attr_reader :rounded, :displacement

    def initialize(rounded: false, displacement: nil, **extra_attributes)
      @rounded = rounded
      @displacement = displacement

      super(**extra_attributes)
    end

    private
    def wrapper_attributes
      { class: style(:wrapper, rounded:) }
    end

    def default_attributes
      { class: style(displacement:) }
    end
  end
 end
end
