# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'split_num/version'

Gem::Specification.new do |spec|
  spec.name          = "split_num"
  spec.version       = SplitNum::VERSION
  spec.authors       = ["Ramon Tayag"]
  spec.email         = ["ramon.tayag@gmail.com"]
  spec.summary       = %q{Split a number into smaller parts by percentage and/or fixed values}
  spec.description   = %q{Split a number into smaller parts by percentage and/or fixed values}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
