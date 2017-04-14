# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'switch_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = "switch_proxy"
  spec.version       = SwitchProxy::VERSION
  spec.author       = "Mircea Samuila"
  spec.authors       = ["Mircea Samuila"]
  spec.email         = ["mrcc87@gmail.com"]

  spec.summary       = %q{It set's up the http and https proxy in the ubuntu console.}
  spec.description   = %q{It set's up the http and https proxy in the ubuntu console. It inserts two lines in the .bashrc file definign and exporting the http_proxy and https_proxy with the values in the .switch_proxy file. It also adds the proxy to the /etc/apt/apt.conf file to allow updates from the console.}
  spec.homepage      = "https://github.com/mrcc87/switch_proxy"
  spec.license       = "MIT"
  spec.platform      = Gem::Platform::RUBY

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~>0.19.4" 

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  #spec.add_development_dependency "climate_control", "~> 0.1.0"
end
