# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bottle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dusty Candland"]
  gem.email         = ["candland@gmail.com"]
  gem.description   = %q{IoC for ruby}
  gem.summary       = %q{IoC for ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bottle"
  gem.require_paths = ["lib"]
  gem.version       = Bottle::VERSION
end
