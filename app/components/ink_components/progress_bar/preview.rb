# frozen_string_literal: true

module InkComponents
  module ProgressBar
    class Preview < Lookbook::Preview
      # @param progress number
      # @param progress_position select { choices: [none, inside, top] }
      # @param size select { choices: [sm, md, lg, xl] }
      # @param color select { choices: [pink, dark, blue, red, green, yellow, indigo, purple] }
      def playground(size: :md, color: :pink, progress: 45, progress_position: :inside)
        render InkComponents::ProgressBar::Component.new(size:, color:, progress:, progress_position:)
      end

      # @!group Sizes
      def small
        render InkComponents::ProgressBar::Component.new(size: :sm, progress: 45)
      end

      def medium
        render InkComponents::ProgressBar::Component.new(size: :md, progress: 45)
      end

      def large
        render InkComponents::ProgressBar::Component.new(size: :lg, progress: 45)
      end

      def extra_large
        render InkComponents::ProgressBar::Component.new(size: :xl, progress: 45)
      end
      # @!endgroup

      # @!group Colors
      def dark
        render InkComponents::ProgressBar::Component.new(color: :dark, progress: 45)
      end

      def blue
        render InkComponents::ProgressBar::Component.new(color: :blue, progress: 45)
      end

      def red
        render InkComponents::ProgressBar::Component.new(color: :red, progress: 45)
      end

      def green
        render InkComponents::ProgressBar::Component.new(color: :green, progress: 45)
      end

      def yellow
        render InkComponents::ProgressBar::Component.new(color: :yellow, progress: 45)
      end

      def indigo
        render InkComponents::ProgressBar::Component.new(color: :indigo, progress: 45)
      end

      def purple
        render InkComponents::ProgressBar::Component.new(color: :purple, progress: 45)
      end
      # @!endgroup

      # @!group Progress Positions
      # @label Inside (In this option, the progress bar size remains fixed, with "md" set as the default.)
      def inside
        render InkComponents::ProgressBar::Component.new(progress_position: :inside, progress: 45)
      end

      def top
        render InkComponents::ProgressBar::Component.new(progress_position: :top, progress: 45)
      end
      # @!endgroup
    end
  end
end
