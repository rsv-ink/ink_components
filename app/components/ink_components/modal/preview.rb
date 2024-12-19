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

      # @!group Sizes
      def small
        modal_component(id: "small-modal", size: :sm) do |component|
          component.with_header { "Small" }
          component.with_body { "With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply." }
          component.with_footer { "Rodapé" }
        end
      end

      def medium
        modal_component(id: "medium-modal", size: :md) do |component|
          component.with_header { "Medium" }
          component.with_body { "With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply." }
          component.with_footer { "Rodapé" }
        end
      end

      def large
        modal_component(id: "large-modal", size: :lg) do |component|
          component.with_header { "Large" }
          component.with_body { "With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply." }
          component.with_footer { "Rodapé" }
        end
      end

      def extra_large
        modal_component(id: "extra-large-modal", size: :xl) do |component|
          component.with_header { "Extra Large" }
          component.with_body { "With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply." }
          component.with_footer { "Rodapé" }
        end
      end
      # @!endgroup
    end
  end
end
