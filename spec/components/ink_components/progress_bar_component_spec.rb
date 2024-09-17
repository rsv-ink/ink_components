# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::ProgressBar::Component, type: :component do
  it "renders the component with the provided progress" do
    component = render_inline(described_class.new(progress: 45))

    expect(component.css("div").last["style"]).to include("width: 45%")
  end

  context "when the progress position is provided" do
    context "when the position is top" do
      it "renders a span tag to display progress" do
        component = render_inline(described_class.new(progress: 45, progress_position: :top))

        expect(component.css("span").text).to include("45%")
      end

      it "doesn't render the progress indicator inside an inner bar" do
        component = render_inline(described_class.new(progress: 45, progress_position: :top))

        expect(component.css("div").last.text.strip).to be_empty
      end
    end

    context "when the position is inside" do
      it "renders the progress indicator inside an inner bar" do
        component = render_inline(described_class.new(progress: 45, progress_position: :inside))

        expect(component.css("div").last.text).to include("45%")
      end

      it "doesn't render a span tag to display progress" do
        component = render_inline(described_class.new(progress: 45, progress_position: :inside))

        expect(component.css("span")).to be_empty
      end
    end
  end
end
