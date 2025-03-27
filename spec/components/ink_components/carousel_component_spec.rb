# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Carousel::Component, type: :component do
  context "when carousel items are provided" do
    context "with a single item" do
      it "renders the carousel with one item" do
        component = render_inline(described_class.new(id: "carousel")) do |carousel|
          carousel.with_wrapper do |wrapper|
            wrapper.with_item do |item|
              "Item 1"
            end
          end
        end

        expect(component.to_html).to include("Item 1")
      end
    end

    context "with multiple items" do
      it "renders the carousel with multiple items" do
        component = render_inline(described_class.new(id: "carousel")) do |carousel|
          carousel.with_wrapper do |wrapper|
            wrapper.with_item do |item|
              "Item 1"
            end
            wrapper.with_item do |item|
              "Item 2"
            end
          end
        end

        expect(component.to_html).to include("Item 1")
        expect(component.to_html).to include("Item 2")
      end

      context "with indicators" do
        it "renders the carousel with indicators" do
          component = render_inline(described_class.new(id: "carousel", indicators: true)) do |carousel|
            carousel.with_wrapper do |wrapper|
              wrapper.with_item do |item|
                "Item 1"
              end
              wrapper.with_item do |item|
                "Item 2"
              end
            end
            carousel.with_indicators_container do |indicators|
              2.times do |index|
                indicators.with_item(index:)
                indicators.with_item(index:)
              end
            end
          end

          expect(component.to_html).to include("Item 1")
          expect(component.to_html).to include("Item 2")
          expect(component.to_html).to include("aria-label=\"Slide 0\"")
          expect(component.to_html).to include("aria-label=\"Slide 1\"")
        end
      end

      context "with controls" do
        it "renders the carousel with controls" do
          component = render_inline(described_class.new(id: "carousel", controls: true)) do |carousel|
            carousel.with_wrapper do |wrapper|
              wrapper.with_item do |item|
                "Item 1"
              end
              wrapper.with_item do |item|
                "Item 2"
              end
            end
            carousel.with_prev_button
            carousel.with_next_button
          end

          expect(component.to_html).to include("Item 1")
          expect(component.to_html).to include("Item 2")
          expect(component.to_html).to include("data-carousel-prev")
          expect(component.to_html).to include("data-carousel-next")
        end

        it "renders the carousel with controls and indicators" do
          component = render_inline(described_class.new(id: "carousel", controls: true, indicators: true)) do |carousel|
            carousel.with_wrapper do |wrapper|
              wrapper.with_item do |item|
                "Item 1"
              end
              wrapper.with_item do |item|
                "Item 2"
              end
            end
            carousel.with_prev_button
            carousel.with_next_button
            carousel.with_indicators_container do |indicators|
              2.times do |index|
                indicators.with_item(index:)
              end
            end
          end

          expect(component.to_html).to include("Item 1")
          expect(component.to_html).to include("Item 2")
          expect(component.to_html).to include("data-carousel-prev")
          expect(component.to_html).to include("data-carousel-next")
          expect(component.to_html).to include("aria-label=\"Slide 0\"")
          expect(component.to_html).to include("aria-label=\"Slide 1\"")
        end
      end
    end
  end
end
