# frozen_string_literal: true

module InkComponents
  module Icon
    class Component < ApplicationComponent
      attr_reader :name, :type, :extra_attributes

      def initialize(name:, type: :solid, **extra_attributes)
        @name = name.to_s.parameterize
        @type = type.to_s

        raise ArgumentError, "Invalid icon, #{name} with type #{type} does not exist" unless file_exists?

        super(**extra_attributes)
      end

      private

      def file_exists?
        InkComponents::Engine.root.join("app/assets/images", path).exist?
      end

      def path
        "ink_components/icons/#{type}/#{name}.svg"
      end
    end
  end
end
