# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "microformat/version"

Gem::Specification.new do |s|
  s.authors       = ["Ryan Townsend"]
  s.email         = ["ryan@ryantownsend.co.uk"]
  s.description   = %q{Reads Microformats from HTML documents}
  s.summary       = s.description
  s.homepage      = "https://github.com/platformq/microformat"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = "microformat"
  s.require_paths = ["lib"]
  s.version       = Microformat::VERSION
  
  # gems
  s.add_dependency "nokogiri"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
