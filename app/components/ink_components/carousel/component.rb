module InkComponents
  module Carousel
    class Component < ApplicationComponent
      renders_one :wrapper, InkComponents::Carousel::Wrapper::Component
      renders_one :indicators_container, "InkComponents::Carousel::IndicatorsContainer::Component"
      renders_one :prev_button, "InkComponents::Carousel::PrevButton::Component"
      renders_one :next_button, "InkComponents::Carousel::NextButton::Component"

      style do
        base { %w[relative] }
      end

      attr_reader :slider

      def initialize(slider: "slide", **extra_attributes)
        @slider = slider

        super(**extra_attributes)
      end

      private

      def default_attributes
        {
          class: style,
          data: { carousel: slider }
        }
      end
    end
  end
end
