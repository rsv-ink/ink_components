# frozen_string_literal: true

module InkComponents
  module Forms
    module Dropzone
      class Preview < Lookbook::Preview
        def default
          render InkComponents::Forms::Dropzone::Component.new(id: "input-file") do |dropzone|
            dropzone.with_label_text(class: "text-gray-500 font-semibold") { "Click to upload or drag and drop" }
            dropzone.with_helper_text { "SVG, PNG, JPG or GIF (MAX. 800x400px)" }
          end
        end
      end
    end
  end
end
