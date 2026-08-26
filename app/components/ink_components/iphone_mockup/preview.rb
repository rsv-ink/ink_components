# frozen_string_literal: true

module InkComponents
  module IphoneMockup
    class Preview < Lookbook::Preview
      TEMPLATES = "previews/ink_components/iphone_mockup"

      # @param color select { choices: [space_black, black_dark, black_mid, deep_blue, silver] }
      # @param size select { choices: [sm, md, lg] }
      # @param home_indicator toggle
      # @param blank_screen toggle
      def playground(color: :space_black, size: :lg, home_indicator: true, blank_screen: false)
        render_with_template(
          template: "#{TEMPLATES}/playground",
          locals: { color:, size:, home_indicator:, blank_screen: }
        )
      end

      def default
        render_with_template(template: "#{TEMPLATES}/default")
      end

      # The slot is clipped to the screen box: any HTML fits.
      def custom_content
        render_with_template(template: "#{TEMPLATES}/custom_content")
      end

      # @!group Colors
      def space_black
        render_with_template(template: "#{TEMPLATES}/colors", locals: { color: :space_black })
      end

      def black_dark
        render_with_template(template: "#{TEMPLATES}/colors", locals: { color: :black_dark })
      end

      def black_mid
        render_with_template(template: "#{TEMPLATES}/colors", locals: { color: :black_mid })
      end

      def deep_blue
        render_with_template(template: "#{TEMPLATES}/colors", locals: { color: :deep_blue })
      end

      def silver
        render_with_template(template: "#{TEMPLATES}/colors", locals: { color: :silver })
      end
      # @!endgroup

      # @!group Sizes
      def small
        render_with_template(template: "#{TEMPLATES}/size", locals: { size: :sm })
      end

      def medium
        render_with_template(template: "#{TEMPLATES}/size", locals: { size: :md })
      end

      def large
        render_with_template(template: "#{TEMPLATES}/size", locals: { size: :lg })
      end
      # @!endgroup

      # @!group Home indicator
      def with_home_indicator
        render_with_template(template: "#{TEMPLATES}/home_indicator", locals: { home_indicator: true })
      end

      def without_home_indicator
        render_with_template(template: "#{TEMPLATES}/home_indicator", locals: { home_indicator: false })
      end
      # @!endgroup
    end
  end
end
