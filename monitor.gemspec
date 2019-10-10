require_relative 'lib/monitor/version'

Gem::Specification.new do |spec|
  spec.name          = "monitor"
  spec.version       = Monitor::VERSION
  spec.authors       = ["Hiroshi SHIBATA"]
  spec.email         = ["hsbt@ruby-lang.org"]

  spec.summary       = %q{Provides an object or module to use safely by more than one thread}
  spec.description   = %q{Provides an object or module to use safely by more than one thread}
  spec.homepage      = "https://github.com/ruby/monitor"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.license       = "BSD-2-Clause"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
