const inkComponentsConfig = require("./ink_components.tailwind.config.js")

module.exports = {
  darkMode: "class",
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    ...inkComponentsConfig.content
  ]
}
