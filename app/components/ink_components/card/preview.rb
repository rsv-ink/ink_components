module InkComponents
  module Card
    class Preview < Lookbook::Preview
      # @param orientation select { choices: [vertical, horizontal] }
      def playground(orientation: :vertical)
        render InkComponents::Card::Component.new(orientation:) do
          tag.p "Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.", class: "font-normal text-gray-700 dark:text-gray-400"
        end
      end

      # @!group Orientations
      def vertical_orientation
        render InkComponents::Card::Component.new(orientation: :vertical) do
          tag.p "Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.", class: "font-normal text-gray-700 dark:text-gray-400"
        end
      end

      def horizontal_orientation
        render InkComponents::Card::Component.new(orientation: :horizontal) do
          tag.p "Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.", class: "font-normal text-gray-700 dark:text-gray-400"
        end
      end
      # @!endgroup
    end
  end
end
