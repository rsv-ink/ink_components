# frozen_string_literal: true

module InkComponents
  module DateRangePicker
    module Types
      class Preview < Lookbook::Preview
        CAMPAIGNS = InkComponents::DateRangePicker::Preview::CAMPAIGNS

        # Default layout: presets column on the left, two navigable months.
        def with_presets
          date_range_picker_component(id: "with-presets-date-range-picker", submit_on_apply: false)
        end

        # Calendar only, without the presets column.
        def without_presets
          date_range_picker_component(id: "without-presets-date-range-picker", show_presets: false, submit_on_apply: false)
        end

        # A single month, for narrow spaces.
        def single_month
          date_range_picker_component(id: "single-month-date-range-picker", months: 1, submit_on_apply: false)
        end

        # Custom preset group fed by application data.
        def campaigns
          date_range_picker_component(id: "campaigns-date-range-picker", campaigns: CAMPAIGNS, submit_on_apply: false)
        end

        # Trigger with the preset label only.
        def label_only
          date_range_picker_component(id: "label-only-date-range-picker", type: :label, campaigns: CAMPAIGNS, submit_on_apply: false)
        end

        # Trigger with the period only.
        def range_only
          date_range_picker_component(id: "range-only-date-range-picker", type: :range, campaigns: CAMPAIGNS, submit_on_apply: false)
        end
      end
    end
  end
end
