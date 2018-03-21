# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/soon/version"

Gem::Specification.new do |spec|
  spec.name          = "soon"
  spec.version       = Soon::VERSION
  spec.authors       = ["Matti Paksula"]
  spec.email         = ["matti.paksula@iki.fi"]

  spec.summary       = %q{Retries a block until it does not raise with a timeout}
  spec.description   = %q{Retries a block until it does not raise with a timeout}
  spec.homepage      = "https://www.github.com/matti/soon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
