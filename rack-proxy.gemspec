# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "./lib/version"

Gem::Specification.new do |s|
  s.name        = "rack-proxy"
  s.version     = RackProxy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jacek Becela"]
  s.email       = ["jacek.becela@gmail.com"]
  s.homepage    = "https://github.com/ncr/rack-proxy"
  s.summary     = %q{A request/response rewriting HTTP proxy. A Rack app.}
  s.description = %q{A Rack app that provides request/response rewriting proxy capabilities with streaming.}

  s.rubyforge_project = "rack-proxy"

  s.files         = Dir.glob("{lib}/**/*") + %w(README.md)
  s.test_files    = Dir.glob("{test,spec,features}/**/*")
  s.executables   = Dir.glob("{bin}/**/*").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rack")
  s.add_dependency("net-http-persistent")
  s.add_development_dependency("rack-test")
  s.add_development_dependency("test-unit")
end
