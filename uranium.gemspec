# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "uranium/version"

Gem::Specification.new do |s|
  s.name        = "uranium"
  s.version     = Uranium::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["stepozer", "Egrace", "distroid"]
  s.email       = []
  s.homepage    = "https://github.com/codesteam/uranium"
  s.summary     = %q{Documentation generator}
  s.description = %q{Generate the documentation of your RESTful API}

  s.add_runtime_dependency "launchy", '~> 0'
  s.add_development_dependency 'rspec', '~> 2.5', '>= 2.5.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

