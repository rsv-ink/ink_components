# frozen_string_literal: true

module InkComponents
  module Pagination
    module Cell
      class Component < ApplicationComponent
        VARIANTS = %i[cell standalone].freeze
        WIDTHS = %i[fixed minimum auto].freeze

        PALETTE = InkComponents::Pagination::Component::COLORS
        SCALE = InkComponents::Pagination::Component::SIZES
        APPEARANCES = %i[idle active muted decorative].freeze
        POSITIONS = %i[leading trailing alone none].freeze

        style :cell do
          base { %w[ flex items-center justify-center box-border border font-medium focus:outline-none ] }

          variants {
            size {
              sm { %w[ h-8 text-sm ] }
              md { %w[ h-9 text-sm ] }
              lg { %w[ h-10 text-base ] }
            }
          }

          compound(size: :sm, width: :fixed) { %w[ w-8 ] }
          compound(size: :md, width: :fixed) { %w[ w-9 ] }
          compound(size: :lg, width: :fixed) { %w[ w-10 ] }
          compound(size: :sm, width: :minimum) { %w[ px-3 min-w-8 ] }
          compound(size: :md, width: :minimum) { %w[ px-3 min-w-9 ] }
          compound(size: :lg, width: :minimum) { %w[ px-4 min-w-10 ] }
          compound(size: :sm, width: :auto) { %w[ px-3 ] }
          compound(size: :md, width: :auto) { %w[ px-3 ] }
          compound(size: :lg, width: :auto) { %w[ px-4 ] }

          defaults { { size: :md, width: :auto } }
        end

        style :standalone do
          base { %w[ inline-flex items-center box-border border font-medium leading-5 shadow-sm focus:outline-none ] }

          variants {
            size {
              sm { %w[ text-sm px-3 py-1.5 ] }
              md { %w[ text-sm px-3 py-2 ] }
              lg { %w[ text-base px-4 py-2.5 ] }
            }
          }

          defaults { { size: :md } }
        end

        style :rounding do
          variants {
            position {
              leading { %w[ rounded-s-lg ] }
              trailing { %w[ rounded-e-lg ] }
              alone { %w[ rounded-lg shadow-sm ] }
            }
          }
        end

        style :idle do
          base { %w[ text-gray-500 bg-white border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 ] }
        end

        style :hover do
          variants {
            color {
              pink { %w[ hover:bg-pink-50 hover:text-pink-700 dark:hover:bg-pink-900/20 dark:hover:text-pink-200 ] }
              blue { %w[ hover:bg-blue-50 hover:text-blue-700 dark:hover:bg-blue-900/20 dark:hover:text-blue-200 ] }
              red { %w[ hover:bg-red-50 hover:text-red-700 dark:hover:bg-red-900/20 dark:hover:text-red-200 ] }
              green { %w[ hover:bg-green-50 hover:text-green-700 dark:hover:bg-green-900/20 dark:hover:text-green-200 ] }
              purple { %w[ hover:bg-purple-50 hover:text-purple-700 dark:hover:bg-purple-900/20 dark:hover:text-purple-200 ] }
              yellow { %w[ hover:bg-yellow-50 hover:text-yellow-700 dark:hover:bg-yellow-900/20 dark:hover:text-yellow-200 ] }
              dark { %w[ hover:bg-gray-100 hover:text-gray-900 dark:hover:bg-gray-700 dark:hover:text-white ] }
            }
          }

          defaults { { color: :pink } }
        end

        style :focus do
          base { %w[ focus:relative focus:z-10 focus:ring-2 ] }

          variants {
            color {
              pink { %w[ focus:ring-pink-300 dark:focus:ring-pink-800 ] }
              blue { %w[ focus:ring-blue-300 dark:focus:ring-blue-800 ] }
              red { %w[ focus:ring-red-300 dark:focus:ring-red-800 ] }
              green { %w[ focus:ring-green-300 dark:focus:ring-green-800 ] }
              purple { %w[ focus:ring-purple-300 dark:focus:ring-purple-800 ] }
              yellow { %w[ focus:ring-yellow-300 dark:focus:ring-yellow-800 ] }
              dark { %w[ focus:ring-gray-300 dark:focus:ring-gray-600 ] }
            }
          }

          defaults { { color: :pink } }
        end

        style :active do
          variants {
            color {
              pink { %w[ z-10 text-pink-600 bg-pink-50 border-pink-300 hover:bg-pink-100 hover:text-pink-700 dark:bg-pink-900/30 dark:border-pink-800 dark:text-pink-200 dark:hover:bg-pink-900/40 ] }
              blue { %w[ z-10 text-blue-600 bg-blue-50 border-blue-300 hover:bg-blue-100 hover:text-blue-700 dark:bg-blue-900/30 dark:border-blue-800 dark:text-blue-200 dark:hover:bg-blue-900/40 ] }
              red { %w[ z-10 text-red-600 bg-red-50 border-red-300 hover:bg-red-100 hover:text-red-700 dark:bg-red-900/30 dark:border-red-800 dark:text-red-200 dark:hover:bg-red-900/40 ] }
              green { %w[ z-10 text-green-600 bg-green-50 border-green-300 hover:bg-green-100 hover:text-green-700 dark:bg-green-900/30 dark:border-green-800 dark:text-green-200 dark:hover:bg-green-900/40 ] }
              purple { %w[ z-10 text-purple-600 bg-purple-50 border-purple-300 hover:bg-purple-100 hover:text-purple-700 dark:bg-purple-900/30 dark:border-purple-800 dark:text-purple-200 dark:hover:bg-purple-900/40 ] }
              yellow { %w[ z-10 text-yellow-600 bg-yellow-50 border-yellow-300 hover:bg-yellow-100 hover:text-yellow-700 dark:bg-yellow-900/30 dark:border-yellow-800 dark:text-yellow-200 dark:hover:bg-yellow-900/40 ] }
              dark { %w[ z-10 text-gray-900 bg-gray-100 border-gray-400 hover:bg-gray-200 hover:text-gray-900 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:bg-gray-600 ] }
            }
          }

          defaults { { color: :pink } }
        end

        style :muted do
          base {
            %w[
              text-gray-300 bg-white border-gray-300 cursor-not-allowed
              dark:bg-gray-800 dark:border-gray-700 dark:text-gray-600
            ]
          }
        end

        style :decorative do
          base {
            %w[
              select-none text-gray-400 bg-white border-gray-300
              dark:bg-gray-800 dark:border-gray-700 dark:text-gray-500
            ]
          }
        end

        style :icon do
          base { %w[ w-4 h-4 shrink-0 rtl:rotate-180 ] }
        end

        attr_reader :href, :label, :icon, :icon_position, :variant, :appearance, :position,
                    :width, :color, :size, :current

        def initialize(href: nil, label: nil, icon: nil, icon_only: false, icon_position: :leading,
                       variant: :cell, appearance: :idle, position: :none, width: :auto,
                       current: false, color: :pink, size: :md, **extra_attributes)
          @href = href
          @label = label
          @icon = icon
          @icon_only = icon_only
          @icon_position = icon_position
          @variant = variant.to_sym
          @appearance = appearance.to_sym
          @position = position.to_sym
          @width = width.to_sym
          @current = current
          @color = color.to_sym
          @size = size.to_sym

          raise ArgumentError, "Invalid variant #{variant}, must be one of #{VARIANTS.join(", ")}" unless VARIANTS.include?(@variant)
          raise ArgumentError, "Invalid appearance #{appearance}, must be one of #{APPEARANCES.join(", ")}" unless APPEARANCES.include?(@appearance)
          raise ArgumentError, "Invalid position #{position}, must be one of #{POSITIONS.join(", ")}" unless POSITIONS.include?(@position)
          raise ArgumentError, "Invalid width #{width}, must be one of #{WIDTHS.join(", ")}" unless WIDTHS.include?(@width)
          raise ArgumentError, "Invalid color #{color}, must be one of #{PALETTE.join(", ")}" unless PALETTE.include?(@color)
          raise ArgumentError, "Invalid size #{size}, must be one of #{SCALE.join(", ")}" unless SCALE.include?(@size)

          super(**extra_attributes)
        end

        def icon_only? = @icon_only && icon.present?

        def leading_icon? = icon.present? && icon_position == :leading

        def trailing_icon? = icon.present? && icon_position == :trailing

        def icon_tag
          render InkComponents::Icon::Component.new(name: icon, type: :outline, class: icon_classes)
        end

        private

        def tag_name = href.present? ? :a : :span

        def default_attributes
          { class: classes, href:, aria: aria_attributes }
        end

        def classes
          token_list(chrome_classes, style(:rounding, position:), appearance_classes)
        end

        def chrome_classes
          variant == :standalone ? style(:standalone, size:) : style(:cell, size:, width:)
        end

        def appearance_classes
          case appearance
          when :active then token_list(style(:active, color:), style(:focus, color:))
          when :muted then style(:muted)
          when :decorative then style(:decorative)
          else token_list(style(:idle), style(:hover, color:), style(:focus, color:))
          end
        end

        def aria_attributes
          {
            current: (current ? "page" : nil),
            disabled: (appearance == :muted ? true : nil),
            hidden: (appearance == :decorative ? true : nil)
          }
        end

        def icon_classes
          spacing = icon_only? ? nil : icon_spacing

          token_list(style(:icon), spacing)
        end

        def icon_spacing
          icon_position == :leading ? "me-1.5 -ms-0.5" : "ms-1.5 -me-0.5"
        end
      end
    end
  end
end
