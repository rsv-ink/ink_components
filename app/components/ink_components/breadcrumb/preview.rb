# frozen_string_literal: true

module InkComponents
  module Breadcrumb
    class Preview < Lookbook::Preview
      # @param list_name text "Nomes das paginas separado po ",""
      # @param background select { choices: [transparent, solid]} "Defina o tipo do plano de fundo"
      def playground(list_name: "Home,Projects,InkComponents", background: :transparent)
        list_name = list_name.split(",")

        render_with_template(template: "previews/ink_components/breadcrumb/playground", locals: { list_name:, background: })
      end

      # @!group Exemplos
      def background_transparent
        render_with_template(template: "previews/ink_components/breadcrumb/background_transparent")
      end

      def background_solid
        render_with_template(template: "previews/ink_components/breadcrumb/background_solid")
      end

      def items_with_icons
        render_with_template(template: "previews/ink_components/breadcrumb/items_with_icons")
      end
      # @!endgroup
    end
  end
end
