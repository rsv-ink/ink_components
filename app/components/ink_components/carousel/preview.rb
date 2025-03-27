module InkComponents
  module Carousel
    class Preview < Lookbook::Preview
      # @param slider select { choices: [slide, static]} "Defina o tipo de transição"
      # @param indicators toggle "Indicadores de navegação"
      # @param prev_button toggle "Botão de navegação para a esquerda"
      # @param next_button toggle "Botão de navegação para a direita"
      # @param duration select { choices: [duration_0, duration_75, duration_100, duration_150, duration_200, duration_300, duration_500, duration_700, duration_1000] } "Duração da animação"
      # @param transition select { choices: [linear, ease_out, ease_in, in_out, initial] } "Tipo de transição"
      def playground(slider: "slide", indicators: true, prev_button: true, next_button: true, duration: "duration_700", transition: "in_out")
        render_with_template(template: "previews/ink_components/carousel/playground", locals: { slider:, prev_button:, next_button:, indicators:, duration:, transition: })
      end

      # @!group Examples
      def auto_slide
        render_with_template(template: "previews/ink_components/carousel/auto_slide")
      end

      def static
        render_with_template(template: "previews/ink_components/carousel/static")
      end

      def only_indicators
        render_with_template(template: "previews/ink_components/carousel/only_indicators")
      end

      def only_controls
        render_with_template(template: "previews/ink_components/carousel/only_controls")
      end
    end
  end
end
