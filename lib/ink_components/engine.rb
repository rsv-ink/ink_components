module InkComponents
  class Engine < ::Rails::Engine
    isolate_namespace InkComponents

    initializer "ink_components.assets.precompile" do |app|
      app.config.assets.precompile += %w[ink_components_manifest.js]
    end
  end
end
