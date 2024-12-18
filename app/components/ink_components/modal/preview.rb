# frozen_string_literal: true

module InkComponents
  module Modal
    class Preview < Lookbook::Preview
      # @param content text
      # @param size select { choices: [sm, md, lg, xl] }
      def playground(content: "Título do modal", size: :md)
        modal_component(size:) do |component|
          component.with_header { content }
        end
      end
    end
  end
end
