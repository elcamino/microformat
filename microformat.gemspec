# -*- encoding: utf-8 -*-
require File.expand_path('../lib/microformat/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Townsend"]
  gem.email         = ["ryan@ryantownsend.co.uk"]
  gem.description   = %q{Reads Microformats from HTML documents}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/platformq/microformat"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "microformat"
  gem.require_paths = ["lib"]
  gem.version       = Microformat::VERSION
end
