module.exports = {
    plugins: [require("flowbite/plugin")],
    content: [
        <%= @ink_components_paths.map { |path| "'#{path}'" }.join(",\n") %>,
    ],
    safelist: [
        "font-inter",
        "font-poppins",
    ]
}
