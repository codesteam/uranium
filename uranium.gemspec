# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uranium/version'

Gem::Specification.new do |spec|
  spec.name          = "uranium"
  spec.version       = Uranium::VERSION
  spec.authors       = ["stepozer", "Egrace", "distroid"]
  spec.email         = []
  spec.summary       = %q{RESTful API documentation generator}
  spec.description   = %q{Generate the documentation of your RESTful API}
  spec.homepage      = "https://github.com/codesteam/uranium"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "launchy", '~> 0'
  spec.add_development_dependency 'rspec', '~> 2.5', '>= 2.5.0'
end

