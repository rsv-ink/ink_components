# frozen_string_literal: true

module InkComponents
  module Modal
    class Preview < Lookbook::Preview
      # @param title text
      # @param size select { choices: [sm, md, lg, xl] }
      # @param body text
      def playground(title: "Título do modal", size: :md, body: "Conteúdo do modal")
        modal_component(size:) do |component|
          component.with_header { title }
          component.with_body { body }
        end
      end
    end
  end
end
