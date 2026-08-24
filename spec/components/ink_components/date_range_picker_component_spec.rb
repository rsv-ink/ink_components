# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::DateRangePicker::Component, type: :component do
  let(:today) { Date.new(2026, 8, 24) }

  before { travel_to(today) }

  def config(component)
    JSON.parse(component.css("[data-date-range-picker]").first["data-date-range-picker-config"])
  end

  it "renders the trigger with the applied period" do
    component = render_inline(described_class.new(id: "period"))

    expect(component.css("[data-date-range-picker-target='trigger-preset']").text).to eq("Últimos 7 dias:")
    expect(component.css("[data-date-range-picker-target='trigger-range']").text).to eq("18/08/2026 - 24/08/2026")
  end

  describe "the trigger width" do
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

  describe "type" do
    it "renders both parts by default" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.css("[data-date-range-picker-target='trigger-preset']")).to be_present
      expect(component.css("[data-date-range-picker-target='trigger-range']")).to be_present
    end

    it "renders only the preset label" do
      component = render_inline(described_class.new(id: "period", type: :label))

      expect(component.css("[data-date-range-picker-target='trigger-preset']").text).to eq("Últimos 7 dias")
      expect(component.css("[data-date-range-picker-target='trigger-range']")).to be_empty
    end

    it "renders only the range" do
      component = render_inline(described_class.new(id: "period", type: :range))

      expect(component.css("[data-date-range-picker-target='trigger-preset']")).to be_empty
      expect(component.css("[data-date-range-picker-target='trigger-range']").text).to eq("18/08/2026 - 24/08/2026")
    end

    it "raises on an unknown type" do
      expect { described_class.new(id: "period", type: :nope) }.to raise_error(ArgumentError, /Invalid type/)
    end
  end

  it "renders the hidden fields with the resolved range" do
    component = render_inline(described_class.new(id: "period"))

    expect(component.css("input[name='start_date']").first["value"]).to eq("2026-08-18")
    expect(component.css("input[name='end_date']").first["value"]).to eq("2026-08-24")
    expect(component.css("input[name='preset']").first["value"]).to eq("last_7_days")
  end

  it "renders the panel closed" do
    component = render_inline(described_class.new(id: "period"))

    expect(component.css("#period-panel").first["class"]).to include("hidden")
  end

  it "renders the hint only for the active preset" do
    component = render_inline(described_class.new(id: "period", preset: "today"))

    active = component.css("[data-preset-id='today'] [data-date-range-picker-target='preset-hint']").first
    inactive = component.css("[data-preset-id='yesterday'] [data-date-range-picker-target='preset-hint']").first

    expect(active["class"]).not_to include("hidden")
    expect(inactive["class"]).to include("hidden")
  end

  describe "the submitted form" do
    def hidden_names(component)
      component.css("form input[type=hidden]").map { |input| input["name"] }
    end

    it "forwards the query params already on the page" do
      with_request_url("/users/new?status=paid&page=2") do
        component = render_inline(described_class.new(id: "period"))

        expect(hidden_names(component)).to include("status", "page", "start_date", "end_date", "preset")
        expect(component.css("form input[name=status]").first["value"]).to eq("paid")
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

    it "doesn't forward anything when submitting to another url" do
      with_request_url("/users/new?status=paid") do
        component = render_inline(described_class.new(id: "period", url: "/dashboard"))

        expect(hidden_names(component)).not_to include("status")
      end
    end
  end

  context "when a preset is given" do
    it "resolves the range from the preset" do
      component = render_inline(described_class.new(id: "period", preset: "last_month"))

      expect(component.css("input[name='start_date']").first["value"]).to eq("2026-07-01")
      expect(component.css("input[name='end_date']").first["value"]).to eq("2026-07-31")
    end
  end

  context "when explicit dates are given" do
    it "infers the matching preset" do
      component = render_inline(described_class.new(id: "period", start_date: today, end_date: today))

      expect(component.css("input[name='preset']").first["value"]).to eq("today")
    end

    it "falls back to custom when no preset matches" do
      component = render_inline(described_class.new(id: "period", start_date: Date.new(2026, 3, 3), end_date: Date.new(2026, 3, 9)))

      expect(component.css("input[name='preset']").first["value"]).to eq("custom")
    end

    it "swaps inverted dates" do
      component = render_inline(described_class.new(id: "period", start_date: today, end_date: today - 5))

      expect(component.css("input[name='start_date']").first["value"]).to eq("2026-08-19")
      expect(component.css("input[name='end_date']").first["value"]).to eq("2026-08-24")
    end
  end

  context "when presets are enabled" do
    it "renders the groups and the custom option" do
      component = render_inline(described_class.new(id: "period"))

      expect(component.to_html).to include("JANELA MÓVEL", "PERÍODO FECHADO", "Personalizado")
    end

    it "marks the active preset" do
      component = render_inline(described_class.new(id: "period", preset: "this_month"))

      selected = component.css("[data-preset-id='this_month']").first

      expect(selected["aria-pressed"]).to eq("true")
    end
  end

  context "when presets are disabled" do
    it "doesn't render the presets column" do
      component = render_inline(described_class.new(id: "period", show_presets: false))

      expect(component.css("[data-preset-id]")).to be_empty
    end
  end

  context "when campaigns are given" do
    let(:campaigns) do
      [ { id: "christmas", label: "Natal 2025", starts_on: Date.new(2025, 12, 1), ends_on: Date.new(2025, 12, 25) } ]
    end

    it "renders the campaigns group" do
      component = render_inline(described_class.new(id: "period", campaigns:))

      expect(component.to_html).to include("CAMPANHAS", "Natal 2025")
    end

    it "resolves the campaign range" do
      component = render_inline(described_class.new(id: "period", preset: "campaign:christmas", campaigns:))

      expect(component.css("input[name='start_date']").first["value"]).to eq("2025-12-01")
      expect(component.css("input[name='end_date']").first["value"]).to eq("2025-12-25")
    end
  end

  describe "the client config" do
    it "ships the initial state and the resolved presets" do
      component = render_inline(described_class.new(id: "period", months: 1))
      state = config(component)

      expect(state).to include("start" => "2026-08-18", "end" => "2026-08-24", "preset" => "last_7_days", "months" => 1)
      expect(state["presets"]).to include("id" => "today", "start" => "2026-08-24", "end" => "2026-08-24")
    end

    it "clamps months between 1 and 2" do
      component = render_inline(described_class.new(id: "period", months: 5))

      expect(config(component)["months"]).to eq(2)
    end
  end

  context "when labels are overridden" do
    it "uses the given labels" do
      component = render_inline(described_class.new(id: "period", labels: { apply: "Aplicar", presets: { "last_7_days" => "7 dias" } }))

      expect(component.to_html).to include("Aplicar", "7 dias")
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
end
