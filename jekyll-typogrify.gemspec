# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll/typogrify/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-typogrify"
  spec.version = Jekyll::Typogrify::VERSION
  spec.summary = %q{A Jekyll plugin that improves the typography of your Liquid templates.}
  spec.description = %q{A Jekyll plugin that improves the typography of your Liquid templates.}
  spec.license = "MIT"

  spec.authors = ["Myles Braithwaite"]
  spec.email = ["me@mylesbraithwaite.com"]

  spec.homepage = "https://myles.github.io/jekyll-typogrify/"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "titlecase"
  spec.add_runtime_dependency "typogruby"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "jekyll"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.metadata["rubygems_mfa_required"] = "true"
end
