# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::Pagination::Component, type: :component do
  around { |example| I18n.with_locale(:en) { example.run } }

  context "when an invalid type is provided" do
    it "raises an error" do
      expect { described_class.new(type: :invalid) }.to raise_error(ArgumentError, /Invalid type invalid/)
    end
  end

  context "when the type is numbered" do
    it "renders every page link and the edge labels" do
      component = render_inline(described_class.new(current_page: 3, total_pages: 5))

      expect(component.css("li a").map(&:text)).to eq(%w[Previous 1 2 3 4 5 Next])
    end

    it "marks the current page" do
      component = render_inline(described_class.new(current_page: 3, total_pages: 5))

      expect(component.css("[aria-current='page']").text).to eq("3")
    end

    it "collapses distant pages into a gap" do
      component = render_inline(described_class.new(current_page: 12, total_pages: 40))

      expect(component.css("li").map(&:text).map(&:strip)).to eq(
        [ "Previous", "1", "…", "11", "12", "13", "…", "40", "Next" ]
      )
    end
  end

  context "when the current page is the first one" do
    it "renders the previous control as disabled" do
      component = render_inline(described_class.new(current_page: 1, total_pages: 5))

      expect(component.css("span[aria-disabled='true']").text).to eq("Previous")
    end
  end

  context "when the current page is the last one" do
    it "renders the next control as disabled" do
      component = render_inline(described_class.new(current_page: 5, total_pages: 5))

      expect(component.css("span[aria-disabled='true']").text).to eq("Next")
    end
  end

  context "when a color is provided" do
    it "reflects a softer shade of it on the hover of the clickable cells" do
      component = render_inline(described_class.new(color: :blue, current_page: 3, total_pages: 5))

      classes = component.css("li a").map { |link| link["class"] }

      expect(classes).to all(include("hover:bg-blue-50").or(include("hover:bg-blue-100")))
      expect(classes.join(" ")).not_to include("hover:bg-gray-100")
    end

    it "keeps the static label of the single type without a hover" do
      component = render_inline(described_class.new(type: :single, color: :blue, current_page: 4, total_pages: 99))

      label = component.css("span").find { |span| span.text.include?("of 99") }

      expect(label["class"]).not_to include("hover:")
    end
  end

  context "when the type is icons" do
    it "renders the labels for screen readers only" do
      component = render_inline(described_class.new(type: :icons, current_page: 2, total_pages: 5))

      expect(component.css(".sr-only").map(&:text)).to eq(%w[Previous Next])
      expect(component.css("svg").count).to eq(2)
    end
  end

  context "when the type is spaced" do
    it "renders every page link and the edge labels" do
      component = render_inline(described_class.new(type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("li a").map(&:text)).to eq(%w[Previous 1 2 3 4 5 Next])
    end

    it "separates the cells instead of collapsing their borders" do
      component = render_inline(described_class.new(type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("ul").first["class"]).to include("gap-1")
      expect(component.css("ul").first["class"]).not_to include("-space-x-px")
    end

    it "rounds every cell on its own" do
      component = render_inline(described_class.new(type: :spaced, current_page: 3, total_pages: 5))

      expect(component.css("li a").map { |link| link["class"] }).to all(include("rounded-lg"))
    end
  end

  context "when the type is spaced_icons" do
    it "renders separated cells with the labels for screen readers only" do
      component = render_inline(described_class.new(type: :spaced_icons, current_page: 3, total_pages: 5))

      expect(component.css(".sr-only").map(&:text)).to eq(%w[Previous Next])
      expect(component.css("svg").count).to eq(2)
      expect(component.css("ul").first["class"]).to include("gap-1")
    end
  end

  context "when the type is simple" do
    it "renders only the edge controls" do
      component = render_inline(described_class.new(type: :simple, current_page: 2, total_pages: 5))

      expect(component.text).to include("Previous", "Next")
      expect(component.css("li")).to be_empty
    end
  end

  context "when the type is table" do
    it "renders the entries help text" do
      component = render_inline(described_class.new(type: :table, current_page: 2, total_entries: 100, per_page: 10))

      expect(component.text.squish).to include("Showing 11 to 20 of 100 Entries")
    end

    it "derives the total of pages from the entries" do
      component = render_inline(described_class.new(type: :table, current_page: 10, total_entries: 100, per_page: 10))

      expect(component.css("span[aria-disabled='true']").text).to eq("Next")
    end
  end

  context "when the type is table_icons" do
    it "renders an icon on each edge control" do
      component = render_inline(described_class.new(type: :table_icons, current_page: 2, total_entries: 100, per_page: 10))

      expect(component.css("svg").count).to eq(2)
    end
  end

  context "when the type is dropdown" do
    it "renders the per page options" do
      component = render_inline(described_class.new(type: :dropdown, current_page: 1, total_pages: 5))

      expect(component.css("select option").map(&:text)).to eq(
        [ "10 per page", "25 per page", "50 per page", "100 per page" ]
      )
    end

    it "keeps the given option selected" do
      component = render_inline(described_class.new(type: :dropdown, current_page: 1, total_pages: 5, per_page: 25))

      expect(component.css("select option[selected]").text).to eq("25 per page")
    end
  end

  context "when the type is input" do
    it "renders the page field limited by the total of pages" do
      component = render_inline(described_class.new(type: :input, current_page: 2, total_pages: 5))

      field = component.css("input[type='number']").first

      expect(field["name"]).to eq("page")
      expect(field["value"]).to eq("2")
      expect(field["max"]).to eq("5")
    end
  end

  context "when the type is input_button" do
    it "renders the submit button" do
      component = render_inline(described_class.new(type: :input_button, current_page: 2, total_pages: 5))

      expect(component.css("button[type='submit']").text).to eq("Go")
    end
  end

  context "when the type is select_buttons" do
    it "renders one option per page and the total of pages" do
      component = render_inline(described_class.new(type: :select_buttons, current_page: 2, total_pages: 9))

      expect(component.css("select option").count).to eq(9)
      expect(component.css("input[disabled]").first["value"]).to eq("of 9 pages")
    end
  end

  context "when the type is single" do
    it "renders the current page over the total of pages" do
      component = render_inline(described_class.new(type: :single, current_page: 4, total_pages: 99))

      expect(component.text.squish).to include("4 of 99")
    end
  end

  context "when a url proc is provided" do
    it "builds the links with it" do
      component = render_inline(
        described_class.new(current_page: 1, total_pages: 3, url: ->(page) { "/products/page/#{page}" })
      )

      expect(component.css("a").map { |link| link["href"] }).to include("/products/page/2", "/products/page/3")
    end
  end

  context "when the locale is pt-BR" do
    it "renders the translated labels" do
      component = I18n.with_locale(:"pt-BR") do
        render_inline(described_class.new(type: :table, current_page: 1, total_entries: 100, per_page: 10))
      end

      expect(component.text.squish).to include("Exibindo 1 a 10 de 100 registros", "Anterior", "Próximo")
    end
  end

  context "when the labels are overridden" do
    it "renders them instead of the translations" do
      component = render_inline(
        described_class.new(current_page: 2, total_pages: 3, previous_label: "Anterior", next_label: "Próximo")
      )

      expect(component.text).to include("Anterior", "Próximo")
    end
  end
end
