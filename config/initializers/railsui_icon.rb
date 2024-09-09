# frozen_string_literal: true

RailsuiIcon.configure do |config|
  # Set the default icon variant (:solid, :outline, :mini, etc.)
  config.default_variant = :outline

  # Optionally set default classes that apply to every icon with the given variant.
  # Make sure to update your Tailwind CSS config if you enable this setting.
  # content: [
  #  "./config/initializers/railsui_icon.rb",
  # ],
  config.default_class = {
    solid: "w-6 h-6 fill-current",
    outline: "w-6 h-6 stroke-current",
    mini: "w-3 h-3 fill-current",
    micro: "w-3 h-3 fill-current"
  }
end
