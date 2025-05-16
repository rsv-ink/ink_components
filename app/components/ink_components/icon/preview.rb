module InkComponents
  module Icon
    class Preview < Lookbook::Preview
      # @!group Types
      # @param name select :icon_names "The icon name"
      def with_solid_type(name: :bell)
        render_with_template(template: "previews/ink_components/icon/solid", locals: { name: })
      end

      # @param name select :icon_names "The icon name"
      def with_outline_type(name: :bell)
        render_with_template(template: "previews/ink_components/icon/outline", locals: { name: })
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
