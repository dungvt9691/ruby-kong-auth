# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby-kong-auth/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-kong-auth"
  spec.version       = RubyKongAuth::VERSION
  spec.authors       = ["Dang Tung Lam", "Dung Vu The"]
  spec.email         = ["dangtunglam14@gmail.com", "dungvt9691@gmail.com"]

  spec.summary       = "A Ruby client for the Kong Auth API (https://getkong.org/plugins/)"
  spec.description   = "A Ruby client for the Kong Auth API"
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = " 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "0.10.3"

  spec.add_dependency "unirest", '1.1.2'
end
