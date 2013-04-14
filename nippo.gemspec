# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nippo/version'

Gem::Specification.new do |spec|
  spec.name          = "nippo"
  spec.version       = Nippo::VERSION
  spec.authors       = ["Hiroshi Yoshida"]
  spec.email         = ["hrysd22@gmail.com"]
  spec.description   = %q{Generate nippo.}
  spec.summary       = %q{Generate nippo.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "thor"
end
