# frozen_string_literal: true

module InkComponents
  module Modal
    class Preview < Lookbook::Preview
      # @param title text
      # @param size select { choices: [sm, md, lg, xl] }
      # @param body text
      # @param footer text
      def playground(id: "default-modal", title: "Título do modal", size: :md, body: "With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply.", footer: "Rodapé")
        modal_component(id:, size:) do |component|
          component.with_header { title }
          component.with_body { body }
          component.with_footer { footer }
        end
      end
    end
  end
end
