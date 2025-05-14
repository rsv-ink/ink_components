# frozen_string_literal: true

module InkComponents
  module Accordion
    class Preview < Lookbook::Preview
      def default
        accordion_component do |component|
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

      def always_open
        accordion_component(data_accordion: :open) do |component|
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

      # @!group Colors
      def blue
        accordion_component(color: :blue) do |component|
          component.with_section(data_target: "section-1", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end

      def pink
        accordion_component(color: :pink) do |component|
          component.with_section(data_target: "section-2", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end

      def green
        accordion_component(color: :green) do |component|
          component.with_section(data_target: "section-3", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end

      def red
        accordion_component(color: :red) do |component|
          component.with_section(data_target: "section-4", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end

      def purple
        accordion_component(color: :purple) do |component|
          component.with_section(data_target: "section-5", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end

      def orange
        accordion_component(color: :orange) do |component|
          component.with_section(data_target: "section-6", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end

      def yellow
        accordion_component(color: :yellow) do |component|
          component.with_section(data_target: "section-7", expanded: true) do |section|
            section.with_header { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
              end
            end
          end
        end
      end
      # @!endgroup

      # @param color select { choices: [gray, pink, green, red, purple, orange, yellow, blue] }
      def flush(color: :gray)
        accordion_component(flush: true, color: color) do |component|
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

      def arrow_style
        accordion_component do |component|
          component.with_section(data_target: "section-1", expanded: true) do |section|
            section.with_header(has_arrow: false) { "What is Flowbite?" }
            section.with_body do |body|
              body.content_tag :p, class: "mb-2 text-gray-500 dark:text-gray-400" do
                "Flowbite is an open-source library of interactive components built on top of Tailwind CSS including buttons, dropdowns, modals, navbars, and more."
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
