# frozen_string_literal: true

module InkComponents
 module Table
  class Component < ApplicationComponent
    renders_one :header, Header::Component
    renders_one :footer, Footer::Component
    renders_many :rows, ->(**attrs) { Row::Component.new(hover: @hover, border: @border, **attrs) }

    style :wrapper do
      base { %w[overflow-x-auto] }

      variants {
        rounded {
          yes { %w[rounded-lg] }
        }

        shadow {
          sm { %w[shadow-sm] }
          md { %w[shadow-md] }
          lg { %w[shadow-lg] }
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

    attr_reader :rounded, :displacement, :shadow, :wrapper_attributes

    def initialize(rounded: true, displacement: nil, hover: false, border: true, shadow: :sm, wrapper_attributes: {}, **extra_attributes)
      @rounded = rounded
      @displacement = displacement
      @hover = hover
      @shadow = shadow
      @border = border
      @wrapper_attributes = mix(default_wrapper_attributes, wrapper_attributes)

      super(**extra_attributes)
    end

    private
    def default_wrapper_attributes
      { class: style(:wrapper, rounded:, shadow:) }
    end

    def default_attributes
      { class: style(displacement:) }
    end
  end
 end
end
