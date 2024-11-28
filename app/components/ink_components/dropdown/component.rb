# frozen_string_literal: true

module InkComponents
  module Dropdown
    class Component < ApplicationComponent
      style do
        base { %w[ z-20 hidden bg-white rounded-lg shadow dark:bg-gray-700 pb-1 ] }
      end

      renders_one :button, lambda { |data: {}, **extra_attributes|
        InkComponents::Button::Component.new(
          data: data.merge({
            dropdown_toggle: dropdown_toggle_id
          }),
          **extra_attributes
        )
      }

      renders_many :elements, types: {
        header: { renders: InkComponents::Dropdown::Header::Component, as: :header },
        item: { renders: InkComponents::Dropdown::Item::Component, as: :item },
        divider: { renders: InkComponents::Dropdown::Divider::Component, as: :divider }
      }

      attr_reader :dropdown_toggle_id

      def initialize(dropdown_toggle_id:, **extra_attributes)
        @dropdown_toggle_id = dropdown_toggle_id

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
