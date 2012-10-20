# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pennu/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Matt Parmett"
  gem.email         = "parm289@yahoo.com"
  gem.description   = %q{Ruby gem to retrieve Penn dining hall menus}
  gem.summary       = %q{Ruby gem to retrieve Penn dining hall menus}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pennu"
  gem.require_paths = ["lib"]
  gem.version       = Pennu::Ruby::VERSION
  
  gem.add_dependency "mechanize"
end
