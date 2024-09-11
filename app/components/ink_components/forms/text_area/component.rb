# frozen_string_literal: true

module InkComponents
  module Forms
    module TextArea
      class Component < ApplicationComponent
        style do
          base {
            %w[
              block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300
              focus:ring-pink-500 focus:border-pink-500 dark:bg-gray-700 dark:border-gray-600
              dark:placeholder-gray-400 dark:text-white dark:focus:ring-pink-500 dark:focus:border-pink-500
            ]
          }
        end

        def initialize(**extra_attributes)
          super(**extra_attributes)
        end

        private
        def default_attributes
          { class: style }
        end
      end
    end
  end
end
