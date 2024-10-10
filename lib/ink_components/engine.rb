module InkComponents
  class Engine < ::Rails::Engine
    isolate_namespace InkComponents

    initializer "ink_components.assets.precompile" do |app|
      app.config.assets.precompile += %w[ink_components_manifest.js]
    end

    initializer "InkComponents setup lookbook" do
      Engine.config.lookbook.project_name = "ink components"
      Engine.config.lookbook.preview_paths = [ InkComponents::Engine.root.join("app/components") ]
      Engine.config.lookbook.preview_params_options_eval = true
      Engine.config.lookbook.preview_layout = "ink_components_lookbook"
      Engine.config.lookbook.ui_theme = "rose"
      Engine.config.lookbook.preview_display_options = {
        theme: [ "light", "dark" ]
      }
    end

    initializer "InkComponents setup helper" do
      Engine.config.to_prepare do
        Lookbook::Preview.include InkComponents::ViewHelper
        ActionController::Base.helper InkComponents::ViewHelper
      end
    end
  end
end
