# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'pair/version'

Gem::Specification.new do |gem|
  gem.name = "pair"
  gem.version = Pair::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.author = "Ideal Project Group Team"
  gem.email = "team@idealprojectgroup.com"
  gem.homepage = "https://github.com/idealprojectgroup/pair"
  gem.summary = "Command-line tool for remote pair programming"
  gem.description = "This gem allows you to setup a remote pair programming session with one command."

  gem.license = 'MIT'

  gem.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  gem.executables = ["pair"]
  gem.default_executable = "pair"
  gem.require_path = 'lib'

  gem.test_files = Dir.glob("spec/**/*")

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
end
