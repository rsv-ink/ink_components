const inkComponentsConfig = require("./ink_components.tailwind.config.js")

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    ...inkComponentsConfig.content
  ]
}
