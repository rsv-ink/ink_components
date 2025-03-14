# frozen_string_literal: true

module InkComponents
  module Accordion
    class Preview < Lookbook::Preview
      def playground
        accordion_component(flush: true) do |component|
          component.with_section(data_target: "section-1", position: :first) do |section|
            section.with_header { "Header 1" }
            section.with_body { "nao sei" }
          end

          component.with_section(data_target: "section-2") do |section|
            section.with_header { "Header 2" }
            section.with_body { "nao sei de novo" }
          end

          component.with_section(data_target: "section-3", position: :last) do |section|
            section.with_header { "Header 3" }
            section.with_body { "nao sei de novo e de novo" }
          end
        end
      end

      def default
        accordion_component do |component|
          component.with_section(data_target: "section-1", expanded: true, position: :first) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end

          component.with_section(data_target: "section-2") do |section|
            section.with_header { "Is there a Figma file available?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is first conceptualized and designed using the Figma software so everything you see in the library has a design equivalent in our Figma file."
              end
            end
          end

          component.with_section(data_target: "section-3", position: :last) do |section|
            section.with_header { "What are the differences between Flowbite and Tailwind UI?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "The main difference is that the core components from Flowbite are open source under the MIT license, whereas Tailwind UI is a paid product. Another difference is that Flowbite relies on smaller and standalone components, whereas Tailwind UI offers sections of pages."
              end
            end
          end
        end
      end

      def always_open
        accordion_component(data_accordion: :open) do |component|
          component.with_section(data_target: "section-1", expanded: true, position: :first) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end

          component.with_section(data_target: "section-2") do |section|
            section.with_header { "Is there a Figma file available?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is first conceptualized and designed using the Figma software so everything you see in the library has a design equivalent in our Figma file."
              end
            end
          end

          component.with_section(data_target: "section-3", position: :last) do |section|
            section.with_header { "What are the differences between Flowbite and Tailwind UI?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "The main difference is that the core components from Flowbite are open source under the MIT license, whereas Tailwind UI is a paid product. Another difference is that Flowbite relies on smaller and standalone components, whereas Tailwind UI offers sections of pages."
              end
            end
          end
        end
      end

      def flush
        accordion_component(flush: true) do |component|
          component.with_section(data_target: "section-1", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end

          component.with_section(data_target: "section-2") do |section|
            section.with_header { "Is there a Figma file available?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is first conceptualized and designed using the Figma software so everything you see in the library has a design equivalent in our Figma file."
              end
            end
          end

          component.with_section(data_target: "section-3") do |section|
            section.with_header { "What are the differences between Flowbite and Tailwind UI?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "The main difference is that the core components from Flowbite are open source under the MIT license, whereas Tailwind UI is a paid product. Another difference is that Flowbite relies on smaller and standalone components, whereas Tailwind UI offers sections of pages."
              end
            end
          end
        end
      end
    end
  end
end
