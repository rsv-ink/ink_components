module InkComponents
  module Carousel
    module IndicatorsContainer
      class Component < ApplicationComponent
        renders_many :items, InkComponents::Carousel::IndicatorsContainer::Item::Component

        style do
          base { %w[absolute z-30 flex -translate-x-1/2 space-x-3 rtl:space-x-reverse bottom-5 left-1/2] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        private
        def default_attributes
          {
            class: style
          }
        end
      end
    end
  end
end
