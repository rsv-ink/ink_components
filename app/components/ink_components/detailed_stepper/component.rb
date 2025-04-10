module InkComponents
  module DetailedStepper
    class Component < ApplicationComponent
      renders_many :items, InkComponents::DetailedStepper::Item::Component

      style do
        base { %w[w-full space-y-4 sm:flex sm:space-x-8 sm:space-y-0 rtl:space-x-reverse] }
      end

      def initialize(**extra_attributes)
        super(**extra_attributes)
      end

      private

      def default_attributes
        { class: style }
      end

      def before_render
        # Ensure at least one item is marked as current if none are explicitly set
        unless items.any? { |item| item.state == :current }
          items.first&.state = :current
        end
      end
    end
  end
end
