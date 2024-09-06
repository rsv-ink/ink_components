# frozen_string_literal: true

module InkComponents
  module Icon
    class Component < ViewComponent::Base
      attr_reader :name, :type, :options

      def initialize(name:, type: :solid, **options)
        @name = name.to_s
        @type = type.to_s
        @options = options
      end

      private

      def path
        "ink_components/icons/#{type}/#{name}"
      end
    end
  end
end
