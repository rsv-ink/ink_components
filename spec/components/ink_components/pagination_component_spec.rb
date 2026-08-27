# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Pagination::Component, type: :component do
  around { |example| I18n.with_locale(:en) { example.run } }

  context "when no id is provided" do
    it "raises an error" do
      expect { described_class.new }.to raise_error(ArgumentError, /missing keyword: :id/)
    end
  end

  context "when an invalid type is provided" do
    it "raises an error" do
      expect { described_class.new(id: "pagination", type: :invalid) }.to raise_error(ArgumentError, /Invalid type invalid/)
    end
  end

  context "when an invalid color is provided" do
    it "raises an error" do
      expect { described_class.new(id: "pagination", color: :magenta) }.to raise_error(ArgumentError, /Invalid color magenta/)
    end
  end

  context "when an invalid size is provided" do
    it "raises an error" do
      expect { described_class.new(id: "pagination", size: :xl) }.to raise_error(ArgumentError, /Invalid size xl/)
    end
  end

  describe "composition" do
    it "renders only the slots the caller fills" do
      component = render_inline(described_class.new(id: "pagination", type: nil, current_page: 2, total_pages: 5)) do |pagination|
        pagination.with_controls
      end

      expect(component.css("ul")).to be_empty
      expect(component.css("form")).to be_empty
      expect(component.text).to include("Previous", "Next")
    end

    it "lets the caller override what the preset would have set" do
      component = render_inline(described_class.new(id: "pagination", type: :default, current_page: 2, total_pages: 5)) do |pagination|
        pagination.with_pages(edges: :chevron, spaced: true)
      end

      expect(component.css("ul").first["class"]).to include("gap-1")
      expect(component.css(".sr-only").map(&:text)).to eq(%w[Previous Next])
    end

    it "combines slots the presets do not pair" do
      component = render_inline(
        described_class.new(id: "pagination", type: nil, current_page: 2, total_pages: 5, total_entries: 50)
      ) do |pagination|
        pagination.with_entries
        pagination.with_pages
        pagination.with_form(control: :per_page_select)
      end

      expect(component.text.squish).to include("Showing 11 to 20 of 50 Entries")
      expect(component.css("ul li").count).to eq(7)
      expect(component.css("form select").count).to eq(1)
    end

    it "adds to the preset instead of replacing it when the type is kept" do
      component = render_inline(described_class.new(id: "pagination", type: :default, current_page: 2, total_pages: 5)) do |pagination|
        pagination.with_controls
      end

      expect(component.css("ul li").count).to eq(7)
      expect(component.css("div a, div span").count).to eq(2)
    end

    it "skips the entries when there is no total" do
      component = render_inline(described_class.new(id: "pagination", type: nil, current_page: 1, total_pages: 5)) do |pagination|
        pagination.with_entries
      end

      expect(component.css("span")).to be_empty
    end
  end

  describe "the pages slot" do
    it "renders every page link and the edge labels" do
      component = render_inline(described_class.new(id: "pagination", current_page: 3, total_pages: 5))

      expect(component.css("li a").map(&:text).map(&:strip)).to eq(%w[Previous 1 2 3 4 5 Next])
    end

    it "marks the current page" do
      component = render_inline(described_class.new(id: "pagination", current_page: 3, total_pages: 5))

      expect(component.css("[aria-current='page']").text.strip).to eq("3")
    end

    it "collapses distant pages into a gap" do
      component = render_inline(described_class.new(id: "pagination", current_page: 12, total_pages: 40))

      expect(component.css("li").map(&:text).map(&:strip)).to eq(
        [ "Previous", "1", "…", "11", "12", "13", "…", "40", "Next" ]
      )
    end

    it "hides the gap from assistive technology and does not style it as a disabled control" do
      component = render_inline(described_class.new(id: "pagination", current_page: 12, total_pages: 40))

      gap = component.css("span[aria-hidden='true']").first

      expect(gap.text.strip).to eq("…")
      expect(gap["class"]).not_to include("cursor-not-allowed")
    end

    it "renders the previous control as disabled on the first page" do
      component = render_inline(described_class.new(id: "pagination", current_page: 1, total_pages: 5))

      expect(component.css("span[aria-disabled='true']").text.strip).to eq("Previous")
    end

    it "renders the next control as disabled on the last page" do
      component = render_inline(described_class.new(id: "pagination", current_page: 5, total_pages: 5))

      expect(component.css("span[aria-disabled='true']").text.strip).to eq("Next")
    end

    it "clamps a window wider than the cap" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 5_000, total_pages: 1_000_000, window: 50_000)
      )

      expect(component.css("li").count).to be <= described_class::MAX_PAGES + 8
    end

    it "rejects an unknown edges value" do
      expect {
        render_inline(described_class.new(id: "pagination", type: nil, current_page: 1, total_pages: 3)) do |pagination|
          pagination.with_pages(edges: :sparkle)
        end
      }.to raise_error(ArgumentError, /Invalid edges sparkle/)
    end
  end

  describe "presets" do
    it "renders icon edges for the icons type" do
      component = render_inline(described_class.new(id: "pagination", type: :icons, current_page: 2, total_pages: 5))

      expect(component.css(".sr-only").map(&:text)).to eq(%w[Previous Next])
      expect(component.css("svg").count).to eq(2)
    end

    it "separates the cells for the spaced type" do
      component = render_inline(described_class.new(id: "pagination", type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("ul").first["class"]).to include("gap-1")
      expect(component.css("ul").first["class"]).not_to include("-space-x-px")
      expect(component.css("li a").map { |link| link["class"] }).to all(include("rounded-lg"))
    end

    it "renders only the edge controls for the simple type" do
      component = render_inline(described_class.new(id: "pagination", type: :simple, current_page: 2, total_pages: 5))

      expect(component.text).to include("Previous", "Next")
      expect(component.css("li")).to be_empty
    end

    it "renders the entries help text for the table type" do
      component = render_inline(
        described_class.new(id: "pagination", type: :table, current_page: 2, total_entries: 100, per_page: 10)
      )

      expect(component.text.squish).to include("Showing 11 to 20 of 100 Entries")
    end

    it "derives the total of pages from the entries" do
      component = render_inline(
        described_class.new(id: "pagination", type: :table, current_page: 10, total_entries: 100, per_page: 10)
      )

      expect(component.css("span[aria-disabled='true']").text.strip).to eq("Next")
    end

    it "clamps the first entry instead of inverting the range" do
      component = render_inline(
        described_class.new(id: "pagination", type: :table, current_page: 40, total_pages: 40, total_entries: 100, per_page: 10)
      )

      expect(component.text.squish).to include("Showing 100 to 100 of 100 Entries")
    end

    it "renders an icon on each edge control for the table_icons type" do
      component = render_inline(
        described_class.new(id: "pagination", type: :table_icons, current_page: 2, total_entries: 100, per_page: 10)
      )

      expect(component.css("svg").count).to eq(2)
    end

    it "renders the per page options for the dropdown type" do
      component = render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5))

      expect(component.css("select option").map(&:text)).to eq(
        [ "10 per page", "25 per page", "50 per page", "100 per page" ]
      )
    end

    it "renders the page field for the input type" do
      component = render_inline(described_class.new(id: "pagination", type: :input, current_page: 2, total_pages: 5))

      field = component.css("input[type='number']").first

      expect(field["name"]).to eq("page")
      expect(field["value"]).to eq("2")
      expect(field["max"]).to eq("5")
    end

    it "renders the submit button for the input_button type" do
      component = render_inline(described_class.new(id: "pagination", type: :input_button, current_page: 2, total_pages: 5))

      expect(component.css("button[type='submit']").text).to eq("Go")
    end

    it "renders one option per page and the total for the select_buttons type" do
      component = render_inline(described_class.new(id: "pagination", type: :select_buttons, current_page: 2, total_pages: 9))

      expect(component.css("select option").count).to eq(9)
      expect(component.css("input[disabled]").first["value"]).to eq("of 9 pages")
    end

    it "renders the current page over the total for the single type" do
      component = render_inline(described_class.new(id: "pagination", type: :single, current_page: 4, total_pages: 99))

      expect(component.text.squish).to include("4 of 99")
    end

    it "keeps the static counter of the single type without hover or focus classes" do
      component = render_inline(described_class.new(id: "pagination", type: :single, current_page: 4, total_pages: 99))

      counter = component.css("span").find { |span| span.text.include?("of 99") }

      expect(counter["class"]).not_to include("hover:")
      expect(counter["class"]).not_to include("focus:ring")
    end

    it "renders the total in the singular when there is a single page" do
      component = render_inline(described_class.new(id: "pagination", type: :select_buttons, current_page: 1, total_pages: 1))

      expect(component.css("input[disabled]").first["value"]).to eq("of 1 page")
    end

    it "falls back to a number field when the page select would overflow the cap" do
      component = render_inline(
        described_class.new(
          id: "pagination",
          type: :select_buttons,
          current_page: 1,
          total_pages: described_class::MAX_PAGES + 1
        )
      )

      expect(component.css("select")).to be_empty
      expect(component.css("input[type='number']").first["max"]).to eq("101")
    end
  end

  describe "colors" do
    it "reflects a softer shade of the color on the hover of the clickable cells" do
      component = render_inline(described_class.new(id: "pagination", color: :blue, current_page: 3, total_pages: 5))

      classes = component.css("li a").map { |link| link["class"] }

      expect(classes).to all(include("hover:bg-blue-50").or(include("hover:bg-blue-100")))
      expect(classes.join(" ")).not_to include("hover:bg-gray-100")
    end

    it "carries a focus ring on every clickable cell, since the native outline is removed" do
      component = render_inline(described_class.new(id: "pagination", color: :blue, current_page: 3, total_pages: 5))

      expect(component.css("li a").map { |link| link["class"] }).to all(
        include("focus:ring-2").and(include("focus:ring-blue-300"))
      )
    end
  end

  describe "urls" do
    it "builds the links with a url proc" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 1, total_pages: 3, url: ->(page) { "/products/page/#{page}" })
      )

      expect(component.css("a").map { |link| link["href"] }).to include("/products/page/2", "/products/page/3")
    end

    it "raises when a url proc is combined with a form, which submits with GET" do
      expect {
        render_inline(described_class.new(id: "pagination", type: :dropdown, url: ->(page) { "/products?page=#{page}" }))
      }.to raise_error(ArgumentError, /url must be a String for a pagination form/)
    end

    it "keeps the query params of a url string on the page links" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 1, total_pages: 3, url: "/products?category=shoes")
      )

      expect(component.css("li a").map { |link| link["href"] }).to all(include("category=shoes"))
    end

    it "does not raise on a query with non-ascii characters" do
      expect {
        render_inline(described_class.new(id: "pagination", current_page: 1, total_pages: 3, url: "/produtos?busca=camisão"))
      }.not_to raise_error
    end

    it "keeps the query before a fragment" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 1, total_pages: 3, url: "/products?a=1#list")
      )

      expect(component.css("li a").map { |link| link["href"] }).to all(start_with("/products?a=1&page="))
      expect(component.to_html).not_to include("%23list")
    end

    it "reattaches a fragment after the query" do
      component = render_inline(described_class.new(id: "pagination", current_page: 1, total_pages: 3, url: "/products#list"))

      expect(component.css("li a").map { |link| link["href"] }).to include("/products?page=2#list")
    end

    it "keeps the original order of the request params" do
      component = with_request_url("/users/new?status=active&q=shoe") do
        render_inline(described_class.new(id: "pagination", current_page: 1, total_pages: 3))
      end

      expect(component.css("li a").first["href"]).to eq("/users/new?status=active&q=shoe&page=1")
    end
  end

  describe "forms" do
    it "forwards the request params the form does not own" do
      component = with_request_url("/users/new?per_page=50&status=active") do
        render_inline(described_class.new(id: "pagination", type: :input, current_page: 2, total_pages: 5))
      end

      expect(hidden_fields(component)).to contain_exactly([ "per_page", "50" ], [ "status", "active" ])
    end

    it "lets the dropdown own the per page param and drop the current page" do
      component = with_request_url("/users/new?page=8&per_page=10&status=active") do
        render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 8, total_pages: 10))
      end

      expect(hidden_fields(component)).to contain_exactly([ "status", "active" ])
    end

    it "submits back to the current path" do
      component = with_request_url("/users/new?status=active") do
        render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 2, total_pages: 5))
      end

      expect(component.css("form").first["action"]).to eq("/users/new")
    end

    it "uses the path of a url string as the action and its query as hidden fields" do
      component = with_request_url("/users/new?status=paid&customer_id=99") do
        render_inline(
          described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5, url: "/products?category=shoes")
        )
      end

      expect(component.css("form").first["action"]).to eq("/products")
      expect(hidden_fields(component)).to contain_exactly([ "category", "shoes" ])
    end

    it "adds a per page value outside the options so the select is not lying" do
      component = render_inline(
        described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_entries: 100, per_page: 20)
      )

      expect(component.css("select option[selected]").text).to eq("20 per page")
      expect(component.css("select option").map(&:text)).to eq(
        [ "10 per page", "20 per page", "25 per page", "50 per page", "100 per page" ]
      )
    end

    it "renders a submit button when the inline handler is turned off" do
      component = render_inline(
        described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5, auto_submit: false)
      )

      expect(component.css("select").first["onchange"]).to be_nil
      expect(component.css("form button[type='submit']").text).to eq("Go")
    end

    it "rejects an unknown control" do
      expect {
        render_inline(described_class.new(id: "pagination", type: nil, current_page: 1, total_pages: 3)) do |pagination|
          pagination.with_form(control: :telepathy)
        end
      }.to raise_error(ArgumentError, /Invalid control telepathy/)
    end
  end

  describe "labels" do
    it "renders the overridden labels instead of the translations" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 2, total_pages: 3, previous_label: "Anterior", next_label: "Próximo")
      )

      expect(component.text).to include("Anterior", "Próximo")
    end

    it "renders the translated labels of the locale" do
      component = I18n.with_locale(:"pt-BR") do
        render_inline(described_class.new(id: "pagination", type: :table, current_page: 1, total_entries: 100, per_page: 10))
      end

      expect(component.text.squish).to include("Exibindo 1 a 10 de 100 registros", "Anterior", "Próximo")
    end

    it "resolves the aria label at render time, not at build time" do
      component = described_class.new(id: "pagination", current_page: 2, total_pages: 5)

      rendered = I18n.with_locale(:"pt-BR") { render_inline(component) }

      expect(rendered.css("nav").first["aria-label"]).to eq("Navegação de páginas")
    end

    it "does not duplicate an aria label given in the nested form" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 2, total_pages: 5, aria: { label: "Product pages" })
      )

      expect(component.to_html.scan("aria-label").count).to eq(1)
      expect(component.css("nav").first["aria-label"]).to eq("Product pages")
    end
  end

  def hidden_fields(component)
    component.css("input[type='hidden']").map { |field| [ field["name"], field["value"] ] }
  end
end
