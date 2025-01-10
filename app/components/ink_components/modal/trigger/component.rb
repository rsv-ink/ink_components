# frozen_string_literal: true

module InkComponents
  module Modal
    module Trigger
      class Component < ApplicationComponent
        def call
          content
        end

        def render?
          content.present?
        end
      end
    end
  end
end
