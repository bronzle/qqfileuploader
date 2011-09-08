$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "qqfileuploader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "qqfileuploader"
  s.version     = Qqfileuploader::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Qqfileuploader."
  s.description = "TODO: Description of Qqfileuploader."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0.rc8"

  s.add_development_dependency "sqlite3"
end
