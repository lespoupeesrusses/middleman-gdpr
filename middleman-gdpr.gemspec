$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "middleman-gdpr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "middleman-gdpr"
  s.version     = Middleman::Gdpr::VERSION
  s.authors     = ["Arnaud Levy", "Pierre-André Boissinot", 'Julien Dargelos']
  s.email       = ["alevy@lespoupees.paris", "paboissinot@lespoupees.paris", "contact@juliendargelos.com"]
  s.homepage    = "https://github.com/lespoupeesrusses/middleman-gdpr"
  s.summary     = "Helps getting your Middleman website GDPR compliant"
  s.description = "Adds a GDPR cookie consent and provides a simple checklist"
  s.license     = "MIT"

  s.files = Dir["{source,locales,lib,node_modules}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'middleman'
  s.add_dependency 'middleman-sprockets'
end
