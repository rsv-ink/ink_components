# frozen_string_literal: true

module InkComponents
  module AvatarCollection
    class Component < ApplicationComponent
      renders_many :avatars, Avatar::Component

      style do
        base { "flex -space-x-4 rtl:space-x-reverse" }
      end

      private
      def default_attributes
        { class: style }
      end

      def render?
        avatars.any?
      end
    end
  end
end
