# frozen_string_literal: true

module InkComponents
  module Breadcrumb
    class Preview < Lookbook::Preview
      # @param list_name text "Nomes das paginas separado po ",""
      # @param background select { choices: [transparent, solid]} "Defina o tipo do plano de fundo"
      def playground(list_name: "Home,Projects,InkComponents", background: "transparent")
        list_name = list_name.split(",")

        breadcrumb_component(background:) do |component|
          component.with_list do |list|
            list_name[0..-2].each do |name|
              list.with_item do |item|
                safe_join([
                  item.with_link do
                    name
                  end,
                  item.with_next_page
                ])
              end
            end
            list_name[-1..-1].each do |name|
              list.with_item do |item|
                safe_join([
                  item.with_link do
                    name
                  end
                ])
              end
            end
          end
        end
      end

      # @!group Exemplos
      def background_transparent
        breadcrumb_component(background: "transparent") do |component|
          component.with_list do |list|
            list.with_item do |item|
              safe_join([
                item.with_link do
                  "Home"
                end,
                item.with_next_page
              ])
            end
            list.with_item do |item|
              safe_join([
                item.with_link do
                  "InkComponents"
                end
              ])
            end
          end
        end
      end

      def background_solid
        breadcrumb_component(background: "") do |component|
          component.with_list do |list|
            list.with_item do |item|
              safe_join([
                item.with_link do
                  "Home"
                end,
                item.with_next_page
              ])
            end
            list.with_item do |item|
              safe_join([
                item.with_link do
                  "InkComponents"
                end
              ])
            end
          end
        end
      end

      def items_with_icons
        breadcrumb_component(background: "") do |component|
          component.with_list do |list|
            list.with_item do |item|
              safe_join([
                item.with_link do |link|
                  safe_join([
                    link.with_icon(name: :home, type: :solid, class: "h-3 w-3 mr-1"),
                    "Home"
                  ])
                end,
                item.with_next_page
              ])
            end
            list.with_item do |item|
              safe_join([
                item.with_link do |link|
                  safe_join([
                    link.with_icon(name: :book, type: :solid, class: "h-3 w-3 mr-1"),
                    "InkComponents"
                  ])
                end
              ])
            end
          end
        end
      end
      # @!endgroup
    end
  end
end
