module InkComponents
  module Badge
    class Preview < Lookbook::Preview
      # @param content text
      # @param color select { choices: [pink, dark, blue, red, green, yellow, indigo, purple] }
      # @param size select { choices: [xs, sm] }
      def playground(content: "Some text", size: :sm, state: :default)
        render InkComponents::Badge::Component.new(size:, color:).with_content(content)
      end
    end
  end
end