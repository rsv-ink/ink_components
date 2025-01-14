module InkComponents
  module Modal
    class Component < ApplicationComponent
      renders_one :trigger, InkComponents::Modal::Trigger::Component
      renders_one :header, InkComponents::Modal::Header::Component
      renders_one :body, InkComponents::Modal::Body::Component
      renders_one :footer, InkComponents::Modal::Footer::Component

      style do
        variants {
          max_width {
            sm { "max-w-md" }
            md { "max-w-lg" }
            lg { "max-w-4xl" }
            xl { "max-w-7xl" }
          }

          type {
            dynamic { "dynamic" }
            static { "static" }
          }

          placement {
            center { "center" }
            top_left { "top-left" }
            top_right { "top-right" }
            bottom_left { "bottom-left" }
            bottom_right { "bottom-right" }
          }

          placement_classes {
            center { "justify-center items-center " }
            top_left { "justify-start items-start" }
            top_right { "justify-end items-start" }
            bottom_left { "justify-start items-end" }
            bottom_right { "justify-end items-end" }
          }
        }
      end

      attr_reader :modal_id, :max_width, :type, :placement, :responsive_sizes

      def initialize(modal_id:, max_width: nil, type: :dynamic, placement: :center, responsive_sizes: nil)
        @modal_id = modal_id
        @max_width = max_width
        @type = type
        @placement = placement
        @responsive_sizes = responsive_sizes
      end

      private
      def size
        max_width.present? ? style(max_width:) : responsive_sizes
      end

      def padding
        max_width.present? ? nil : "p-4"
      end
    end
  end
end
