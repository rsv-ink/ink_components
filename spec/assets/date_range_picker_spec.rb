# frozen_string_literal: true

require "rails_helper"

RSpec.describe "date range picker asset" do
  it "is served through the asset pipeline" do
    expect(Rails.application.assets.find_asset("ink_components/date_range_picker.js")).to be_present
  end

  it "is linked from the engine manifest, so host apps precompile it" do
    manifest = Rails.application.assets.find_asset("ink_components_manifest.js")

    expect(manifest.links).to include(a_string_including("date_range_picker.js"))
  end

  it "declares no module syntax, since it is loaded as a classic script" do
    source = Rails.application.assets.find_asset("ink_components/date_range_picker.js").source

    expect(source).not_to match(/^\s*(import|export)\s/)
  end
end
