module InkComponents
  module Carousel
    module Wrapper
      class Component < ApplicationComponent
        renders_many :items, InkComponents::Carousel::Wrapper::Item::Component

        style do
          base { %w[ relative overflow-hidden rounded-lg ] }
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
