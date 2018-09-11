# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dnb/direct/version'

Gem::Specification.new do |spec|
  spec.name          = "dnb-direct-ruby"
  spec.version       = DnB::Direct::VERSION
  spec.authors       = ["Jason Ihaia"]
  spec.email         = ["ihaiaj@dnb.com"]

  spec.summary       = 'A Ruby GEM to provide access to DnB APIs.'
  spec.description   = 'A Ruby GEM to provide access to DnB APIs.'
  spec.homepage      = 'https://developer.dnb.com'
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", '> 3.0', '< 5.1'
  spec.add_dependency "faraday", '~> 0.9.1'
  spec.add_dependency "colored"
  spec.add_dependency 'virtus', '~> 1.0.3'
  spec.add_dependency 'kartograph'
  spec.add_dependency 'bunny'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

end
