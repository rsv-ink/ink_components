module InkComponents
  module DetailedStepper
    class Component < ApplicationComponent
      renders_many :steps, "InkComponents::DetailedStepper::Step::Component"

      style do
        base { %w[flex flex-col space-y-4 sm:flex-row sm:space-y-0 sm:space-x-8 rtl:space-x-reverse] }

        variants {
          orientation {
            vertical { %w[flex-col space-y-4 sm:flex-col sm:space-y-4 sm:space-x-0] }
            horizontal { %w[flex-row space-y-0 sm:flex-row sm:space-x-8 rtl:space-x-reverse] }
          }
        }

        defaults { { orientation: :horizontal } }
      end

      attr_reader :orientation

      def initialize(orientation: :horizontal, **extra_attributes)
        @orientation = orientation
        super(**extra_attributes)
      end

      private

      def default_attributes
        { class: style(orientation:) }
      end
    end
  end
end
