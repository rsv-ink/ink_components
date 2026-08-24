# frozen_string_literal: true

module InkComponents
  module DateRangePicker
    module Types
      class Preview < Lookbook::Preview
        CAMPAIGNS = InkComponents::DateRangePicker::Preview::CAMPAIGNS

        def with_presets
          date_range_picker_component(id: "with-presets-date-range-picker", submit_on_apply: false)
        end

        def without_presets
          date_range_picker_component(id: "without-presets-date-range-picker", show_presets: false, submit_on_apply: false)
        end

        def single_month
          date_range_picker_component(id: "single-month-date-range-picker", months: 1, submit_on_apply: false)
        end

        def campaigns
          date_range_picker_component(id: "campaigns-date-range-picker", campaigns: CAMPAIGNS, submit_on_apply: false)
        end

        def label_only
          date_range_picker_component(id: "label-only-date-range-picker", type: :label, campaigns: CAMPAIGNS, submit_on_apply: false)
        end

        def range_only
          date_range_picker_component(id: "range-only-date-range-picker", type: :range, campaigns: CAMPAIGNS, submit_on_apply: false)
        end
      end
    end
  end
end
