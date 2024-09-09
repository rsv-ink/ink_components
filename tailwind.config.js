module.exports = {
    plugins: [require("flowbite/plugin")],
    theme: {
        extend: {
            screens: {
                '3xl': '1889px',
            },
        },
        fontFamily: {
            inter: ['Inter', 'sans-serif'],
            poppins: ['Poppins', 'sans-serif']
        }
    },
    content: [
        './config/initializers/railsui_icon.rb',
        './app/views/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        './app/javascript/**/*.js',
        './app/components/ink_components/**/*.html.erb',
        './app/components/ink_components/**/*.rb',
        "./node_modules/flowbite/**/*.js"
    ],
    safelist: [
        "font-inter",
        "font-poppins",
    ]
}
