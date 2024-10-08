# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::ViewHelper, type: :component do
  describe "#ink_alert" do
    it "" do
      helper = process_html(ink_alert { "Some content" })
      component = render_inline(InkComponents::Alert::Component.new) { "Some content" }

      expect(helper).to eq(component.to_html)
    end
  end

  def process_html(html)
    Nokogiri::HTML.fragment(html).to_html
  end
end
