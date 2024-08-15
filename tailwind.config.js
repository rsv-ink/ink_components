module.exports = {
  plugins: [require("flowbite/plugin")],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/ink_components/**/*.html.erb',
    './app/components/ink_components/**/*.rb',
    "./node_modules/flowbite/**/*.js"
  ]
}