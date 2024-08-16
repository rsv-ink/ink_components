require 'rails/generators'

namespace :ink_components do
  desc "generates your tailwind config file"
  task :tailwind_config do
    Rails::Generators.invoke("ink_components:tailwind_config", ["--force"])
  end
end

if Rake::Task.task_defined?("css:build")
  Rake::Task["css:build"].enhance(["tailwindcss:config"])
else
  raise "css:build task not found"
end
