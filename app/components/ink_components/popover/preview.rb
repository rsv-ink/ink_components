# frozen_string_literal: true

module InkComponents
  module Popover
    class Preview < Lookbook::Preview
      TEXT_BODY = "Este é um exemplo de popover. Ele pode conter qualquer tipo de conteúdo, como texto, imagens ou botões.".freeze

      # @param popover_id text "Id do popover"
      # @param text text "Título do popover"
      # @param body text "Corpo do popover"
      # @param display_arrow toggle "Exibir seta indicando o popover?"
      # @param placement select { choices: [top, right, bottom, left]}
      def playground(popover_id: "playground-popover", text: "Título do Popover", body: TEXT_BODY, display_arrow: true, placement: :top)
        popover_component(id: popover_id, display_arrow:, class: "inline-block") do |component|
          component.with_button(data: { popover_target: popover_id, popover_placement: placement }, class: "mx-80 my-40") { "Abrir Popover" }
          component.with_title do
            content_tag(:div, class: "px-3 py-2 bg-gray-100 border-b border-gray-200 rounded-t-lg dark:border-gray-600 dark:bg-gray-700") do
              content_tag(:h3, class: "font-semibold text-gray-900 dark:text-white") do
                text
              end
            end
          end
          component.with_body do
            content_tag(:div, class: "px-3 py-2") { text }
          end
        end
      end

      # @!group Exemplos
      def default_popover
        popover_component(id: "default-popover", class: "flex flex-column") do |component|
          component.with_button(data: { popover_target: "default-popover" }, class: "m-auto") { "Mostrar Popover" }
          component.with_title do
            content_tag(:div, class: "px-3 py-2 bg-gray-100 border-b border-gray-200 rounded-t-lg dark:border-gray-600 dark:bg-gray-700") do
              content_tag(:h3, class: "font-semibold text-gray-900 dark:text-white") do
                "Título Padrão"
              end
            end
          end
          component.with_body do
            content_tag(:div, class: "px-3 py-2") { TEXT_BODY }
          end
        end
      end

      def popover_com_seta
        popover_component(id: "arrow-popover", display_arrow: true) do |component|
          component.with_button(data: { popover_target: "arrow-popover" }, class: "m-auto") { "Popover com seta" }
          component.with_title do
            content_tag(:div, class: "px-3 py-2 bg-gray-100 border-b border-gray-200 rounded-t-lg dark:border-gray-600 dark:bg-gray-700") do
              content_tag(:h3, class: "font-semibold text-gray-900 dark:text-white") do
                "Popover com seta"
              end
            end
          end
          component.with_body do
            content_tag(:div, class: "px-3 py-2") { TEXT_BODY }
          end
        end
      end

      def popover_sem_seta
        popover_component(id: "no-arrow-popover", display_arrow: false) do |component|
          component.with_button(data: { popover_target: "no-arrow-popover" }, class: "m-auto") { "Popover sem seta" }
          component.with_title do
            content_tag(:div, class: "px-3 py-2 bg-gray-100 border-b border-gray-200 rounded-t-lg dark:border-gray-600 dark:bg-gray-700") do
              content_tag(:h3, class: "font-semibold text-gray-900 dark:text-white") do
                "Popover sem seta"
              end
            end
          end
          component.with_body do
            content_tag(:div, class: "px-3 py-2") { TEXT_BODY }
          end
        end
      end
      # @!endgroup
    end
  end
end
