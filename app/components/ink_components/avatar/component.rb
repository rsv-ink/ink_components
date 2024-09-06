# frozen_string_literal: true

module InkComponents
  module Avatar
    class Component < ViewComponent::Base
      include ViewComponentContrib::StyleVariants

      style do
        variants {
          shape {
            circle { "rounded-full" }
            square { "rounded" }
          }
          size {
            xs { "w-6 h-6" }
            sm { "w-8 h-8" }
            md { "w-10 h-10" }
            lg { "w-12 h-12" }
            xl { "w-16 h-16" }
          }
          bordered {
            true.to_sym { "ring-2 ring-gray-300" }
            false.to_sym { "" }
          }
        }
        defaults { { size: :md } }
      end

      attr_reader :size, :shape, :bordered, :image_url, :name_abbreviation

      def initialize(size: nil, shape: nil, bordered: false, image_url: nil, name_abbreviation: nil)
        @size = size
        @shape = shape
        @bordered = bordered
        @image_url = image_url
        @name_abbreviation = name_abbreviation
      end
    end
  end
end
