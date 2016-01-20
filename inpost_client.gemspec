# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inpost_client/version'

Gem::Specification.new do |spec|
  spec.name          = "inpost_client"
  spec.version       = InpostClient::VERSION
  spec.authors       = ["Konrad Ryłko"]
  spec.email         = ["konrad.rylko@gmail.com"]

  spec.summary       = "Very simple client for sample Inpost Machines API"
  spec.description   = "Very simple client for sample Inpost Machines API"
  spec.homepage      = "http://konradrylko.pl"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"
  spec.add_runtime_dependency "httparty", "~> 0.13.7"
  spec.add_runtime_dependency "nokogiri", "~> 1.6.6"
end
