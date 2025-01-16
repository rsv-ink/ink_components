module InkComponents
  module Modal
    class Component < ApplicationComponent
      renders_one :trigger, InkComponents::Modal::Trigger::Component
      renders_one :header, InkComponents::Modal::Header::Component
      renders_one :body, InkComponents::Modal::Body::Component
      renders_one :footer, InkComponents::Modal::Footer::Component

      style :wrapper do
        base do
          %w[
            hidden overflow-y-auto overflow-x-hidden fixed top-0 left-0 z-50
            w-full md:inset-0 h-[calc(100%-1rem)] max-h-full bg-gray-900/50
          ]
        end

        variants {
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

      style :modal do
        base do
          %w[
            relative max-h-full
          ]
        end

        variants {
          max_width {
            sm { "max-w-md" }
            md { "max-w-lg" }
            lg { "max-w-4xl" }
            xl { "max-w-7xl" }
          }

          padding {
            yes { "p-4" }
            no {  }
          }
        }
      end

      attr_reader :modal_id, :max_width, :type, :placement

      def initialize(modal_id:, max_width: nil, type: :dynamic, placement: :center, **extra_attributes)
        @modal_id = modal_id
        @max_width = max_width
        @type = type
        @placement = placement

        super(**extra_attributes)
      end

      private
      def wrapper_attributes
        {
          id: modal_id,
          tabindex: -1,
          data: {
            modal_backdrop: style(type:),
            modal_placement: style(placement:)
          },
          aria: {
            hidden: "hidden"
          },
          role: "dialog",
          class: style(:wrapper, placement_classes: placement)
        }
      end

      def default_attributes
        { class: style(:modal, max_width:, padding: max_width.blank?) }
      end
    end
  end
end
