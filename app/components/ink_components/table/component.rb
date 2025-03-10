# frozen_string_literal: true

module InkComponents
 module Table
  class Component < ApplicationComponent
    renders_one :header, Header::Component
    renders_one :footer, Footer::Component
    renders_many :rows, ->(**attrs) { Row::Component.new(hover: @hover, border: @border, **attrs) }

    style :wrapper do
      base { %w[relative overflow-x-auto] }

      variants {
        rounded {
          yes { %w[rounded-lg] }
        }

        shadow {
          yes { %w[shadow-md] }
        }
      }
    end

    style do
      base { %w[w-full text-gray-500] }

      variants {
        displacement {
          left { %w[text-left] }
          right { %w[text-right] }
          center { %w[text-center] }
        }
      }

      defaults { { displacement: :left } }
    end

    attr_reader :rounded, :displacement, :shadow

    def initialize(rounded: true, displacement: nil, hover: false, border: true, shadow: true, **extra_attributes)
      @rounded = rounded
      @displacement = displacement
      @hover = hover
      @shadow = shadow
      @border = border

      super(**extra_attributes)
    end

    private
    def wrapper_attributes
      { class: style(:wrapper, rounded:, shadow:) }
    end

    def default_attributes
      { class: style(displacement:) }
    end
  end
 end
end
