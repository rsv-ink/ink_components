# frozen_string_literal: true

module InkComponents
  module Icon
    class Component < ApplicationComponent
      attr_reader :name, :type, :extra_attributes

      def initialize(name:, type: :solid, **extra_attributes)
        if file_exists?(name, type)
          @name = name.to_s
          @type = type.to_s

          super(**extra_attributes)
        else
          raise ArgumentError, "Invalid icon, #{name} with type #{type} does not exist"
        end
      end

      private

      def file_exists?(name, type)
        file_path = InkComponents::Engine.root.join("app/assets/images/#{path(name, type)}")
        File.exist?(file_path)
      end

      def path(name, type)
        "ink_components/icons/#{type}/#{name}.svg"
      end
    end
  end
end
