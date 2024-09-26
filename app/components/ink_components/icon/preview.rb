module InkComponents
  module Icon
    class Preview < Lookbook::Preview
      # @!group Types
      # @param name select :icon_names "The icon name"
      def with_solid_type(name: :bell)
        render InkComponents::Icon::Component.new(name:, class: "w-6 h-6 fill-gray-500")
      end

      # @param name select :icon_names "The icon name"
      def with_outline_type(name: :bell)
        render InkComponents::Icon::Component.new(name:, type: :outline, class: "w-6 h-6 text-gray-500")
      end
      # @!endgroup

      private
      def icon_names
        solid = list_icon_names("#{InkComponents::Engine.root}/app/assets/images/ink_components/icons/solid/*.svg")
        outline = list_icon_names("#{InkComponents::Engine.root}/app/assets/images/ink_components/icons/outline/*.svg")

        solid + outline
      end

      def list_icon_names(path)
        Dir.glob(path).map do |file|
          File.basename(file, ".svg")
        end
      end
    end
  end
end
