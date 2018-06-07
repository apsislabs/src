# SimpleRailsConfigurator

Easily load custom yml configuration files into the Rails environment.

Features:

- ERB support
- Supports per-environment configurations within loaded files
- Injects configurations directly into `Rails.application.config`
- Local overrides with `.override` files
- Recursive directory traversal

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_rails_configurator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_rails_configurator

## Usage

In `environment.rb`, `require` this gem and then add `SimpleRailsConfigurator::configure!('PATH_TO_CUSTOM_CONFIG_DIR')`. The default path is `app/config/custom` if you don't pass an argument to `configure!`.

To create a local override (parsed only when `Rails.env == 'local'`), for the file `foo_config.yml`, create `foo_config.yml.override`. Any values set in this file will override those in `foo_config.yml`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
