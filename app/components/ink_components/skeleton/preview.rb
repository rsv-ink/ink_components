# frozen_string_literal: true

module InkComponents
  module Skeleton
    class Preview < Lookbook::Preview
      # @param loading toggle
      def playground(loading: true)
        render_with_template(template: "previews/ink_components/skeleton/playground", locals: { loading: })
      end

      # @param loading toggle
      def image_placeholder(loading: true)
        render_with_template(template: "previews/ink_components/skeleton/image_placeholder", locals: { loading: })
      end
    end
  end
end
