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
  s.summary     = "Summary of StaticBlocks."
  s.description = "Description of StaticBlocks."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
