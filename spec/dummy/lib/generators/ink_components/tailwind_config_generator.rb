module InkComponents
  class TailwindConfigGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def create_tailwind_config_file
      @ink_components_paths = [
        "#{InkComponents::Engine.root}/app/views/**/*.html.erb",
        "#{InkComponents::Engine.root}/app/helpers/**/*.rb",
        "#{InkComponents::Engine.root}/app/assets/stylesheets/**/*.css",
        "#{InkComponents::Engine.root}/app/javascript/**/*.js",
        "#{InkComponents::Engine.root}/app/components/ink_components/**/*.html.erb",
        "#{InkComponents::Engine.root}/app/components/ink_components/**/*.rb",
      ]

      template "tailwind.config.js", "ink_components.tailwind.config.js"
    end
  end
end
