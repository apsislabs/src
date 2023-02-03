
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simple_rails_configurator/version"

Gem::Specification.new do |spec|
  spec.name          = "simple_rails_configurator"
  spec.version       = SimpleRailsConfigurator::VERSION
  spec.authors       = ["Henry Keiter"]
  spec.email         = ["henry@apsis.io"]

  spec.summary       = 'Quickly import ERB configs from anywhere.'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 10.0"
end
