# frozen_string_literal: true

module InkComponents
  module Popover
    class Preview < Lookbook::Preview
      TEXT_BODY = "Este é um exemplo de popover. Ele pode conter qualquer tipo de conteúdo, como texto, imagens ou botões.".freeze

      # @param popover_id text "Id do popover"
      # @param text text "Título do popover"
      # @param body text "Corpo do popover"
      # @param display_arrow toggle "Exibir seta indicando o popover?"
      # @param placement select { choices: [top, right, bottom, left]} "Defina a posição do componente popover em relação ao elemento de gatilho"
      # @param trigger select { choices: [hover, click]} "Defina o evento de gatilho"
      # @param offset number "Aumente ou diminua o deslocamento padrão"
      def playground(popover_id: "playground-popover", text: "Título do Popover", body: TEXT_BODY, display_arrow: true, placement: :top, trigger: :hover, offset: nil)
        popover_component(id: popover_id, display_arrow:, class: "inline-block") do |component|
          component.with_button(data: {
            popover_target: popover_id,
            popover_placement: placement,
            popover_trigger: trigger,
            popover_offset: offset
          }, class: "mx-80 my-40") { "Abrir Popover" }
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
          if display_arrow
            component.with_arrow
          end
        end
      end

      # @!group Exemplos
      def default_popover
        popover_component(id: "default-popover", class: "flex flex-column") do |component|
          component.with_button(data: { popover_target: "default-popover" }, class: "m-auto") { "Mostrar Popover" }
          component.with_body do
            content_tag(:div, class: "px-3 py-2") { TEXT_BODY }
          end
          component.with_arrow
        end
      end

      def popover_with_title_and_body
        popover_component(id: "popover_with_title_and_body", display_arrow: true) do |component|
          component.with_button(data: { popover_target: "popover_with_title_and_body" }, class: "m-auto") { "Popover com titulo e corpo" }
          component.with_title do
            content_tag(:div, class: "px-3 py-2 bg-gray-100 border-b border-gray-200 rounded-t-lg dark:border-gray-600 dark:bg-gray-700") do
              content_tag(:h3, class: "font-semibold text-gray-900 dark:text-white") do
                "Titulo"
              end
            end
          end
          component.with_body do
            content_tag(:div, class: "px-3 py-2") { TEXT_BODY }
          end
          component.with_arrow
        end
      end

      def popover_about_italy
        popover_component(id: "popover_with_only_body", display_arrow: false) do |component|
          component.with_button(data: { popover_target: "popover_with_only_body" }, class: "m-auto") { "Popover imagem" }
          component.with_body do
            "<div class='grid grid-cols-3'>
              <div class='col-span-3 p-3'>
                <div class='space-y-2'>
                  <h3 class='font-semibold text-gray-900 dark:text-white'>About Italy</h3>
                  <p>Italy is located in the middle of the Mediterranean Sea, in Southern Europe it is also considered part of Western Europe. A unitary parliamentary republic with Rome as its capital and largest city.</p>
                  <a href='#' class='flex items-center font-medium text-blue-600 dark:text-blue-500 dark:hover:text-blue-600 hover:text-blue-700 hover:underline'>Read more</a>
                </div>
              </div>
            </div>".html_safe
          end
          component.with_arrow
        end
      end

      def popover_company_profile
        popover_component(id: "popover_company_profile", display_arrow: false) do |component|
          component.with_button(data: { popover_target: "popover_company_profile" }, class: "m-auto") { "Popover imagem" }
          component.with_body do
            "<div class='p-3'>
              <div class='flex'>
                <div class='me-3 shrink-0'>
                  <a href='#' class='block p-2 bg-gray-100 rounded-lg dark:bg-gray-700'>
                      <img class='w-8 h-8 rounded-full' src='https://flowbite.com/docs/images/logo.svg' alt='Flowbite logo'>
                  </a>
                </div>
                <div>
                  <p class='mb-1 text-base font-semibold leading-none text-gray-900 dark:text-white'>
                      <a href='#' class='hover:underline'>Flowbite</a>
                  </p>
                  <p class='mb-3 text-sm font-normal'>
                      Tech company
                  </p>
                  <p class='mb-4 text-sm'>Open-source library of Tailwind CSS components and Figma design system.</p>
                  <ul class='text-sm'>
                      <li class='flex items-center mb-2'>
                          <span class='me-2 font-semibold text-gray-400'>
                              <svg class='w-3.5 h-3.5' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 21 20'>
                                  <path stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M6.487 1.746c0 4.192 3.592 1.66 4.592 5.754 0 .828 1 1.5 2 1.5s2-.672 2-1.5a1.5 1.5 0 0 1 1.5-1.5h1.5m-16.02.471c4.02 2.248 1.776 4.216 4.878 5.645C10.18 13.61 9 19 9 19m9.366-6h-2.287a3 3 0 0 0-3 3v2m6-8a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z'/>
                              </svg>
                          </span>
                          <a href='#' class='text-blue-600 dark:text-blue-500 hover:underline'>https://flowbite.com/</a>
                      </li>
                      <li class='flex items-start mb-2'>
                          <span class='me-2 font-semibold text-gray-400'>
                              <svg class='w-3.5 h-3.5' aria-hidden='true' xmlns='http://www.w3.org/2000/svg' fill='currentColor' viewBox='0 0 20 18'>
                                  <path d='M17.947 2.053a5.209 5.209 0 0 0-3.793-1.53A6.414 6.414 0 0 0 10 2.311 6.482 6.482 0 0 0 5.824.5a5.2 5.2 0 0 0-3.8 1.521c-1.915 1.916-2.315 5.392.625 8.333l7 7a.5.5 0 0 0 .708 0l7-7a6.6 6.6 0 0 0 2.123-4.508 5.179 5.179 0 0 0-1.533-3.793Z'/>
                              </svg>
                          </span>
                          <span class='-mt-1'>4,567,346 people like this including 5 of your friends</span>
                      </li>
                  </ul>
                  <div class='flex mb-3 -space-x-3 rtl:space-x-reverse'>
                      <img class='w-8 h-8 border-2 border-white rounded-full dark:border-gray-800' src='https://flowbite.com/docs/images/people/profile-picture-5.jpg' alt=''>
                      <img class='w-8 h-8 border-2 border-white rounded-full dark:border-gray-800' src='https://flowbite.com/docs/images/people/profile-picture-2.jpg' alt=''>
                      <img class='w-8 h-8 border-2 border-white rounded-full dark:border-gray-800' src='https://flowbite.com/docs/images/people/profile-picture-3.jpg' alt=''>
                      <a class='flex items-center justify-center w-8 h-8 text-xs font-medium text-white bg-gray-400 border-2 border-white rounded-full hover:bg-gray-500 dark:border-gray-800' href='#'>+3</a>
                  </div>
                </div>
              </div>
            </div>".html_safe
          end
        end
        component.with_arrow
      end
      # @!endgroup
    end
  end
end
