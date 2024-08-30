module InkComponents
  module Example
    class Preview < ApplicationViewComponentPreview
      def default
        render InkComponents::Example::Component.new(size: :sm)
      end
    end
  end
end
