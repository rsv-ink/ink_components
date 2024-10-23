# frozen_string_literal: true

module InkComponents
  module ProgressBar
    class Preview < Lookbook::Preview
      # @param content text
      # @param progress number
      # @param progress_position select { choices: [none, inside, top] }
      # @param size select { choices: [sm, md, lg, xl] }
      # @param color select { choices: [pink, dark, blue, red, green, yellow, indigo, purple] }
      def playground(size: :md, color: :pink, progress: 45, progress_position: :inside, content: nil)
        progress_bar_component(size:, color:, progress:, progress_position:) { content }
      end

      # @!group Sizes
      def small
        progress_bar_component(size: :sm, progress: 45)
      end

      def medium
        progress_bar_component(size: :md, progress: 45)
      end

      def large
        progress_bar_component(size: :lg, progress: 45)
      end

      def extra_large
        progress_bar_component(size: :xl, progress: 45)
      end
      # @!endgroup

      # @!group Colors
      def dark
        progress_bar_component(color: :dark, progress: 45)
      end

      def blue
        progress_bar_component(color: :blue, progress: 45)
      end

      def red
        progress_bar_component(color: :red, progress: 45)
      end

      def green
        progress_bar_component(color: :green, progress: 45)
      end

      def yellow
        progress_bar_component(color: :yellow, progress: 45)
      end

      def indigo
        progress_bar_component(color: :indigo, progress: 45)
      end

      def purple
        progress_bar_component(color: :purple, progress: 45)
      end
      # @!endgroup

      # @!group Progress Positions
      # @label Inside (In this option, the progress bar size remains fixed)
      def inside
        progress_bar_component(progress_position: :inside, progress: 45)
      end

      def top
        progress_bar_component(progress_position: :top, progress: 45) { "Progress" }
      end
      # @!endgroup
    end
  end
end
