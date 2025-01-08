# frozen_string_literal: true

module InkComponents
  module Modal
    class Preview < Lookbook::Preview
      TEXT_BODY = "Nossas camisetas são de excelência em algodão brasileiro, ideais para todos os climas. Todas as cores são 100% algodão; exceto cinzas: 88% algodão e 12% poliéster.".freeze
      # @param modal_id text
      # @param title text
      # @param width text
      # @param max_width select { choices: [ sm, md, lg, xl] }
      # @param body text
      # @param footer text
      # @param type select { choices: [default, static] }
      # @param placement select { choices: [center, top_left, top_right, bottom_left, bottom_right] }
      def playground(modal_id: "default-modal", type: :default, title: "Título do modal", width: "516px", placement: :center, max_width: :md, body: TEXT_BODY, footer: "Rodapé")
        modal_component(modal_id:, max_width:, width:, type:, placement:) do |component|
          component.with_header(modal_id:, title:)
          component.with_body { body }
          component.with_footer do
            content_tag :div, class: "w-full flex justify-start items-center p-4" do
              content_tag(:button, "Fechar", type: "button", class: "focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm", data: { modal_hide: modal_id })
            end
          end
        end
      end

      # @!group Types
      def default_modal
        modal_component(modal_id: "default-modal", width: "516px", max_width: :md) do |component|
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
        modal_component(modal_id: "static-modal", width: "516px", max_width: :md, type: :static) do |component|
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
        modal_component(modal_id: "popup-modal", width: "516px", max_width: :md) do |component|
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
        modal_component(modal_id: "small-modal", width: "516px", max_width: :sm) do |component|
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
        modal_component(modal_id: "medium-modal", width: "516px", max_width: :md) do |component|
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
        modal_component(modal_id: "large-modal", width: "516px", max_width: :lg) do |component|
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
        modal_component(modal_id: "extra-large-modal", width: "516px", max_width: :xl) do |component|
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

      # @!group Placement
      def center
        modal_component(modal_id: "center-modal", max_width: :md) do |component|
          component.with_header(modal_id: "center-modal", title: "Center")
          component.with_body { TEXT_BODY }
        end
      end

      def top_left
        modal_component(modal_id: "top-left-modal", max_width: :md, placement: :top_left) do |component|
          component.with_header(modal_id: "top-left-modal", title: "Top Left")
          component.with_body { TEXT_BODY }
        end
      end

      def top_right
        modal_component(modal_id: "top-right-modal", max_width: :md, placement: :top_right) do |component|
          component.with_header(modal_id: "top-right-modal", title: "Top Right")
          component.with_body { TEXT_BODY }
        end
      end

      def bottom_left
        modal_component(modal_id: "bottom-left-modal", max_width: :md, placement: :bottom_left) do |component|
          component.with_header(modal_id: "bottom-left-modal", title: "Bottom Left")
          component.with_body { TEXT_BODY }
        end
      end

      def bottom_right
        modal_component(modal_id: "bottom-right-modal", max_width: :md, placement: :bottom_right) do |component|
          component.with_header(modal_id: "bottom-right-modal", title: "Bottom Right")
          component.with_body { TEXT_BODY }
        end
      end
      # @!endgroup

      # @!group Builders
      def body_to_builder
        modal_component(modal_id: "body-modal", width: "516px", max_width: :md) do |component|
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
        modal_component(modal_id: "footer-modal", width: "516px", max_width: :md) do |component|
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
