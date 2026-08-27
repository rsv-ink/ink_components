# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Pagination::Component, type: :component do
  around { |example| I18n.with_locale(:en) { example.run } }

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

  context "when no id is provided" do
    it "raises an error" do
      expect { described_class.new }.to raise_error(ArgumentError, /missing keyword: :id/)
    end
  end

  context "when a url proc is combined with a type that renders a form" do
    it "raises an error instead of ignoring the proc" do
      expect {
        described_class.new(id: "pagination", type: :dropdown, url: ->(page) { "/products/page/#{page}" })
      }.to raise_error(ArgumentError, /url must be a String for the dropdown type/)
    end
  end

  context "when the type is numbered" do
    it "renders every page link and the edge labels" do
      component = render_inline(described_class.new(id: "pagination", current_page: 3, total_pages: 5))

      expect(component.css("li a").map(&:text)).to eq(%w[Previous 1 2 3 4 5 Next])
    end

    it "marks the current page" do
      component = render_inline(described_class.new(id: "pagination", current_page: 3, total_pages: 5))

      expect(component.css("[aria-current='page']").text).to eq("3")
    end

    it "collapses distant pages into a gap" do
      component = render_inline(described_class.new(id: "pagination", current_page: 12, total_pages: 40))

      expect(component.css("li").map(&:text).map(&:strip)).to eq(
        [ "Previous", "1", "…", "11", "12", "13", "…", "40", "Next" ]
      )
    end
  end

  context "when the current page is the first one" do
    it "renders the previous control as disabled" do
      component = render_inline(described_class.new(id: "pagination", current_page: 1, total_pages: 5))

      expect(component.css("span[aria-disabled='true']").text).to eq("Previous")
    end
  end

  context "when the current page is the last one" do
    it "renders the next control as disabled" do
      component = render_inline(described_class.new(id: "pagination", current_page: 5, total_pages: 5))

      expect(component.css("span[aria-disabled='true']").text).to eq("Next")
    end
  end

  context "when a color is provided" do
    it "reflects a softer shade of it on the hover of the clickable cells" do
      component = render_inline(described_class.new(id: "pagination", color: :blue, current_page: 3, total_pages: 5))

      classes = component.css("li a").map { |link| link["class"] }

      expect(classes).to all(include("hover:bg-blue-50").or(include("hover:bg-blue-100")))
      expect(classes.join(" ")).not_to include("hover:bg-gray-100")
    end

    it "keeps the static label of the single type without a hover" do
      component = render_inline(described_class.new(id: "pagination", type: :single, color: :blue, current_page: 4, total_pages: 99))

      label = component.css("span").find { |span| span.text.include?("of 99") }

      expect(label["class"]).not_to include("hover:")
    end
  end

  context "when the request carries query params" do
    it "forwards the ones the form does not own" do
      component = with_request_url("/users/new?per_page=50&status=active") do
        render_inline(described_class.new(id: "pagination", type: :input, current_page: 2, total_pages: 5))
      end

      expect(hidden_fields(component)).to contain_exactly([ "per_page", "50" ], [ "status", "active" ])
    end

    it "lets the dropdown own the per page param" do
      component = with_request_url("/users/new?per_page=50&status=active") do
        render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 2, total_pages: 5, per_page: 50))
      end

      expect(hidden_fields(component)).to contain_exactly([ "status", "active" ])
    end

    it "submits back to the current path" do
      component = with_request_url("/users/new?status=active") do
        render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 2, total_pages: 5))
      end

      expect(component.css("form").first["action"]).to eq("/users/new")
    end
  end

  context "when a url string is provided" do
    it "uses its path as the form action and its query as hidden fields" do
      component = with_request_url("/users/new?status=paid&customer_id=99") do
        render_inline(
          described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5, url: "/products?category=shoes")
        )
      end

      expect(component.css("form").first["action"]).to eq("/products")
      expect(hidden_fields(component)).to contain_exactly([ "category", "shoes" ])
    end

    it "keeps its query params on the page links" do
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
  end

  context "when auto_submit is disabled" do
    it "renders a submit button on the types whose form has no other way to submit" do
      component = render_inline(
        described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5, auto_submit: false)
      )

      expect(component.css("select").first["onchange"]).to be_nil
      expect(component.css("form button[type='submit']").text).to eq("Go")
    end
  end

  context "when the type is icons" do
    it "renders the labels for screen readers only" do
      component = render_inline(described_class.new(id: "pagination", type: :icons, current_page: 2, total_pages: 5))

      expect(component.css(".sr-only").map(&:text)).to eq(%w[Previous Next])
      expect(component.css("svg").count).to eq(2)
    end
  end

  context "when the type is spaced" do
    it "renders every page link and the edge labels" do
      component = render_inline(described_class.new(id: "pagination", type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("li a").map(&:text)).to eq(%w[Previous 1 2 3 4 5 Next])
    end

    it "separates the cells instead of collapsing their borders" do
      component = render_inline(described_class.new(id: "pagination", type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("ul").first["class"]).to include("gap-1")
      expect(component.css("ul").first["class"]).not_to include("-space-x-px")
    end

    it "rounds every cell on its own" do
      component = render_inline(described_class.new(id: "pagination", type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("li a").map { |link| link["class"] }).to all(include("rounded-lg"))
    end
  end

  context "when the type is spaced_icons" do
    it "renders separated cells with the labels for screen readers only" do
      component = render_inline(described_class.new(id: "pagination", type: :spaced_icons, current_page: 3, total_pages: 5))

      expect(component.css(".sr-only").map(&:text)).to eq(%w[Previous Next])
      expect(component.css("svg").count).to eq(2)
      expect(component.css("ul").first["class"]).to include("gap-1")
    end
  end

  context "when the type is simple" do
    it "renders only the edge controls" do
      component = render_inline(described_class.new(id: "pagination", type: :simple, current_page: 2, total_pages: 5))

      expect(component.text).to include("Previous", "Next")
      expect(component.css("li")).to be_empty
    end
  end

  context "when the type is table" do
    it "renders the entries help text" do
      component = render_inline(described_class.new(id: "pagination", type: :table, current_page: 2, total_entries: 100, per_page: 10))

      expect(component.text.squish).to include("Showing 11 to 20 of 100 Entries")
    end

    it "derives the total of pages from the entries" do
      component = render_inline(described_class.new(id: "pagination", type: :table, current_page: 10, total_entries: 100, per_page: 10))

      expect(component.css("span[aria-disabled='true']").text).to eq("Next")
    end
  end

  context "when the type is table_icons" do
    it "renders an icon on each edge control" do
      component = render_inline(described_class.new(id: "pagination", type: :table_icons, current_page: 2, total_entries: 100, per_page: 10))

      expect(component.css("svg").count).to eq(2)
    end
  end

  context "when the type is dropdown" do
    it "renders the per page options" do
      component = render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5))

      expect(component.css("select option").map(&:text)).to eq(
        [ "10 per page", "25 per page", "50 per page", "100 per page" ]
      )
    end

    it "keeps the given option selected" do
      component = render_inline(described_class.new(id: "pagination", type: :dropdown, current_page: 1, total_pages: 5, per_page: 25))

      expect(component.css("select option[selected]").text).to eq("25 per page")
    end
  end

  context "when the type is input" do
    it "renders the page field limited by the total of pages" do
      component = render_inline(described_class.new(id: "pagination", type: :input, current_page: 2, total_pages: 5))

      field = component.css("input[type='number']").first

      expect(field["name"]).to eq("page")
      expect(field["value"]).to eq("2")
      expect(field["max"]).to eq("5")
    end
  end

  context "when the type is input_button" do
    it "renders the submit button" do
      component = render_inline(described_class.new(id: "pagination", type: :input_button, current_page: 2, total_pages: 5))

      expect(component.css("button[type='submit']").text).to eq("Go")
    end
  end

  context "when the type is select_buttons" do
    it "renders one option per page and the total of pages" do
      component = render_inline(described_class.new(id: "pagination", type: :select_buttons, current_page: 2, total_pages: 9))

      expect(component.css("select option").count).to eq(9)
      expect(component.css("input[disabled]").first["value"]).to eq("of 9 pages")
    end
  end

  context "when the type is single" do
    it "renders the current page over the total of pages" do
      component = render_inline(described_class.new(id: "pagination", type: :single, current_page: 4, total_pages: 99))

      expect(component.text.squish).to include("4 of 99")
    end
  end

  context "when a url proc is provided" do
    it "builds the links with it" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 1, total_pages: 3, url: ->(page) { "/products/page/#{page}" })
      )

      expect(component.css("a").map { |link| link["href"] }).to include("/products/page/2", "/products/page/3")
    end
  end

  context "when the locale is pt-BR" do
    it "renders the translated labels" do
      component = I18n.with_locale(:"pt-BR") do
        render_inline(described_class.new(id: "pagination", type: :table, current_page: 1, total_entries: 100, per_page: 10))
      end

      expect(component.text.squish).to include("Exibindo 1 a 10 de 100 registros", "Anterior", "Próximo")
    end
  end

  context "when the locale changes between building and rendering" do
    it "resolves the aria label at render time, like the other labels" do
      component = described_class.new(id: "pagination", current_page: 2, total_pages: 5)

      rendered = I18n.with_locale(:"pt-BR") { render_inline(component) }

      expect(rendered.css("nav").first["aria-label"]).to eq("Navegação de páginas")
    end
  end

  context "when the window is wider than the total of pages" do
    it "clamps it instead of walking past the bounds" do
      component = render_inline(described_class.new(id: "pagination", current_page: 2, total_pages: 5, window: 50_000))

      expect(component.css("li a").map(&:text)).to eq(%w[Previous 1 2 3 4 5 Next])
    end
  end

  context "when the labels are overridden" do
    it "renders them instead of the translations" do
      component = render_inline(
        described_class.new(id: "pagination", current_page: 2, total_pages: 3, previous_label: "Anterior", next_label: "Próximo")
      )

      expect(component.text).to include("Anterior", "Próximo")
    end
  end
  def hidden_fields(component)
    component.css("input[type='hidden']").map { |field| [ field["name"], field["value"] ] }
  end
end
