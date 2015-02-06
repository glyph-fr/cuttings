$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cuttings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cuttings"
  s.version     = Cuttings::VERSION
  s.authors     = ["Valentin Ballestrino"]
  s.email       = ["vala@glyph.fr"]
  s.homepage    = "http://github.com/glyph-fr/cuttings"
  s.summary     = "Fast & easy seeding for Rails"
  s.description = "Fast & easy seeding for Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.0"

  s.add_development_dependency "sqlite3"
end
