# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::ViewHelper, type: :helper do
  COMPONENTS_ARGS = {
    alert: { args: {}, block: "Some content" },
    avatar: { args: {}, block: "Some content" },
    avatar_collection: { args: {}, block: "Some content" },
    avatar_status: { args: {}, block: "Some content" },
    badge: { args: {}, block: "Some content" },
    button: { args: { builder: :link_to, href: "#" }, block: "Some content" },
    card: { args: {}, block: "Some content" },
    checkbox: { args: {}, block: "Some content" },
    dropzone: { args: {}, block: "Some content" },
    file_input: { args: {}, block: "Some content" },
    helper_text: { args: {}, block: "Some content" },
    label: { args: {}, block: "Some content" },
    radio: { args: {}, block: "Some content" },
    select: { args: {}, block: "Some content" },
    text_area: { args: {}, block: "Some content" },
    toggle: { args: {}, block: "Some content" },
    progress_bar: { args: { progress: 50 }, block: "Some content" }
  }.freeze

  COMPONENTS_ARGS.each do |key, value|
    describe "#ink_#{key}" do
      it "renders #{key} component" do
        klass = described_class::COMPONENTS[key]
        args = value[:args]
        content = value[:block]

        helper = process_html(send("ink_#{key}", **args) { content })
        component = render_inline(klass.constantize.new(**args)) { content }

        expect(helper).to eq(component.to_html)
      end
    end
  end

  def process_html(html)
    Nokogiri::HTML.fragment(html).to_html
  end
end
