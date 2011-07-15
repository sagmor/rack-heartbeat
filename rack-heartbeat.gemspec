# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "rack-heartbeat"
  s.version     = '0.9.0'
  s.authors     = ["Sebastian Gamboa"]
  s.email       = ["me@sagmor.com"]
  s.homepage    = "https://github.com/sagmor/rack-heartbeat"
  s.summary     = %q{Health check your app}
  s.description = %q{REALLY, REALLY simple rack app to check that your stack is up and running}

  s.rubyforge_project = "rack-heartbeat"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
