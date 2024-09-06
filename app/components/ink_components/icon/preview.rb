module InkComponents
  module Icon
    class Preview < Lookbook::Preview
      # @!group Types
      def with_solid_type
        render InkComponents::Icon::Component.new(name: :bell, class: "w-6 h-6 fill-gray-500")
      end

      def with_outline_type
        render InkComponents::Icon::Component.new(name: :bell, type: :outline, class: "w-6 h-6 text-gray-500")
      end
      # @!endgroup
    end
  end
end
