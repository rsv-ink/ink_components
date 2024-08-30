module InkComponents
  module Example
    class Preview < Lookbook::Preview
      def default
        render InkComponents::Example::Component.new(size: :sm)
      end
    end
  end
end
