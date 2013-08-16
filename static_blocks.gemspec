$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "static_blocks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "static_blocks"
  s.version     = StaticBlocks::VERSION
  s.authors     = ["Travis Luong"]
  s.email       = ["travis@travisluong.com"]
  s.homepage    = "https://github.com/travisluong/static_blocks"
  s.summary     = "Static Blocks is an ultra light-weight CMS for Ruby on Rails."
  s.description = "Create static blocks of content. Place them anywhere in your views."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "jquery-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "bootstrap-wysihtml5-rails"
  s.add_dependency "ransack"
  s.add_dependency "kaminari"
  s.add_dependency "bootstrap-kaminari-views"
  s.add_dependency "globalize3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "populator"
  s.add_development_dependency "brakeman"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "launchy"
end
