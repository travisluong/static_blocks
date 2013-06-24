# Static Blocks

Static Blocks is an ultra light-weight CMS for Ruby on Rails.

This gem may be useful if you:

* Want an easy way to manage pieces of content on your Rails app
* Want to give clients the ability to make copy changes
* Want a light CMS that is easy to integrate with existing apps
* Do not want to hard code content into view templates
* Do not want to pollute git repo with copy changes
* Do not want to use a heavy CMS

## Features
* Simple admin interface
* i18n internationalization support
* Optional http basic authentication
* Search
* wysihtml5 editor

## Installation

Add the following to Gemfile:

```ruby
gem 'static_blocks'
```

Run bundle from shell:

```shell
bundle install
```

Run static blocks install generator from shell:

```shell
rails generate static_blocks:install
```

Run migrations:

```shell
rake db:migrate
```

Mount engine in routes.rb:

```ruby
mount StaticBlocks::Engine => "/static_blocks_admin"
```

## Configuration

When you ran the install generator, a configuration file should have been created in config/initializers/static_blocks.rb:

```ruby
StaticBlocks.config do |config|
  config.locales = ['en']
  config.http_auth = true
  config.username = ENV['STATIC_BLOCKS_USERNAME'] || 'admin'
  config.password = ENV['STATIC_BLOCKS_PASSWORD'] || 'password'
end
```

### i18n Internationalization

Static Blocks supports i18n internationalization. Pass in an array of locales to it's config option:

```ruby
config.locales = ['en', 'wk', 'zh', 'pirate']
```

### Optional http basic authentication

Static Blocks also has an optional http basic authentication which is turned on by default. You will have to set environment variables for the username and password if you choose to use http basic authentication. If you have your own authentication, you can turn off http auth by setting it's option to false.


## Usage

Visit `/static_blocks_admin` and create some static blocks.

Use the `static_block_for` method or it's alias `s` to output a block onto any view template. Pass in the title of the static block as argument. Use `raw` if you do not want to escape the html.

```xml
<%=raw static_block_for('foo') %>
<%=raw s('foo') %>
```

## Credits
Written by Travis Luong

## License
[MIT](http://opensource.org/licenses/MIT)
