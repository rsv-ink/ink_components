# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Modal::Component, type: :component do
  context "when has a header" do
    it "renders the component" do
      component = render_inline(described_class.new(modal_id: "default-modal", max_width: :md)) do |modal|
        modal.with_header(modal_id: "default-modal", title: "Modal Title")
      end

      expect(component.to_html).to include("Modal Title")
    end
  end

  context "when has a body" do
    it "renders the component" do
      component = render_inline(described_class.new(modal_id: "default-modal", max_width: :md)) do |modal|
        modal.with_body { "Modal Body Content" }
      end

      expect(component.to_html).to include("Modal Body Content")
    end
  end

  context "when has a footer" do
    it "renders the component" do
      component = render_inline(described_class.new(modal_id: "default-modal", max_width: :md)) do |modal|
        modal.with_footer { "Modal Footer Content" }
      end

      expect(component.to_html).to include("Modal Footer Content")
    end
  end

  context "when has a footer with builder" do
    it "renders the component with a button" do
      component = render_inline(described_class.new(modal_id: "default-modal", max_width: :md)) do |modal|
        modal.with_footer do
          "<div class='w-full flex justify-end items-center p-4'>" \
            "<button type='button' class='focus:ring-4 font-medium text-center focus:outline-none text-white bg-pink-600 hover:bg-pink-800 focus:ring-pink-300 dark:bg-pink-600 dark:hover:bg-pink-700 dark:focus:ring-pink-800 rounded-lg px-5 py-2.5 text-sm' " \
            "data-modal_hide='footer-modal'>" \
            "Salvar</button>" \
          "</div>".html_safe
        end
      end

      expect(component.to_html).to include("Salvar")
    end
  end
end
