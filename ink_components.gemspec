require_relative "lib/ink_components/version"

Gem::Specification.new do |spec|
  spec.name        = "ink_components"
  spec.version     = InkComponents::VERSION
  spec.authors     = [ "Natan Nobre", "Karine Vieira", "Lucas Sousa" ]
  spec.email       = [ "natannobre37@gmail.com" ]
  spec.homepage    = "https://github.com/rsv-ink/ink_components.git"
  spec.summary     = "Ink components."
  spec.description = "Ink components."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rsv-ink/ink_components.git"
  spec.metadata["changelog_uri"] = "https://github.com/rsv-ink/ink_components.git"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.2"
  spec.add_dependency "view_component", "2.82.0"
end
