say "Add tailwind rake task"
copy_file "#{__dir__}/tailwind.rake", "lib/tasks/ink_components_tailwind.rake"

say "Add generator"
copy_file "#{__dir__}/tailwind_config_generator.rb", "lib/generators/ink_components/tailwind_config_generator.rb"

say "Add tailwind config"
copy_file "#{__dir__}/tailwind.config.js", "lib/generators/ink_components/templates/tailwind.config.js"
