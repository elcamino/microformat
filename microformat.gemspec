# -*- encoding: utf-8 -*-
require File.expand_path("../lib/microformat/version", __FILE__)

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
end
