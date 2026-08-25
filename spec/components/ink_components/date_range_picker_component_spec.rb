# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::DateRangePicker::Component, type: :component do
  TODAY = Date.new(2026, 8, 24)

  CAMPAIGNS = [
    { id: "christmas", label: "Natal 2025", starts_on: Date.new(2025, 12, 1), ends_on: Date.new(2025, 12, 25) }
  ].freeze

  before { travel_to(TODAY) }

  def config(component)
    JSON.parse(component.css("[data-date-range-picker]").first["data-date-range-picker-config"])
  end

  def field_value(component, name)
    component.css("input[name='#{name}']").first["value"]
  end

  def hidden_names(component)
    component.css("form input[type=hidden]").map { |input| input["name"] }
  end

  context "when only the id is given" do
    it "renders the last seven days" do
      component = render_inline(described_class.new(id: "period"))

      expect(field_value(component, "start_date")).to eq("2026-08-18")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
      expect(field_value(component, "preset")).to eq("last_7_days")
    end

    it "renders the trigger split into the preset label and the period" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.css("[data-date-range-picker-target='trigger-preset']").text).to eq("Últimos 7 dias:")
      expect(component.css("[data-date-range-picker-target='trigger-range']").text).to eq("18/08/2026 - 24/08/2026")
    end

    it "renders the panel closed" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.css("#period-panel").first["class"]).to include("hidden")
    end
  end

  context "when a preset is given" do
    it "resolves today" do
      component = render_inline(described_class.new(id: "period", preset: "today"))

      expect(field_value(component, "start_date")).to eq("2026-08-24")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "resolves yesterday" do
      component = render_inline(described_class.new(id: "period", preset: "yesterday"))

      expect(field_value(component, "start_date")).to eq("2026-08-23")
      expect(field_value(component, "end_date")).to eq("2026-08-23")
    end

    it "resolves the last thirty days" do
      component = render_inline(described_class.new(id: "period", preset: "last_30_days"))

      expect(field_value(component, "start_date")).to eq("2026-07-26")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "resolves the last ninety days" do
      component = render_inline(described_class.new(id: "period", preset: "last_90_days"))

      expect(field_value(component, "start_date")).to eq("2026-05-27")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "resolves this week from sunday" do
      component = render_inline(described_class.new(id: "period", preset: "this_week"))

      expect(field_value(component, "start_date")).to eq("2026-08-23")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "resolves last week from sunday to saturday" do
      component = render_inline(described_class.new(id: "period", preset: "last_week"))

      expect(field_value(component, "start_date")).to eq("2026-08-16")
      expect(field_value(component, "end_date")).to eq("2026-08-22")
    end

    it "resolves this month" do
      component = render_inline(described_class.new(id: "period", preset: "this_month"))

      expect(field_value(component, "start_date")).to eq("2026-08-01")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "resolves last month" do
      component = render_inline(described_class.new(id: "period", preset: "last_month"))

      expect(field_value(component, "start_date")).to eq("2026-07-01")
      expect(field_value(component, "end_date")).to eq("2026-07-31")
    end

    it "resolves this year" do
      component = render_inline(described_class.new(id: "period", preset: "this_year"))

      expect(field_value(component, "start_date")).to eq("2026-01-01")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "resolves max from the epoch" do
      component = render_inline(described_class.new(id: "period", preset: "max", epoch: Date.new(2021, 3, 5)))

      expect(field_value(component, "start_date")).to eq("2021-03-05")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "keeps custom without resolving a range" do
      component = render_inline(described_class.new(id: "period", preset: "custom"))

      expect(field_value(component, "preset")).to eq("custom")
    end
  end

  context "when explicit dates are given" do
    it "infers the matching preset" do
      component = render_inline(described_class.new(id: "period", start_date: TODAY, end_date: TODAY))

      expect(field_value(component, "preset")).to eq("today")
    end

    it "falls back to custom when no preset matches" do
      component = render_inline(described_class.new(id: "period", start_date: Date.new(2026, 3, 3), end_date: Date.new(2026, 3, 9)))

      expect(field_value(component, "preset")).to eq("custom")
    end

    it "swaps inverted dates" do
      component = render_inline(described_class.new(id: "period", start_date: TODAY, end_date: TODAY - 5))

      expect(field_value(component, "start_date")).to eq("2026-08-19")
      expect(field_value(component, "end_date")).to eq("2026-08-24")
    end

    it "accepts strings" do
      component = render_inline(described_class.new(id: "period", start_date: "2026-02-01", end_date: "2026-02-28"))

      expect(field_value(component, "start_date")).to eq("2026-02-01")
      expect(field_value(component, "end_date")).to eq("2026-02-28")
    end
  end

  context "when presets are enabled" do
    it "renders the groups and the custom option" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.to_html).to include("JANELA MÓVEL", "PERÍODO FECHADO", "Personalizado")
    end

    it "marks the active preset" do
      component = render_inline(described_class.new(id: "period", preset: "this_month"))

      expect(component.css("[data-preset-id='this_month']").first["aria-pressed"]).to eq("true")
    end

    it "renders the hint only for the active preset" do
      component = render_inline(described_class.new(id: "period", preset: "today"))

      active = component.css("[data-preset-id='today'] [data-date-range-picker-target='preset-hint']").first
      inactive = component.css("[data-preset-id='yesterday'] [data-date-range-picker-target='preset-hint']").first

      expect(active["class"]).not_to include("hidden")
      expect(inactive["class"]).to include("hidden")
    end
  end

  context "when presets are disabled" do
    it "doesn't render the presets column" do
      component = render_inline(described_class.new(id: "period", show_presets: false))

      expect(component.css("[data-preset-id]")).to be_empty
    end
  end

  context "when campaigns are given as hashes" do
    it "renders the campaigns group" do
      component = render_inline(described_class.new(id: "period", campaigns: CAMPAIGNS))

      expect(component.to_html).to include("CAMPANHAS", "Natal 2025")
    end

    it "resolves the campaign range" do
      component = render_inline(described_class.new(id: "period", preset: "campaign:christmas", campaigns: CAMPAIGNS))

      expect(field_value(component, "start_date")).to eq("2025-12-01")
      expect(field_value(component, "end_date")).to eq("2025-12-25")
    end

    it "infers the campaign preset from the dates" do
      component = render_inline(
        described_class.new(id: "period", start_date: Date.new(2025, 12, 1), end_date: Date.new(2025, 12, 25), campaigns: CAMPAIGNS)
      )

      expect(field_value(component, "preset")).to eq("campaign:christmas")
    end
  end

  context "when campaigns are given as objects" do
    it "reads the range from the object" do
      campaign = Struct.new(:id, :name, :starts_on, :ends_on)
                       .new("black-friday", "Black Friday 2025", Date.new(2025, 11, 24), Date.new(2025, 11, 30))
      component = render_inline(described_class.new(id: "period", preset: "campaign:black-friday", campaigns: [ campaign ]))

      expect(component.to_html).to include("Black Friday 2025")
      expect(field_value(component, "start_date")).to eq("2025-11-24")
    end
  end

  context "when no campaigns are given" do
    it "doesn't render the campaigns group" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.to_html).not_to include("CAMPANHAS")
    end
  end

  context "when the type is both" do
    it "renders the preset label and the range" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.css("[data-date-range-picker-target='trigger-preset']")).to be_present
      expect(component.css("[data-date-range-picker-target='trigger-range']")).to be_present
    end
  end

  context "when the type is label" do
    it "renders the preset label without the colon" do
      component = render_inline(described_class.new(id: "period", type: :label))

      expect(component.css("[data-date-range-picker-target='trigger-preset']").text).to eq("Últimos 7 dias")
      expect(component.css("[data-date-range-picker-target='trigger-range']")).to be_empty
    end
  end

  context "when the type is range" do
    it "renders only the period" do
      component = render_inline(described_class.new(id: "period", type: :range))

      expect(component.css("[data-date-range-picker-target='trigger-preset']")).to be_empty
      expect(component.css("[data-date-range-picker-target='trigger-range']").text).to eq("18/08/2026 - 24/08/2026")
    end
  end

  context "when the type is unknown" do
    it "raises an argument error" do
      expect { described_class.new(id: "period", type: :nope) }.to raise_error(ArgumentError, /Invalid type/)
    end
  end

  context "when the trigger has to fit every preset" do
    it "reserves the width of the longest preset label" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.css("[aria-hidden='true']").text).to include("Últimos 30 dias:")
    end

    it "takes campaign labels into account" do
      campaigns = [ { id: "lovers", label: "Dia dos Namorados 2025", starts_on: Date.new(2025, 6, 1), ends_on: Date.new(2025, 6, 12) } ]
      component = render_inline(described_class.new(id: "period", campaigns:))

      expect(component.css("[aria-hidden='true']").text).to include("Dia dos Namorados 2025:")
    end
  end

  context "when the form submits to the current url" do
    it "forwards the query params already on the page" do
      with_request_url("/users/new?status=paid&page=2") do
        component = render_inline(described_class.new(id: "period"))

        expect(hidden_names(component)).to include("status", "page", "start_date", "end_date", "preset")
        expect(field_value(component, "status")).to eq("paid")
      end
    end

    it "doesn't duplicate the params it owns" do
      with_request_url("/users/new?start_date=2020-01-01&end_date=2020-01-31&preset=custom") do
        component = render_inline(described_class.new(id: "period"))

        expect(hidden_names(component).count("start_date")).to eq(1)
      end
    end

    it "forwards nested and repeated params" do
      with_request_url("/users/new?filter[kind]=online&tags[]=a&tags[]=b") do
        component = render_inline(described_class.new(id: "period"))

        expect(hidden_names(component)).to include("filter[kind]", "tags[]")
        expect(component.css("form input[name='tags[]']").map { |input| input["value"] }).to eq(%w[a b])
      end
    end
  end

  context "when the form submits somewhere else" do
    it "doesn't forward the query params" do
      with_request_url("/users/new?status=paid") do
        component = render_inline(described_class.new(id: "period", url: "/dashboard"))

        expect(hidden_names(component)).not_to include("status")
      end
    end
  end

  context "when the form is not a get" do
    it "doesn't forward the query params" do
      with_request_url("/users/new?status=paid") do
        component = render_inline(described_class.new(id: "period", form_method: :post))

        expect(hidden_names(component)).not_to include("status")
      end
    end
  end

  context "when a date format is given" do
    it "formats the trigger with it" do
      component = render_inline(described_class.new(id: "period", date_format: "%Y/%m/%d"))

      expect(component.css("[data-date-range-picker-target='trigger-range']").text).to eq("2026/08/18 - 2026/08/24")
    end

    it "keeps the hidden fields in iso" do
      component = render_inline(described_class.new(id: "period", date_format: "%Y/%m/%d"))

      expect(field_value(component, "start_date")).to eq("2026-08-18")
    end
  end

  context "when labels are overridden" do
    it "uses the given labels" do
      component = render_inline(described_class.new(id: "period", labels: { apply: "Aplicar", presets: { "last_7_days" => "7 dias" } }))

      expect(component.to_html).to include("Aplicar", "7 dias")
    end

    it "keeps the labels that were not overridden" do
      component = render_inline(described_class.new(id: "period", labels: { apply: "Aplicar" }))

      expect(component.to_html).to include("Cancelar", "JANELA MÓVEL")
    end
  end

  context "when an action is given" do
    it "renders the action slot" do
      component = render_inline(described_class.new(id: "period")) do |picker|
        picker.with_action { "Atualizar relatório" }
      end

      expect(component.to_html).to include("Atualizar relatório")
    end
  end

  describe "the client config" do
    it "ships the initial state" do
      component = render_inline(described_class.new(id: "period", months: 1))

      expect(config(component)).to include(
        "start" => "2026-08-18", "end" => "2026-08-24", "preset" => "last_7_days", "months" => 1
      )
    end

    it "ships every preset already resolved" do
      component = render_inline(described_class.new(id: "period"))

      expect(config(component)["presets"]).to include("id" => "today", "start" => "2026-08-24", "end" => "2026-08-24")
    end

    it "doesn't ship the custom preset, which has no range" do
      component = render_inline(described_class.new(id: "period"))

      expect(config(component)["presets"].map { |preset| preset["id"] }).not_to include("custom")
    end

    it "clamps months between one and two" do
      component = render_inline(described_class.new(id: "period", months: 5))

      expect(config(component)["months"]).to eq(2)
    end

    it "ships the accent classes for the given color" do
      component = render_inline(described_class.new(id: "period", color: :teal))

      expect(config(component)["classes"]["daySelected"]).to include("bg-teal-600")
    end

    it "ships the weekday labels starting on sunday" do
      component = render_inline(described_class.new(id: "period"))

      expect(config(component)["labels"]["weekdays"].first).to eq("Dom")
    end
  end
end
