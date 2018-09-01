
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "what_to_watch/version"

Gem::Specification.new do |spec|
  spec.name          = "what_to_watch"
  spec.version       = WhatToWatch::VERSION
  spec.authors       = ["'George  Pianka'"]
  spec.email         = ["'gpianka1@gmail.com'"]

  spec.summary       = "Best Reviewed and Recently Added Movies/Television Based on User's Streaming Subscriptions"
  spec.description   = <<-DESCRIPTION 
  Provides Current Recommendations and Reviews from Vulture.com 
  for Best Reviewed and Recently Added Movies/Television
  Depending on the Streaming Services a User Indicates 
  They have Access to.
  DESCRIPTION
  spec.homepage      = "https://github.com/NotoriousCottonball/what_to_watch"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["what_to_watch"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"
end
