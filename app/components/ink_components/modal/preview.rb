# frozen_string_literal: true

module InkComponents
  module Modal
    class Preview < Lookbook::Preview
      TEXT_BODY = "Nossas camisetas são de excelência em algodão brasileiro, ideais para todos os climas. Todas as cores são 100% algodão; exceto cinzas: 88% algodão e 12% poliéster.".freeze
      # @param id text
      # @param title text
      # @param size select { choices: [sm, md, lg, xl] }
      # @param body text
      # @param footer text
      # @param type select { choices: [default, static] }
      def playground(id: "default-modal", type: :default, title: "Título do modal", size: :md, body: TEXT_BODY, footer: "Rodapé")
        modal_component(id:, size:, type:) do |component|
          component.with_header(modal_id: id, title:)
          component.with_body { body }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-start items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: id })
            end
          end
        end
      end

      # @!group Types
      def default_modal
        modal_component(id: "default-modal", size: :md) do |component|
          component.with_header(modal_id: "default-modal", title: "Default")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-start items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "default-modal" })
            end
          end
        end
      end

      def static_modal
        modal_component(id: "static-modal", size: :md, type: :static) do |component|
          component.with_header(modal_id: "static-modal", title: "Static")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-start items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "static-modal" })
            end
          end
        end
      end

      def popup_modal
        modal_component(id: "popup-modal", size: :md) do |component|
          component.with_header(modal_id: "popup-modal", title: "Popup")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-center items-center p-4 gap-2" do
              content_tag(:button, "Aceitar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-red-600 hover:bg-red-800 focus:ring-pink-300 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "popup-modal" }) +
              content_tag(:button, "Declinar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-gray-600 hover:bg-gray-800 focus:ring-gray-300 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "popup-modal" })
            end
          end
        end
      end
      # @!endgroup

      # @!group Sizes
      def small
        modal_component(id: "small-modal", size: :sm) do |component|
          component.with_header(modal_id: "small-modal", title: "Small")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-end items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "static-modal" })
            end
          end
        end
      end

      def default
        modal_component(id: "medium-modal", size: :md) do |component|
          component.with_header(modal_id: "medium-modal", title: "Medium")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-end items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "static-modal" })
            end
          end
        end
      end

      def large
        modal_component(id: "large-modal", size: :lg) do |component|
          component.with_header(modal_id: "large-modal", title: "Large")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-end items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "static-modal" })
            end
          end
        end
      end

      def extra_large
        modal_component(id: "extra-large-modal", size: :xl) do |component|
          component.with_header(modal_id: "extra-large-modal", title: "Extra large")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-end items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "static-modal" })
            end
          end
        end
      end
      # @!endgroup

      # @!group Builders
      def body_to_builder
        modal_component(id: "body-modal", size: :md) do |component|
          component.with_header(modal_id: "body-modal", title: "Modal com Body Personalizado")
          component.with_body do
            content_tag :div, class: "w-full" do
              content_tag :div, class: "w-full grid grid-cols-2 gap-2" do
                content_tag(:div, class: "flex flex-col gap-2") do
                  content_tag(:label, "Nome", class: "text-sm font-medium text-gray-900 dark:text-white") +
                  content_tag(:input, nil, type: "text", class: "border-gray-300 rounded-lg px-3 py-2.5 text-sm focus:ring-4 focus:outline-none", placeholder: "João das Neves")
                end +
                content_tag(:div, class: "flex flex-col gap-2") do
                  content_tag(:label, "Idade", class: "text-sm font-medium text-gray-900 dark:text-white") +
                  content_tag(:input, nil, type: "text", class: "border-gray-300 rounded-lg px-3 py-2.5 text-sm focus:ring-4 focus:outline-none", placeholder: "34")
                end
              end
            end
          end
        end
      end

      def footer_to_builder
        modal_component(id: "footer-modal", size: :md) do |component|
          component.with_header(modal_id: "footer-modal", title: "Modal com Footer Personalizado")
          component.with_body { TEXT_BODY }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-end items-center p-4" do
              content_tag(:button, "Salvar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: "footer-modal" })
            end
          end
        end
      end
      # @!endgroup
    end
  end
end
