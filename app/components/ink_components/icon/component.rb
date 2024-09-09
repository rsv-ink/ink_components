# frozen_string_literal: true

module InkComponents
  module Icon
    class Component < ApplicationComponent
      attr_reader :name, :type, :extra_attributes

      def initialize(name:, type: :solid, **extra_attributes)
        @name = name.to_s
        @type = type.to_s

        super(**extra_attributes)
      end

      private

      def path
        "ink_components/icons/#{type}/#{name}"
      end
    end
  end
end
