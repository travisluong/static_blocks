# Static Blocks

Static Blocks is a light-weight CMS for Ruby on Rails.

Create snippets of content. Place them anywhere in your views.

## Features
* Simple admin interface
* i18n multilingual support
* Optional http basic authentication
* Search
* wysihtml5 editor
* csv import & export

## Installation

Add the following to `Gemfile`:

```ruby
gem 'static_blocks'
```

Run bundle:

```shell
bundle install
```

Run static blocks install generator:

```shell
rails generate static_blocks:install
```

Run migrations:

```shell
rake db:migrate
```

Check that Engine has been mounted in `config/routes.rb`:

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

During installation, a configuration file should have been created in `config/initializers/static_blocks.rb`:

```ruby
StaticBlocks.config do |config|
  config.http_auth = false
  config.username = ENV['STATIC_BLOCKS_USERNAME']
  config.password = ENV['STATIC_BLOCKS_PASSWORD']
  config.wysihtml5 = true
  config.globalize = false
  config.locales = ['en']
end
```

### i18n Internationalization

Static Blocks supports i18n internationalization. To active, follow the steps below:

#### Step 1

Set globalize option to true.

```ruby
config.globalize = true
```

#### Step 2

Pass in an array of locales.

```ruby
config.locales = ['en', 'wk', 'pirate']
```

#### Step 3

Skip this step if you are starting without any existing snippets. If you are enabling i18n on a site with existing snippets, you must export and import the snippets in order to copy them to the default locale.

### Optional http basic authentication

Static Blocks has an optional http basic authentication which is turned off by default. To activate, set the http_auth option to true and create environment variables for the username and password.

```ruby
config.http_auth = true
```

If you are using Devise and prefer to use that instead, you could probably do something like this in `config/routes.rb`:

```ruby
authenticate :admin_user do
  mount StaticBlocks::Engine => "/static_blocks"
end
```

### wysihtml5 editor
Static Blocks uses the wysihtml5 editor which is turned on by default. To deactive, set the wysihtml5 option to false.

```ruby
config.wysihtml5 = false
```

## Credits
Created by Travis Luong

## License
[MIT](http://opensource.org/licenses/MIT)
