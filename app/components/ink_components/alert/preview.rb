# frozen_string_literal: true

module InkComponents
  module Alert
    class Preview < Lookbook::Preview
      # @param content text
      # @param title text
      # @param body text
      # @param actions text
      # @param state select { choices: [info, success, danger, warning, dark] }
      # @param bordered toggle
      # @param bordered_accent toggle
      # @param dismissable toggle
      def playground(
        state: :info,
        bordered: false,
        bordered_accent: false,
        dismissable: false,
        content: "Write some text here",
        title: nil,
        body: nil,
        actions: nil
        )
        render(InkComponents::Alert::Component.new(state:, bordered:, bordered_accent:, dismissable:, id: "some-id")) do |component|
          component.with_title { title }
          component.with_body { body }
          component.with_actions { actions }
          content
        end
      end

      # @!group States
      def info
        render InkComponents::Alert::Component.new(state: :info) do
          "<span class='font-medium'>Info alert!</span> Change a few things up and try submitting again.".html_safe
        end
      end

      def success
        render InkComponents::Alert::Component.new(state: :success) do
          "<span class='font-medium'>Success alert!</span> Change a few things up and try submitting again.".html_safe
        end
      end

      def danger
        render InkComponents::Alert::Component.new(state: :danger) do
          "<span class='font-medium'>Danger alert!</span> Change a few things up and try submitting again.".html_safe
        end
      end

      def warning
        render InkComponents::Alert::Component.new(state: :warning) do
          "<span class='font-medium'>Warning alert!</span> Change a few things up and try submitting again.".html_safe
        end
      end

      def dark
        render InkComponents::Alert::Component.new(state: :dark) do
          "<span class='font-medium'>Dark alert!</span> Change a few things up and try submitting again.".html_safe
        end
      end
      # @!endgroup

      # @!group Borders
      def with_border
        render InkComponents::Alert::Component.new(bordered: true) do
          "Info alert! Change a few things up and try submitting again."
        end
      end

      def with_accent_border
        render InkComponents::Alert::Component.new(bordered_accent: true) do
          "Info alert! Change a few things up and try submitting again."
        end
      end
      # @!endgroup

      def with_dismissable_button
        render InkComponents::Alert::Component.new(id: "some-id", dismissable: true) do
          "Info alert! Change a few things up and try submitting again."
        end
      end

      def title_body_and_actions
        render InkComponents::Alert::Component.new do |component|
          component.with_title { "This is a info alert" }
          component.with_body do
            "More info about this info alert goes here.
            This example text is going to run a bit longer so that you can see
            how spacing within an alert works with this kind of content."
          end
          component.with_actions do
            '<button type="button" class="text-white bg-pink-800 hover:bg-pink-900 focus:ring-4
            focus:outline-none focus:ring-pink-200 font-medium rounded-lg text-xs
            px-3 py-1.5 me-2 text-center inline-flex items-center dark:bg-pink-600
            dark:hover:bg-pink-700 dark:focus:ring-pink-800">View more</button>'.html_safe
          end
        end
      end
    end
  end
end
