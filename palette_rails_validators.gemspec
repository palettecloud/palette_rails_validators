# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "palette_rails_validators/version"

Gem::Specification.new do |spec|
  spec.name          = "palette_rails_validators"
  spec.version       = PaletteRailsValidators::VERSION
  spec.authors       = ["nkdn"]
  spec.email         = ["hiroyuki.nikaido@gmail.com"]

  spec.summary       = %q{ActiveModel Based Rails Validators.}
  spec.description   = %q{ActiveModel Based Rails Validators.}
  spec.homepage      = "https://github.com/palettecloud/palette_rails_validators"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", "~> 6.0"

  spec.add_development_dependency "bundler", "~> 2.2.30"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
