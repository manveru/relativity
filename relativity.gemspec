# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "relativity/version"

Gem::Specification.new do |s|
  s.name        = "relativity"
  s.version     = Relativity::VERSION
  s.authors     = ["Peter Vandenabeele"]
  s.email       = ["peter@vandenabeele.com"]
  s.homepage    = "https://github.com/petervandenabeele/relativity"
  s.summary     = %q{time and time_ranges relative to day, week, month, quarter etc.}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency 'rspec', '>= 2.7'
  s.add_development_dependency 'guard-rspec', '>= 0.5'
  if RUBY_PLATFORM.match(/linux/)
    s.add_development_dependency 'rb-inotify'
    s.add_development_dependency 'libnotify'
  end
end
