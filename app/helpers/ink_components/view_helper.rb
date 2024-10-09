# frozen_string_literal: true

module InkComponents
  module ViewHelper
    # Define all components helpers that follow the folder naming convention:
    # app/components/ink_components/{component_name}/component.rb
    # or
    # app/components/ink_components/forms/{component_name}/component.rb

    COMPONENTS = Dir["app/components/ink_components/*", "app/components/ink_components/forms/*"]
                   .reject { |path| path.include?(".rb") }
                   .each_with_object({}) do |directory_path, hash|
      component_name = directory_path.split("/").last.to_sym
      next if component_name == :forms

      component_class = "InkComponents#{'::Forms' if directory_path.include?('forms')}::#{component_name.to_s.camelize}::Component"
      hash[component_name] = component_class
    end.freeze

    COMPONENTS.each do |component, klass|
      define_method("ink_#{component}") do |**kwargs, &block|
        component_klass = klass.constantize
        render component_klass.new(**kwargs), &block
      end
    end
  end
end
