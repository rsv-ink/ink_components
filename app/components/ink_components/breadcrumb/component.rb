# frozen_string_literal: true

module InkComponents
  module Breadcrumb
    class Component < ApplicationComponent
      style do
        variants {
          background {
            transparent { %w[flex] }
            solid { %w[ flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700 ] }
          }
        }

        defaults { { background: :transparent } }
      end

      renders_one :list, "ListComponent"

      attr_reader :background

      def initialize(background: nil, **extra_attributes)
        @background = background

        super(**extra_attributes)
      end

      private

      def render?
        list.present?
      end

      def default_attributes
        { class: style(background:) }
      end

      class ListComponent < ApplicationComponent
        renders_many :items, "ItemComponent"

        style do
          base { %w[inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse] }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        def call
          content_tag :ol, attributes do
            items.each do |item|
              concat item
            end
          end
        end

        private

        def render?
          !items.empty?
        end

        def default_attributes
          { class: style }
        end

        class ItemComponent < ApplicationComponent
          style do
            base { %w[inline-flex items-center] }
          end

          renders_one :link, "LinkComponent"
          renders_one :next_page, lambda { InkComponents::Icon::Component.new(name: "chevron-right", type: :outline, class: "rtl:rotate-180 h-6 w-6 text-gray-400 mx-1") }

          def initialize(**extra_attributes)
            super(**extra_attributes)
          end

          def call
            content_tag :li, attributes do
              content
            end
          end

          private

          def render?
            link.present?
          end

          def default_attributes
            { class: style }
          end

          class LinkComponent < ApplicationComponent
            renders_one :icon, lambda { |data|
              InkComponents::Icon::Component.new(**data)
            }

            style do
              base { %w[inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white] }
            end

            def initialize(href: "#", **extra_attributes)
              @href = href

              super(**extra_attributes)
            end

            def call
              content_tag :a, attributes do
                content
              end
            end

            private

            def render?
              content.present?
            end

            def default_attributes
              {
                href: @href,
                class: style
              }
            end
          end
        end
      end
    end
  end
end
