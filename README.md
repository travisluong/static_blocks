# Static Blocks

Static Blocks is an ultra light-weight CMS for Ruby on Rails.

Create snippets of content. Place them anywhere in your views.

## Features
* Simple admin interface
* i18n internationalization support
* Optional http basic authentication
* Search
* wysihtml5 editor
* csv import & export

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

Ensure that engine is mounted in routes.rb:

```ruby
mount StaticBlocks::Engine => "/static_blocks"
```

## Usage

Visit `/static_blocks` and create some static blocks.

Use the `snippet_for` method or it's alias `s` to output a block onto any view template. Pass in the title of the static block as argument. Use `raw` if you do not want to escape the html.

```
<%=raw snippet_for('foo') %>
<%=raw s('foo') %>
```

## Configuration

When you ran the install generator, a configuration file should have been created in config/initializers/static_blocks.rb:

```ruby
StaticBlocks.config do |config|
  config.locales = ['en']
  config.http_auth = false
  config.username = ENV['STATIC_BLOCKS_USERNAME']
  config.password = ENV['STATIC_BLOCKS_PASSWORD']
  config.wysihtml5 = true
end
```

### i18n Internationalization

Static Blocks supports i18n internationalization. Pass in an array of locales to it's config option:

```ruby
config.locales = ['en', 'wk', 'pirate']
```

### Optional http basic authentication

Static Blocks has an optional http basic authentication which is turned off by default. To activate, set the config option to true and create environment variables for the username and password.

```ruby
config.http_auth = true
```

### wysihtml5 editor
Static Blocks uses the wysihtml5 editor which is turned on by default. To deactive, set the config option to false.

## Credits
Created by Travis Luong

## License
[MIT](http://opensource.org/licenses/MIT)
