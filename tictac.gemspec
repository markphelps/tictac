# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tictac/version'

Gem::Specification.new do |spec|
  spec.name          = "tictac"
  spec.version       = Tictac::VERSION
  spec.authors       = ["Mark Phelps"]
  spec.email         = ["mark.aaron.phelps@gmail.com"]
  spec.summary       = %q{A game of Tic Tac Toe.}
  spec.homepage      = %q{https://github.com/markphelps/tictac}
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorize", "~> 0.8.1"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 11.3.0"
  spec.add_development_dependency "minitest", "~> 5.10.1"
end
