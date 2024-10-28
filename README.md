# InkComponents
![example workflow](https://github.com/rsv-ink/ink_components/actions/workflows/ci.yml/badge.svg)

InkComponents is a gem that implements Flowbite components using ViewComponent, providing an efficient and modular way to build interfaces in Ruby on Rails. The primary goal of this gem is to facilitate the creation and maintenance of the Reserva INK Design System, ensuring visual consistency and functionality across applications. With a component-oriented approach, InkComponents allows developers to easily integrate reusable design elements, promoting a cohesive and intuitive user experience. Additionally, the gem is designed to be flexible and customizable, meeting the specific needs of each project within the Reserva INK ecosystem.

## Usage
All of the components can be rendered via the helper wrapper:

```ruby
  alert_component(state: :success) { "Welcome!" }
```
The naming convention for helpers consists of the component's name in snake case, followed by `_component`.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "ink_components", git: "https://github.com/rsv-ink/ink-components.git", tag: "v0.1.0"
```

And then execute:
```bash
$ bundle
```
```bash
$ bundle exec rails ink_components:install
```

```bash
$ bundle exec rails ink_components:tailwind_config
```

Update the `tailwind.config.js` file of the project to include the paths of the engine components. Add the following code snippet to the `tailwind.config.js` file:
```javascript
// Add this line
const inkComponentsConfig = require("./ink_components.tailwind.config.js");

module.exports = {
  // ...Other configs
  content: [
    // ...Other paths
    ...inkComponentsConfig.content, // Add this line
  ],
};
```

Then add the `ink_components.tailwind.config.js` file to the .gitignore of the project.

And execute:

```bash
$ yarn build:css
```

## Development
To get started:

1. Run: `bundle install`
2. Run: `bin/setup`
3. Run: `bin/dev`

Then, access the Lookbook Preview at: localhost:3000/ink_components/lookbook

To run tests: `bin/test`

## Contributing
We welcome contributions. Here are some ways you can help:

1. **Reporting Issues**: If you encounter a bug, please open a new issue in our repository with a clear description of the problem.
2. **Requesting Features**: Have an idea for a new feature? We’d love to hear it! Open an issue to discuss your suggestion.
3. **Pull Requests**: If you want to contribute code, fork the repository, make your changes, and submit a pull request. Please ensure you follow the coding style guidelines.
4. **Testing**: When adding new features, include tests to ensure everything continues to work as expected. Run existing tests to verify that there are no regressions.
5. **Development Environment**: Follow the instructions in the README to set up your environment and get started with contributing!

We appreciate all our contributors for their support and contributions.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
