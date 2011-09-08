$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "qqfileuploader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "qqfileuploader"
  s.version     = Qqfileuploader::VERSION
  s.authors     = ["bronzle"]
  s.email       = ["byronb@gmail.com"]
  s.homepage    = ""
  s.summary     = "summary"
  s.description = "description"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0.rc8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.6"
end
